import 'package:flutter/material.dart';

class ProcessAgendamentoDetalhe extends StatelessWidget {
  final String status;
  final String dataInicio;
  final String dataFim;

  ProcessAgendamentoDetalhe(this.status, this.dataInicio, this.dataFim);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text('Agendamento BB',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox.fromSize(
                  size: Size.fromHeight(122.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      /// Item description inside a material
                      Container(
                        margin: EdgeInsets.only(top: 24.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(12.0),
                          shadowColor: Color(0x802196F3),
                          color: Colors.white,
                          child: InkWell(
                            onTap: () => {},
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /// Title and rating
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Status: '+this.status,
                                          style: TextStyle(
                                              color: Colors.blueAccent)),
                                      Padding(padding: EdgeInsets.all(3.0)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Data Inicio: '+this.dataInicio,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0)),
                                          Icon(Icons.today,
                                              color: Colors.black, size: 24.0),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Data Fim: '+this.dataFim,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0)),
                                          Icon(Icons.today,
                                              color: Colors.black, size: 24.0),
                                        ],
                                      ),
                                    ],
                                  ),

                                  /// Infos
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Item image
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(54.0),
                            child: Material(
                              elevation: 20.0,
                              shadowColor: Color(0x802196F3),
                              shape: CircleBorder(),
                              child: Image.asset('res/shoes1.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

            /// Review
            Padding(
              padding: EdgeInsets.only(top: 160.0, left: 32.0),
              child: Material(
                elevation: 12.0,
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),

            /// Item card
          ],
        ),
      ),
    );
  }
}
