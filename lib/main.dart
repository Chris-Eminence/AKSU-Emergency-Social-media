import 'package:aksustack/repository/authentication_repo/authenticstion_repo.dart';
import 'package:aksustack/screens/home_page.dart';
import 'package:aksustack/utils/project_colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
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
          autoDismissible: true,
          color: Colors.greenAccent),
    ],
  );
}

Future<void> main() async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: "call_channel",
          channelName: "Call Channel",
          channelDescription: "channel of calling",
          defaultColor: Colors.redAccent,
          ledColor: Colors.white,
          importance: NotificationImportance.Max,
          defaultRingtoneType: DefaultRingtoneType.Ringtone,
          channelShowBadge: true,
          locked: true),
    ],
  );
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fiddle',
      theme: ThemeData(),
      home: const Homepage(),
    );
  }
}
