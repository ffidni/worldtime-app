import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String url;
  String location; //location name for the ui
  dynamic now; //time for the curr location
  String countryId; //url to a flag
  String listFlag;
  String menuFlag;
  bool isDaytime;

  WorldTime(this.url, this.location, this.countryId) {
    listFlag =
        ((countryId != "??" && countryId != "null") && countryId.length == 2)
            ? "https://flagcdn.com/w80/${this.countryId}.png"
            : "assets/clock_list.jpg";
    menuFlag =
        ((countryId != "??" && countryId != "null") && countryId.length == 2)
            ? "https://www.countryflags.io/${this.countryId}/shiny/64.png"
            : "assets/clock.png";
  }

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      var data = jsonDecode(response.body);
      String dateTime = data["utc_datetime"];
      String offset = data["utc_offset"].substring(0, 3);
      now = DateTime.parse(dateTime).add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 19;
    } catch (e) {
      now = "Could not get the data";
    }
  }
}
