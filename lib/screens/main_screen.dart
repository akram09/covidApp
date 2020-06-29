
import 'package:covid_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int _currentIndex =0;

    void _onIndexChanged(newIndex){
      setState(() {
        _currentIndex = newIndex;
      });
    }
    static List<Widget> mainPages = <Widget>[
        HomePage(),
        Center(child: Text("dadeata")),
    ];

    

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: mainPages.elementAt(_currentIndex),),  
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.insert_chart), title: Text("")) ,

       BottomNavigationBarItem(icon: Icon(Icons.pin_drop), title: Text("")),
       BottomNavigationBarItem(icon: Icon(Icons.event), title: Text("")),
       BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("")),
      ],
      currentIndex: _currentIndex,
      onTap: _onIndexChanged,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      iconSize: 32.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      ),
    );
  }
}
