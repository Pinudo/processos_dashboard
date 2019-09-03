import 'package:processos_dashboard/models/EmiEnv.dart';
import 'package:processos_dashboard/models/NewRet.dart';

class ProcessaArquivoBV {
  String status;
  String dataInicio;
  String dataFim;
  String infoProcesso;
  NewRet newRet;
  EmiEnv emiEnv;

  ProcessaArquivoBV(
      String status, String dataInicio, String dataFim, String infoProcesso, NewRet newRet, EmiEnv emiEnv) {
    this.status = status;
    this.dataInicio = dataInicio;
    this.dataFim = dataFim;
    this.infoProcesso = infoProcesso;
    this.newRet = newRet;
    this.emiEnv = emiEnv;
  }
  ProcessaArquivoBV.fromJson(Map json)
      : status = json['status'],
        dataInicio = json['dataInicio'],
        dataFim = json['dataFim'],
        infoProcesso = json['infoProcesso'],
        newRet = NewRet.fromJson(json['newRet'] as Map<String, dynamic>),
        emiEnv = EmiEnv.fromJson(json['emiEnv'] as Map<String, dynamic>);

  Map toJson() {
    return {
      'status': status,
      'dataInicio': dataInicio,
      'dataFim': dataFim,
      'infoProcesso': infoProcesso,
      'newRet': newRet,
      'emiEnv': emiEnv
    };
  }
}
