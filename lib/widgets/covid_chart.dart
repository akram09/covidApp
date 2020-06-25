import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_app/models/day_stat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CovidChart extends StatelessWidget {
  List<charts.Series<DayState, String>> seriesList;
  final bool animate;
  final bool isRecovered; 
  final List<DayState> history;   

  CovidChart({this.animate, this.history,this.isRecovered});


  @override
  Widget build(BuildContext context) {
    _createSeries();
    return charts.BarChart(
      seriesList,
      animate: animate,
      primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
          showAxisLine: false),
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,

        cornerStrategy: const charts.ConstCornerStrategy(30),
        strokeWidthPx: 1
        
      ),
      layoutConfig: new charts.LayoutConfig(
          leftMarginSpec: new charts.MarginSpec.fixedPixel(0),
          topMarginSpec: new charts.MarginSpec.fixedPixel(0),
          rightMarginSpec: new charts.MarginSpec.fixedPixel(0),
          bottomMarginSpec: new charts.MarginSpec.fixedPixel(0)
          ),
    );
  }

  void _createSeries(){
    seriesList = [
       charts.Series<DayState, String>(
        id: 'Recovered',
        domainFn: (DayState numbers, _) => numbers.day.toIso8601String(),
        measureFn: (DayState numbers, _) => isRecovered ? numbers.deathNumber: numbers.recoveredNumber,
        data: history,
        seriesColor: charts.MaterialPalette.gray.shade200
      ),
      charts.Series<DayState, String>(
        id: 'Global Revenue',
        domainFn: (DayState numbers, _) => numbers.day.toIso8601String(),
        measureFn: (DayState numbers, _) => isRecovered ? numbers.recoveredNumber:numbers.deathNumber ,
        data:history,
        seriesColor: isRecovered ? charts.MaterialPalette.green.makeShades(2)[0]: charts.MaterialPalette.red.makeShades(2)[0]
      ),
    ];
  }
}
/// Sample ordinal data type.
