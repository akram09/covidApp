import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CovidChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CovidChart(this.seriesList, {this.animate});

   factory CovidChart.withSampleData() {
    return new CovidChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
      domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.NoneRenderSpec(),
          showAxisLine: false),
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
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




  /// Create series list with single series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
      new OrdinalSales('2007', 3100),
      new OrdinalSales('2008', 3500),
      new OrdinalSales('2009', 5000),
      new OrdinalSales('2010', 2500),
      new OrdinalSales('2011', 3200),
      new OrdinalSales('2012', 4500),
      new OrdinalSales('2013', 4400),
      new OrdinalSales('2014', 5000),
      new OrdinalSales('2015', 5000),
      new OrdinalSales('2016', 4500),
      new OrdinalSales('2017', 4300),
       new OrdinalSales('2018', 4500),
      new OrdinalSales('2019', 4400),
      new OrdinalSales('2020', 5000),
      new OrdinalSales('2021', 5000),
      new OrdinalSales('2022', 4500),
      new OrdinalSales('2023', 4300),
    ];
    final globalSalesData2 = [
      new OrdinalSales('2007', 3100),
      new OrdinalSales('2008', 3500),
      new OrdinalSales('2009', 5000),
      new OrdinalSales('2010', 2500),
      new OrdinalSales('2011', 3200),
      new OrdinalSales('2012', 4500),
      new OrdinalSales('2013', 4400),
      new OrdinalSales('2014', 5000),
      new OrdinalSales('2015', 5000),
      new OrdinalSales('2016', 4500),
      new OrdinalSales('2017', 4300),
       new OrdinalSales('2018', 4500),
      new OrdinalSales('2019', 4400),
      new OrdinalSales('2020', 5000),
      new OrdinalSales('2021', 5000),
      new OrdinalSales('2022', 4500),
      new OrdinalSales('2023', 4300),
    ];

    return [
       new charts.Series<OrdinalSales, String>(
        id: 'Global Reve',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
        seriesColor: charts.MaterialPalette.gray.shade200
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
        seriesColor: charts.MaterialPalette.green.makeShades(2)[0]
      ),
     

    ];
  }
}
/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}