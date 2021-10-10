import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:http/http.dart';
import 'dart:convert';

Widget loadingUi(_isConnected) {
  return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isConnected
                ? CircularProgressIndicator()
                : Text("You are not connected to any connection!"),
            SizedBox(height: 20),
            Text(
              "Getting data",
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ));
}

class Loading extends StatefulWidget {
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isConnected = true;

  Future<dynamic> getCurrLocation() async {
    try {
      Response ipResponse =
          await get(Uri.parse("https://api.ipify.org/?format=json"));
      var ip = jsonDecode(ipResponse.body);
      Response tmResponse = await get(Uri.parse(
          "https://timezoneapi.io/api/ip/$ip?token=agzIdrFRizVAJoLxMmmu"));
      var tmData = jsonDecode(tmResponse.body)["data"];
      String tmName = tmData["timezone"]["id"];
      String capital = tmData["timezone"]["capital"];
      String countryCode = tmData["timezone"]["country_code"];
      return [tmName, capital, countryCode];
    } on SocketException {
      return false;
    }
  }

  void setConnection(bool con) {
    setState(() {
      _isConnected = con;
    });
  }

  void setupWorldTime() async {
    var userData = await getCurrLocation();
    if (userData == false) {
      setConnection(false);
      await Future.delayed(Duration(seconds: 1));
      setupWorldTime();
    } else {
      setConnection(true);
      WorldTime instance = WorldTime(userData[0], userData[1], userData[2]);
      await instance.getTime();
      Navigator.pushReplacementNamed(
        context,
        "/home",
        arguments: {
          "location": instance.location,
          "time": instance.now,
          "listFlag": instance.listFlag,
          "menuFlag": instance.menuFlag,
          "daytime": instance.isDaytime,
          "widget": instance,
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return loadingUi(_isConnected);
  }
}
