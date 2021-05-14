import 'package:flutter/material.dart';
import 'package:flutter_application_widgets/pages/alert_page.dart';
import 'package:flutter_application_widgets/pages/avatar_page.dart';
import 'package:flutter_application_widgets/pages/card_page.dart';
import 'package:flutter_application_widgets/pages/home_temp.dart';

Map <String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
  '/': (BuildContext context) => HomePage(),
  'alert': (BuildContext context) => AlertPage(),
  'avatar': (BuildContext context) => AvatarPage(),
  'card': (BuildContext context) => CardPage(),
  };
}