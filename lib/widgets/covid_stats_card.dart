import 'package:covid_app/bloc/covid_bloc.dart';
import 'package:covid_app/models/day_stat.dart';
import 'package:covid_app/widgets/covid_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CovidStatsCard extends StatelessWidget {
  final bool isRecovered ; 
  

  const CovidStatsCard({Key key, this.isRecovered}) : super(key: key); 


  
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Material(elevation: 1,
        color: Colors.white,
        shadowColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child:Container(
          width: _media.width /2 -30.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child:Text(isRecovered ?"RECOVERED": "DEATHS",
                  style: Theme.of(context).textTheme.caption.apply(
                    color: Colors.grey
                    )
                  ) ,
                padding: EdgeInsets.only(left: 4),
                ),
                Container(
                  child: BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                    if(state is LoadingSuccess){
                      return Text(isRecovered ? state.stats.historyStats.first.recoveredNumber.toString(): state.stats.historyStats.first.deathNumber.toString(),
                        style: Theme.of(context).textTheme.headline4.apply(
                        color: isRecovered? Colors.green: Colors.red
                        )
                      );
                    }else{
                      return Text("0",
                        style: Theme.of(context).textTheme.headline4.apply(
                        color: isRecovered? Colors.green: Colors.red
                        )
                      );
                    }
                  },)
                )
                ,                 
                Container(
                  child: BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                    if(state is InitialLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }else if(state is LoadingSuccess){
                      return CovidChart(animate: true,isRecovered: isRecovered,history: state.stats.historyStats,);
                    }else{
                      return Center(child: Text("No Internet Connection", style: Theme.of(context).textTheme.subtitle1.apply(color: Colors.red),));
                    }
                    
                  },),
                  width: _media.width /2 -40.0,
                  height: 120,
                ),
               
            ],

          ),
        )
      );
  }
}
