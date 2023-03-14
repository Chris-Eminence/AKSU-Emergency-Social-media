import 'package:aksustack/utils/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({Key? key}) : super(key: key);

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {
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
                  onTap: () {
                    print(
                        'location is: $locationSelectedValue and the kind of emergency is: $typesOfEmergencyValue, here is the description: $descriptionText');
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
}
