import 'package:covid_app/bloc/covid_bloc.dart';
import 'package:covid_app/consts.dart';
import 'package:covid_app/models/wilaya.dart';
import 'package:covid_app/screens/select_wilaya.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Wilaya city = null; 

  HomePage({Key key}) : super(key: key);


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
      BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: state is LoadingSuccess ?
                  Text(state.stats.totalCases.toString(),
                        style: Theme.of(context).textTheme.headline3.apply(
                          color: Colors.white
                        )
                      )
                  :Text("0",style: Theme.of(context).textTheme.headline3.apply(
                        color: Colors.white 
                        ),
                      )    
            )  
            ,
            RaisedButton(  
              onPressed: () async{
                final selectedCity = await Navigator.push(context, MaterialPageRoute(builder: 
                (context)=> SelectWilaya(wilaya: city,)
                ));
                city = selectedCity;
                BlocProvider.of<CovidBloc>(context).add(SelectedCityEvent(city: selectedCity));
              },
              color: Colors.white,
              textColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child:state is LoadingSuccess && state.stats.city!=null ? Text(state.stats.city.name):
                 Text("Select City")  
            ,),
          ],
        );

      },)
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
                Row(children: <Widget>[
                  CovidStatsCard(isRecovered: false,),
                  CovidStatsCard(isRecovered: true,),
                ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                SizedBox(height: 16.0,),
                Container(
                  width:double.infinity,
                  child: Material(
                    elevation: 1,
                    color: Colors.white,
                    shadowColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child:BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                        if(state is InitialLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }else if(state is LoadingSuccess){
                          print("Hllo state");
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text("ACTIVE CASES"),
                                    Text(state.stats.activeCases.toString(), style: Theme.of(context).textTheme.headline4.apply(color: Colors.black),)
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  state.stats.historyStats.last.midConditionPercentage>0?Icon(Icons.keyboard_arrow_down,color: Colors.red,) :Icon(Icons.keyboard_arrow_up, color: Colors.green,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Text((state.stats.historyStats.last.midConditionPercentage*100).ceil().abs().toString()+'%', style: Theme.of(context).textTheme.subtitle1,),
                                    Text("Mid Condition", style:  Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
                                  ],)
                                  
                                ],),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  state.stats.historyStats.last.criticalConditionPercentage>0?Icon(Icons.keyboard_arrow_down,color: Colors.red,) :Icon(Icons.keyboard_arrow_up, color: Colors.green,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Text((state.stats.historyStats.last.criticalConditionPercentage*100).ceil().abs().toString()+'%', style: Theme.of(context).textTheme.subtitle1,),
                                    Text("Critical", style:  Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
                                  ],)
                                  
                                ],)




                              ],)
                              
                            ],
                          );
                        }else{
                          return Center(child: Text("No Internet Connection", style:Theme.of(context).textTheme.subtitle1.apply(color: Colors.red) ),);
                        }
                      },)
                    ) 
                  ),
                ),
                SizedBox(height: 10,),
                
                Container(
                  width:double.infinity,
                  child: Material(
                    elevation: 1,
                    color: Colors.white,
                    shadowColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child:BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                        if(state is InitialLoading){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }else if(state is LoadingSuccess){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: <Widget>[
                                    Text("CLOSED CASES"),
                                    Text(state.stats.closedCases.toString(), style: Theme.of(context).textTheme.headline4.apply(color: Colors.black),)
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  state.stats.historyStats.last.recoveredPercentage>0?Icon(Icons.keyboard_arrow_down,color: Colors.red,) :Icon(Icons.keyboard_arrow_up, color: Colors.green,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Text((state.stats.historyStats.last.recoveredPercentage*100).ceil().abs().toString()+'%', style: Theme.of(context).textTheme.subtitle1,),
                                    Text("Recovered", style:  Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
                                  ],),
                                  SizedBox(width:20)
                                  
                                ],),
                                SizedBox(height: 20,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                  state.stats.historyStats.last.deathPercentage>0?Icon(Icons.keyboard_arrow_down,color: Colors.green,) :Icon(Icons.keyboard_arrow_up, color: Colors.red,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                    Text((state.stats.historyStats.last.deathPercentage*100).ceil().abs().toString()+'%', style: Theme.of(context).textTheme.subtitle1,),
                                    Text("Deaths", style:  Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
                                  ],)
                                  
                                ],)




                              ],),
                              
                            ],
                          );
                        }else{
                          return Center(child: Text("No Internet Connection", style:Theme.of(context).textTheme.subtitle1.apply(color: Colors.red) ),);
                        }
                      },)
                    ) 
                  ),
                )
                

              ],
            ),
          ),
          )
        ],
      );
  }
}