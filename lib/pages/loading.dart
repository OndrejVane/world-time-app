import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime prague =
        WorldTime(location: "Prague", flag: "czech.png", url: "Europe/Prague");
    await prague.getTimeOfLocation();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': prague.location,
      'flag': prague.flag,
      'time': prague.time,
      'isDayTime': prague.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitSpinningLines(
        color: Colors.black,
        size: 200,
      ),
    );
  }
}
