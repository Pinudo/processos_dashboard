import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProcessaVendaBV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Processo Venda BV',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("Finalizado",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text("Inicio: 02/09/2019",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16)),
                ),
                Container(
                  child: Text("Fim: 03/09/2019",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16)),
                ),
                Container(
                  child: Text("NewRet: OK",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16)),
                ),
                Container(
                  child: Text("EmiEnv: OK",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16)),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 2),
                          child: Text("",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 16)),
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

/// Bar chart example
class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.blue[900],
          leading: IconButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text('Total de Vendas',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        body: Padding(
          padding: EdgeInsets.all(22.0),
          child: new charts.BarChart(
            seriesList,
            animate: animate,
          ),
        ));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
