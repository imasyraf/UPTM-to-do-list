// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> localNotification(
  String? taskName,
  String? taskDesc,
  String? startDate,
  String? endDate,
) async {
  // Initialize the FlutterLocalNotificationsPlugin
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Configure the Android initialization settings
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // Configure the initialization settings for iOS and macOS if needed
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettingsMacOS = MacOSInitializationSettings();

  // Combine all initialization settings
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    macOS: initializationSettingsMacOS,
  );

  // Initialize the plugin with the settings
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Configure the Android notification details
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    channelDescription: 'Your channel description', // Optional
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Configure iOS notification details if needed
  var iOSPlatformChannelSpecifics = IOSNotificationDetails();

  // Combine all platform-specific settings
  var notificationDetails = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: iOSPlatformChannelSpecifics,
  );

  // Forming the notification content
  String notificationTitle = "Task Reminder: $taskName";
  String notificationBody = "Start: $startDate - End: $endDate";

  // Show the notification
  await flutterLocalNotificationsPlugin.show(
    0, // Notification ID
    notificationTitle, // Notification Title
    notificationBody, // Notification Body/Content
    notificationDetails,
    payload: 'Additional Payload', // Optional payload
  );
}

IOSNotificationDetails() {}

MacOSInitializationSettings() {}

IOSInitializationSettings() {}
