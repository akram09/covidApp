import 'package:covid_app/widgets/covid_chart.dart';
import 'package:covid_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class CovidStatsCard extends StatelessWidget {
  
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
                child:Text("RECOVERED",
                  style: Theme.of(context).textTheme.caption.apply(
                    color: Colors.grey
                    )
                  ) ,
                padding: EdgeInsets.only(left: 4),
                ),
                Container(
                child:Text("98",
                  style: Theme.of(context).textTheme.headline4.apply(
                    color: Colors.green
                    )
                  ) ,
                padding: EdgeInsets.only(left: 4, top: 6),
                )
                , 
                Container(
                  child: CovidChart.withSampleData(),
                  width: 200,
                  height: 100,
                )
                

              
            ],

          ),
        )
      );
  }
}
