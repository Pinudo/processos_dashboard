import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:processos_dashboard/pages/message.dart';
import 'package:processos_dashboard/pages/process_agendamento_detalhe.dart';
import 'package:processos_dashboard/pages/processa_venda_bv_detalhe.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'shop_items_page.dart';

class 
MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = new charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MainPageState extends State<MainPage> {
  Future<List<Message>> messages;

  @override
  void initState() {
    super.initState();
    messages = Message.browse();
  }

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.yellow,
          title: Text("Dashboard",
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0)),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('#JabutiTeamDevs',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0)),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      var _messages = Message.browse();
                      setState(() {
                        messages = _messages;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
        body: FutureBuilder(
          future: messages,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                var messages = snapshot.data[0];
                var data = [
                    new ClicksPerYear('BA', 12, Colors.yellow[600]),
                    new ClicksPerYear('RJ', 42, Colors.yellow[600]),
                    new ClicksPerYear('MG', 2, Colors.yellow[600]),
                    new ClicksPerYear('SP', 25, Colors.yellow[600])
];
                var serieList = [
                  new charts.Series(
                    id: 'Clicks',
                    domainFn: (ClicksPerYear clickData, _) => clickData.year,
                    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
                    colorFn: (ClicksPerYear clickData, _) => clickData.color,
                    data: data,
                  ),
                ];
                if (messages.processamentoAgendamentoVenda.status == "F") {
                  messages.processamentoAgendamentoVenda.status = "Finalizado";
                }
                /*  print('OK $messages.agenda ' +
                    messages.processa); */
                return StaggeredGridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  children: <Widget>[
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Total Vendas Dia',
                                      style:
                                          TextStyle(color: Colors.blueAccent)),
                                  Text('${messages.qtdVendasRegistradas.count}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Material(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.timeline,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SimpleBarChart(serieList, animate: true)));
                      },
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.teal,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.assessment,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 10.0)),
                              Text('Processa Venda BV',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19.0)),
                              Text('Finalizado',
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProcessaVendaBV()));
                      },
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.amber,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.assessment,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 10.0)),
                              Text('Processo Agendado',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19.0)),
                              Text(
                                  messages.processamentoAgendamentoVenda.status,
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ProcessAgendamentoDetalhe(
                                        messages.processamentoAgendamentoVenda
                                            .status,
                                        messages.processamentoAgendamentoVenda
                                            .dataInicio,
                                        messages.processamentoAgendamentoVenda
                                            .dataFim)));
                      },
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.teal,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(Icons.assessment,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 10.0)),
                              Text('Processa de Conciliação',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19.0)),
                              Text(messages.processamentoConciliacao.status,
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Material(
                                  color: Colors.amber,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.assessment,
                                        color: Colors.white, size: 30.0),
                                  )),
                              Padding(padding: EdgeInsets.only(bottom: 10.0)),
                              Text('Processo de Reaplicação',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19.0)),
                              Text(
                                  messages.processamentoReaplicacao[0]
                                      .dataProcessamento,
                                  style: TextStyle(color: Colors.black45)),
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShopItemsPage(
                                      messages.processamentoReaplicacao,
                                      agendaDetalhe:
                                          messages.processamentoReaplicacao,
                                    )));
                      },
                    ),
                    _buildTile(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Quantidade de Vendas',
                                      style:
                                          TextStyle(color: Colors.redAccent)),
                                  Text('R\$ ' + messages.valorVendas.valor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 34.0))
                                ],
                              ),
                              Material(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Center(
                                      child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Icon(Icons.store,
                                        color: Colors.white, size: 30.0),
                                  )))
                            ]),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyHomeChart()));
                               
                      },
                    )
                  ],
                  staggeredTiles: [
                    StaggeredTile.extent(2, 110.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(1, 180.0),
                    StaggeredTile.extent(2, 110.0),
                  ],
                );
            }
          },
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
