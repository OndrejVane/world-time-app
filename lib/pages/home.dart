import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    bool isDayTime = data['isDayTime'];
    String bgImage = isDayTime ? "day.jpg" : "night.jpg";
    Color textColor = isDayTime ? Colors.black54 : Colors.white60;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/$bgImage",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 100),
            TextButton.icon(
              onPressed: () async {
                dynamic result =
                    await Navigator.pushNamed(context, "/choose_location");
                if (result != null) {
                  setState(() {
                    data = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime']
                    };
                  });
                }
              },
              icon: Icon(
                Icons.location_on,
                size: 24.0,
                color: textColor,
              ),
              label: Text(
                'Edit location',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
              style: const ButtonStyle(),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["location"],
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 80),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                data["time"],
                style: TextStyle(
                  fontSize: 100,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ])
          ],
        )),
      ),
    );
  }
}
