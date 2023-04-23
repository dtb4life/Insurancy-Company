//import 'client_screen.dart';
//import 'agent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
//import 'package:device_preview/device_preview.dart';

import 'interface.dart';



void main() {
  runApp(
        MaterialApp(
          title: 'Страховая фирма',
          debugShowCheckedModeBanner: false,
          home: InsuranceApp(),
          
        ),
      
    );
      AwesomeNotifications().initialize(
          null,
          [
            NotificationChannel(
              channelKey: 'basic', 
              channelName: 'Basic notifications', 
              channelDescription: 'Channel 4 tests')
          ],
          debug:true,
        );
}



