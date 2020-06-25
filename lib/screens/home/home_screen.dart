import 'package:covid_app/bloc/covid_bloc.dart';
import 'package:covid_app/consts.dart';
import 'package:covid_app/widgets/covid_chart.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);


  void _onSelectCityClicked(){

  }
  String _getFormattedDate(){
    final date = DateTime.now();
    final month = MONTHS[date.month-1];
    final day = date.day;
    final year = date.year; 
    final hour = date.hour;
    final minute = date.minute;
    return "$month $day, $year $hour:$minute GMT+1";
  }

  Widget _topAppBar(){
    return Row(children: <Widget>[
      Icon(Icons.short_text, color: Colors.white,size: 32.0,),
      Icon(Icons.notifications, color: Colors.white,size: 32.0,)
    ],mainAxisAlignment: MainAxisAlignment.spaceBetween,);
  }

  Widget _covidAlgeriaInfo(BuildContext context , DateTime lastUpdate, int CaseNumber){
    return Column(children: <Widget>[
      Container(
        child: Text(_getFormattedDate(),style: Theme.of(context).textTheme.overline.apply(
          color: Colors.white
          
        ),),alignment:AlignmentDirectional.topStart , 
      ),
      Container(
        child: Text("Corona Virus Cases",style: Theme.of(context).textTheme.headline5.apply(
          color: Colors.white
          
        ),),alignment:AlignmentDirectional.topStart , 
      ),
       Container(
        child: Text("In Algeria ",style: Theme.of(context).textTheme.headline5.apply(
          color: Colors.white
          
        ),),alignment:AlignmentDirectional.topStart , 
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: BlocBuilder<CovidBloc, CovidState>(builder: (context , state){
                  if(state is LoadingSuccess){
                    return Text(state.stats.totalCases.toString(),
                        style: Theme.of(context).textTheme.headline3.apply(
                          color: Colors.white
                        )
                      );
                  }else{
                    return Text("0",style: Theme.of(context).textTheme.headline3.apply(
                        color: Colors.white 
                        ),
                      );
                  }
              })    
            )  
            ,
            RaisedButton(  
              onPressed: _onSelectCityClicked,
              color: Colors.white,
              textColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Select City"),),
          ],
        )
      ,

    ],crossAxisAlignment: CrossAxisAlignment.start,); 
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
                _covidAlgeriaInfo(context, DateTime.now(), 2000),
                SizedBox(height: 16.0,),
                CovidStatsCard(),
                
                
              ],
            ),
          ),
          )
        ],
      );
  }
}