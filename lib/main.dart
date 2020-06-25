
import 'package:covid_app/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid App",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(250, 128, 82,1)
      
      ),
      home:MainScreen() ,
    );
  }
}



