import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  Map data = {};
  var timer;

  void updateTime([m = 1]) {
    setState(() {
      data["time"] = data["time"].add(Duration(minutes: m));
    });
  }

  @override
  void initState() {
    super.initState();
    newTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        List newData = await data["widget"].getTime(true);
        setState(() {
          data["time"] = newData[0];
          data["daytime"] = newData[1];
        });
        newTimer();
        break;
      case AppLifecycleState.inactive:
        timer.cancel();
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  void newTimer() {
    timer = Timer.periodic(Duration(seconds: 60 - DateTime.now().second), (t) {
      t.cancel();
      updateTime();
      newTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String bgImage = data["daytime"] ? "day.jpg" : "night.jpg";
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
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
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
