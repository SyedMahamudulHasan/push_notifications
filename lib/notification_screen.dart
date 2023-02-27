import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const id = "/notification";

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _requestPermissions() async {
    // ios app permission
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    // android app permission
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
          'dbfoo',
          'dbfoo',
          importance: Importance.high,
        ));
  }

  Future<void> _showNotification() async {
    // setup notifications details.
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'dbfoo',
      'dbfoo',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    //get data
    // final QuerySnapshot data =
    //     await FirebaseFirestore.instance.collection("notifications").get();

    // for (var element in data.docs) {
    //   flutterLocalNotificationsPlugin.show(
    //     0,
    //     'This is a title',
    //     //element["notification"],
    //     body,
    //     platformChannelSpecifics,
    //   );
    // }

    final Stream<QuerySnapshot> data =
        FirebaseFirestore.instance.collection("notifications").snapshots();

    data.listen((event) {
      flutterLocalNotificationsPlugin.show(
        0,
        'title',
        event.docs[0]["notification"],
        platformChannelSpecifics,
      );
    });
  }

  @override
  void initState() {
    _requestPermissions();
    _showNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("notifications").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // _showNotification(snapshot.data!.docs[0]["notification"]);
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(snapshot.data!.docs[index]["notification"]);
                });
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
