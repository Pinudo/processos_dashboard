class ProcessaArquivoBV {
  String status;
  String dataInicio;
  String dataFim;
  String infoProcesso;
  NewRet newRet;
  EmiEnv emiEnv;

  ProcessaArquivoBV(String status, String dataInicio, String dataFim, NewRet newRet, EmiEnv emiEnv) {
    this.status = status;
    this.dataInicio = dataInicio;
    this.dataFim = dataFim;
    this.newRet = newRet;
    this.emiEnv = emiEnv;
  }

  ProcessaArquivoBV.fromJson(Map json)
      : status = json['status'],
        dataInicio = json['dataInicio'],
        dataFim = json['dataFim'],
        newRet = json['newRet'],
        emiEnv = json['emiEnv'];

  Map toJson() {
    return {'status': status, 'dataInicio': dataInicio, 'dataFim':dataFim};
  }
}

class NewRet {
  String arquivo;
  String status;

  NewRet(this.status, this.arquivo);

  NewRet.fromJson(Map json) :
  arquivo = json['arquivo'],
  status = json['status'];

  Map toJson(){
    return {'arquivo': arquivo, 'status': status};
  }
}

class EmiEnv {
  String arquivo;
  String status;

  EmiEnv(this.arquivo, this.status);

  EmiEnv.fromJson(Map json) :
  arquivo = json['arquivo'],
  status = json['status'];

  Map toJson(){
    return {'arquivo': arquivo, 'status': status};
  }
}