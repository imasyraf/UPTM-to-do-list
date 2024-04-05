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

import 'package:intl/intl.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

Future<void> scheduleNotification(
  String? taskName,
  String? taskDesc,
  String? startDate,
  String? endDate,
) async {
  // Check if startDate is null or empty
  if (startDate == null || startDate.isEmpty) {
    print('Error: startDate is null or empty');
    return;
  }

  // Print the provided start date for debugging
  print('Start Date: $startDate');

  // Display action for notification when startDate is set
  String notificationContent =
      'UPTM To-do list $taskName\ncheck your date now $startDate until $endDate';

  // Initialize the timezone database
  tzdata.initializeTimeZones();

  // Schedule notification based on the provided startDate
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the Android-specific settings for the notification
  var androidSettings = AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.high,
    priority: Priority.high,
    icon:
        '@mipmap/ic_launcher', // Replace with your small icon name without the extension
  );

  // Initialize the notification details
  var notificationDetails =
      NotificationDetails(android: androidSettings, iOS: null);

  // Get the device's timezone
  var deviceTimeZone = tz.local;

  try {
    // Parse the startDate string into a DateTime object
    DateTime parsedStartDate = DateFormat('d/M h:mm a').parse(startDate);

    // Convert the startDate to the device's timezone
    var scheduledStartDate =
        tz.TZDateTime.from(parsedStartDate, deviceTimeZone);

    // If the scheduled time is in the past, don't schedule the notification
    if (scheduledStartDate.isBefore(DateTime.now())) {
      print('Error: Scheduled time is in the past');
      return;
    }

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Notification Title', // Replace with your desired title
      notificationContent,
      scheduledStartDate,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'Custom_Sound',
    );

    print('Notification scheduled successfully');
  } catch (e) {
    print('Error scheduling notification: $e');
  }
}
