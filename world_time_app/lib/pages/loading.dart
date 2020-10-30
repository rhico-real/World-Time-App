import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime karun = WorldTime(location:'Berlin', url: 'Europe/Berlin', flag: 'germany.png');
    await karun.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': karun.location,
      'flag': karun.flag,
      'time': karun.time,
      'isDaytime': karun.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
