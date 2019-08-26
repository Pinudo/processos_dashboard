import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:processos_dashboard/models/Agenda.dart';
import 'package:processos_dashboard/models/AgendaDetalhe.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String status;
  final String dataInicio;
  final String dataFim;
  final Agenda agenda;
  final List<AgendaDetalhe> agendaDetalhe;
  //final Object processamentoBvArquivo;

  Message(this.status, this.dataInicio, this.dataFim, this.agenda,
      this.agendaDetalhe);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response response =
        await http.get('http://www.mocky.io/v2/5d5ad96b2f00002b0036f8ea');

    //String content = response.body;
    String content =
        '[{"status": "F", "dataInicio": "2019-08-16", "dataFim": "2019-08-16", "agenda": {"status": "F", "dataInicio": "2019-08-23", "dataFim": "2019-08-16"}, "agendaDetalhe":[{"dataProcessamento": "2019-08-13","qtdRegistros": 1},{"dataProcessamento": "2019-08-09","qtdRegistros": 2998},{"dataProcessamento": "2019-08-07","qtdRegistros": 163}]}]';
    var parsedJson = json.decode(content);
    print('${parsedJson.runtimeType} : $parsedJson');
    List collection = parsedJson;
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();
        print(_messages[0].agendaDetalhe[0].toString());
    return _messages;
  }
}
