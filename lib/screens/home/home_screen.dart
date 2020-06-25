import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  Widget _topAppBar(){
    return Row(children: <Widget>[
      Icon(Icons.short_text, color: Colors.white,size: 32.0,),
      Icon(Icons.notifications, color: Colors.white,size: 32.0,)
    ],mainAxisAlignment: MainAxisAlignment.spaceBetween,);
  }
  Widget _covidAlgeriaInfo(BuildContext context , DateTime lastUpdate, int CaseNumber){
    return Column(children: <Widget>[
      Container(
        child: Text("Mar 22, 2020 12:48 GMT",style: Theme.of(context).textTheme.overline.apply(
          color: Colors.white
        ),),
        alignment: Alignment.topLeft,
      )
    ],); 
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return  Stack(
        children: <Widget>[
          Container(color: Theme.of(context).primaryColor,
          height: _media.height /2.7,
          ),
          Container(
            padding: EdgeInsets.only(top: 30.0),
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                _topAppBar(),
                SizedBox(height: 16.0,),
                _covidAlgeriaInfo(context, DateTime.now(), 2000)
              ],
            ),
          ),
          )
        ],
      );
  }
}