import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<Widget> notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            setState(() {
              notifications = dummyNotifications();
            });
          },
        ),
        title: Text('Notifications', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/PushNotifications.png'),
            Text(
              'No notification yet !',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF161C2B),
                fontSize: 24,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                height: 0.05,
              ),
            ),
            Text(
              'Your notifications will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6F6F79),
                fontSize: 14,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        ),
      )
          : ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Today', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...notifications,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Yesterday', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...notifications,
        ],
      ),
    );
  }

  List<Widget> dummyNotifications() {
    return List<Widget>.generate(
      5,
          (index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/50'),
        ),
        subtitle: Text('This is a dummy notification'),
        trailing: Text('12:00 PM'),
      ),
    );
  }
}