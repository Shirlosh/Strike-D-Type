import 'package:flutter/material.dart';

class ClassicTheme
{
  static List<IconData> icons = [null,
    Icons.icecream_sharp,
    Icons.shuffle,
    Icons.score,
    Icons.accessibility_new_sharp,
    Icons.ac_unit_sharp,
    Icons.access_alarm,
    Icons.abc,
    Icons.airlines,
    Icons.baby_changing_station,
    Icons.business,
    Icons.backpack,
    Icons.balcony,
    Icons.work_outlined,
    Icons.wine_bar,
    Icons.window,
    Icons.agriculture_outlined,
    Icons.airplanemode_on_sharp,
    Icons.add_reaction_outlined,
    Icons.assessment_rounded,
    Icons.call_end_rounded,
    Icons.vpn_key_rounded,
    Icons.add_a_photo_outlined,
    Icons.add_shopping_cart,
    Icons.airline_stops_sharp,
    Icons.anchor_rounded,
    Icons.alternate_email,
    Icons.area_chart_sharp,
    Icons.airport_shuttle,
    Icons.visibility_rounded,
    Icons.vpn_lock,
    Icons.alarm_on_rounded,
    Icons.airline_seat_recline_normal_sharp,
    Icons.circle,
    Icons.square,
    Icons.scale,
    Icons.print,
    Icons.print,
    Icons.add_alert_sharp,
  ];
  static List<Color> colors = [Colors.red,
    Colors.yellow,
    Colors.black,
    Colors.greenAccent,
    Colors.indigo,
    Colors.green,
    Colors.orange,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.redAccent,
    Colors.brown];

  static IconData getIcon(int i)
  {
    if(i > icons.length)
      print("LOG: ERROR !!! not enough symbols");

    return icons[i%icons.length];
  }

  static Color getColor(int i)
  {
    return colors[ (i%colors.length) ];
  }
}