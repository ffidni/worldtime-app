import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool _isLoading = false;

  void updateTime() {
    setState(() {
      data["time"] = data["time"].add(Duration(minutes: 1));
    });
  }

  @override
  void initState() {
    super.initState();
    newTimer();
  }

  void newTimer() {
    Timer t =
        Timer.periodic(Duration(seconds: 60 - DateTime.now().second), (timer) {
      timer.cancel();
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
                _isLoading
                    ? CircularProgressIndicator()
                    : FlatButton.icon(
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
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
                          } else {
                            setState(() {
                              _isLoading = false;
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
