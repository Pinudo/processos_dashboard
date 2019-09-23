import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:processos_dashboard/models/Agenda.dart';
import 'package:processos_dashboard/models/ProcessamentoReaplicacao.dart';
import 'package:processos_dashboard/models/ProcessaArquivoBV.dart';
import 'package:processos_dashboard/models/ProcessamentoConciliacao.dart';
import 'package:processos_dashboard/models/QtdVendasRegistradas.dart';
import 'package:processos_dashboard/models/ValorVendas.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final Agenda processamentoAgendamentoVenda;
  final List<ProcessamentoReaplicacao> processamentoReaplicacao;
  final ProcessaArquivoBV processamentoBvArquivo;
  final ProcessamentoConciliacao processamentoConciliacao;
  final ValorVendas valorVendas;
  final QtdVendasRegistradas qtdVendasRegistradas;

  Message(this.processamentoAgendamentoVenda,
      this.processamentoReaplicacao, this.processamentoBvArquivo, this.qtdVendasRegistradas, this.processamentoConciliacao, this.valorVendas);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response response =
        await http.get('https://apis-dev.brasilcap.info/vendas/processos');

    //String content = response.body;
    String content =
        '[{"processamentoBvArquivo": {"status": "F","dataInicio": "2019-08-28","dataFim": "2019-08-28","newRet": {"arquivo":"OK","status": "OK"},"emiEnv": {"arquivo":"OK","status": "OK"}},"processamentoAgendamentoVenda": {"status": "F", "dataInicio": "2019-08-23", "dataFim": "2019-08-16"}, "processamentoReaplicacao":[{"dataProcessamento": "2019-08-13","qtdRegistros": 1082},{"dataProcessamento": "2019-08-09","qtdRegistros": 2998},{"dataProcessamento": "2019-08-07","qtdRegistros": 163}], "qtdVendasRegistradas": {"count": 1082,"rows": [{"idRegistroVenda": 233849}]},"valorVendas": {"valor": "182.000"},"processamentoConciliacao":{"arquivo":"OK", "status":"OK"}}]';
    var parsedJson = json.decode(content);
    print('${parsedJson.runtimeType} : $parsedJson');
    List collection = parsedJson;
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
    print(_messages.toString());
    return _messages;
  }
}
