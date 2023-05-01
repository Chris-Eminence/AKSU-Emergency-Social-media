import 'dart:convert';

import 'package:aksustack/utils/project_colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({Key? key}) : super(key: key);

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {

  void sendNotificationToAllUsers() async {
    String serverToken = 'key=AAAAtaibhKE:APA91bF0uWO2Y_y9rmvyZ4cCwFms0wMxv7gCCcMarMNpZg79ujTrQO3NMzCxm-YvtmLNX3wXN4WBgAUTHe7KIoTSuWgzTSEEby7IKEofPqXCipHpGKG0daoZpDWaXorIuER2EvYt3uhD';

    // Replace with your own notification payload
    var notification = {
      'notification': {
        'title': typesOfEmergencyValue,
        'body': locationSelectedValue
      },
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',

      },
      'topic': 'all_users'
    };

    // Send the notification to FCM
    var response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken'
      },
      body: jsonEncode(notification),
    );

    if (response.statusCode == 200) {
      // Notification sent successfully
    } else {
      // Error sending notification
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String? title = message.notification!.title;
      String? body = message.notification!.body;
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 123,
          channelKey: "call_channel",
          color: Colors.white,
          body: body,
          title: title,
          category: NotificationCategory.Call,
          wakeUpScreen: true,
          fullScreenIntent: true,
          backgroundColor: AppColors.primaryColor,
        ),
        actionButtons: [
          NotificationActionButton(
            key: "VIEW",
            label: "View Emergency",
            autoDismissible: false,
            color: Colors.greenAccent,
          ),
        ],
      );
      AwesomeNotifications().actionStream.listen((event) {
        print("Notification Registered");


      });
    });
  }

  String? locationSelectedValue = 'Ikot Akpaden';
  String? typesOfEmergencyValue = 'Accident';
  String? descriptionText;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GestureDetector(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColors.black,
          ),
        ),
        title: Text(
          'Emergency Form',
          style: GoogleFonts.nunito(
              color: AppColors.black, fontWeight: FontWeight.w700),
        ),
      ),

      /*
      BODY
       */
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please, fill the \nemergency form',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              /*
              Type of emergency container
               */
              Text(
                'Type of emergency',
                style: GoogleFonts.nunito(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  items: <String>['Accident', 'Robbery', 'Cult clash', 'INEC']
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          value,
                          style: GoogleFonts.nunito(
                              color: AppColors.greyShade,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      typesOfEmergencyValue = newValue;
                    });
                    // Add your code here to handle the dropdown selection.
                    print(typesOfEmergencyValue);
                  },
                  value: typesOfEmergencyValue,
                  iconEnabledColor: AppColors.white,
                  iconDisabledColor: AppColors.white,
                  underline: const SizedBox(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*
              Location
               */
              Text(
                'Location',
                style: GoogleFonts.nunito(fontSize: 20),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  items: <String>[
                    'Ikot Akpaden',
                    'Ikot Obio Ndoho',
                    'Ekim',
                    'Ikot Oyoro',
                    'Ikot Ekong',
                    'Ikot Enin'
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          value,
                          style: GoogleFonts.nunito(
                              color: AppColors.greyShade,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    print(newValue);
                    setState(() {
                      locationSelectedValue = newValue;
                    });
                  },
                  value: locationSelectedValue,
                  iconEnabledColor: AppColors.white,
                  iconDisabledColor: AppColors.white,
                  underline: const SizedBox(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              /*
              Description
               */
              Text(
                'Description',
                style: GoogleFonts.nunito(fontSize: 20),
              ),
              Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 7), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      maxLines: null, // Allow multiline input
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type your text here',
                        hintStyle: GoogleFonts.nunito(),
                      ),

                      onChanged: (text) {
                        descriptionText = text;
                        print(descriptionText);
                      },
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 7), // changes position of shadow
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () async {
                    sendNotificationToAllUsers();

                    sendPushNotification();
                    String? tokenForNotification =
                        await FirebaseMessaging.instance.getToken();

                    print(
                        'location is: $locationSelectedValue and the kind of emergency is: $typesOfEmergencyValue, here is the description: $descriptionText \n token is: $tokenForNotification`');
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.nunito(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendPushNotification() async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-type' : 'application/json; charset=UTF-8',
          'Authorization' : 'key=AAAAtaibhKE:APA91bF0uWO2Y_y9rmvyZ4cCwFms0wMxv7gCCcMarMNpZg79ujTrQO3NMzCxm-YvtmLNX3wXN4WBgAUTHe7KIoTSuWgzTSEEby7IKEofPqXCipHpGKG0daoZpDWaXorIuER2EvYt3uhD',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification' : <String, dynamic>{
              'body' : locationSelectedValue,
              'title' : typesOfEmergencyValue,
            },
            'priority' : 'high',
            'data' : <String, dynamic>{
              'click_action' : 'FLUTTER_NOTIFICATION_CLICK',
              'id' : '1',
              'status' : 'done'
            },
            'to' : 'dbb9L3QXQze1e_ExOoooSF:APA91bFm2ZdkCyx75_pP1152wGwOCa1akU-5n7unAta089ZafFetjIyGE3T1bn-a6pnqCw9ucIdxtJdsu0C3WSoyyyA5bp0F6Nmi6qPnfFSb5avb-D3N9gjfeVWe8Hady0Rd0IYBxIZ3',
          }
        )

      );
      response;
    }catch(e){
      e;
    }
  }
}
