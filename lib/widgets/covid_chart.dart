import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid_app/models/day_stat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CovidChart extends StatelessWidget {
  List<charts.Series> seriesList;
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

  List<charts.Series<OrdinalSales, String>> _createSeries(){
    final recoveredCases = history.map((e) => OrdinalSales(e.day.toIso8601String(), e.recoveredNumber));
    final deathCases = history.map((e) => OrdinalSales(e.day.toIso8601String(), e.deathNumber));
    return [
       new charts.Series<OrdinalSales, String>(
        id: 'Recovered',
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.number,
        data: isRecovered ? deathCases : recoveredCases,
        seriesColor: charts.MaterialPalette.gray.shade200
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Deaths',
        domainFn: (OrdinalSales sales, _) => sales.day,
        measureFn: (OrdinalSales sales, _) => sales.number,
        data: isRecovered ? recoveredCases: deathCases,
        seriesColor: isRecovered ? charts.MaterialPalette.green.makeShades(2)[0]: charts.MaterialPalette.red.makeShades(2)[0]
      ),
    ];
  }
}
/// Sample ordinal data type.
class OrdinalSales {
  final String day;
  final int number;

  OrdinalSales(this.day, this.number);
}