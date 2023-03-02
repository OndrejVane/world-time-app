import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String url;
  late String time;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTimeOfLocation() async {
    try {
      var urlEndpoint =
          Uri.http('worldtimeapi.org', '/api/timezone/$url', {'q': '{http}'});
      Response response = await get(urlEndpoint);
      //await Future.delayed(const Duration(seconds: 3));
      Map responseMap = jsonDecode(response.body);
      String dateTime = responseMap['utc_datetime'];
      String mark = responseMap['utc_offset'].substring(0, 1);
      String timeZone = responseMap['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);

      if (mark == "+") {
        now = now.add(Duration(hours: int.parse(timeZone)));
      } else {
        now = now.add(Duration(hours: -int.parse(timeZone)));
      }

      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat("HH:mm").format(now);
    } catch (e) {
      time = "Could not get time from the server";
    }
  }
}
