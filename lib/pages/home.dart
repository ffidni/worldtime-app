import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List<Timer> timers = [];

  void updateTime() {
    setState(() {
      data["time"] = data["time"].add(Duration(minutes: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    //set background
    String bgImage = data["daytime"] ? "day.jpg" : "night.jpg";
    if (timers.length > 0) {
      timers[0].cancel();
      timers.remove(timers[0]);
    }
    Timer t = Timer(Duration(seconds: 60 - DateTime.now().second), updateTime);
    timers.add(t);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                (data["menuFlag"].contains("http"))
                    ? Image.network(
                        data["menuFlag"],
                        scale: 0.5,
                      )
                    : Image.asset(data["menuFlag"], scale: 1.8),
                SizedBox(height: 10),
                Text(data["location"],
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 2.0,
                      color: Colors.grey[300],
                    )),
                SizedBox(height: 10),
                Text(
                  DateFormat.jm().format(data["time"]),
                  style: TextStyle(
                    fontSize: 64,
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 10),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    if (result != null) {
                      setState(() {
                        data = {
                          'time': result['time'],
                          'menuFlag': result['menuFlag'],
                          'daytime': result['daytime'],
                          'location': result['location'],
                        };
                      });
                    }
                  },
                  label: Text(
                    "Edit location",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
