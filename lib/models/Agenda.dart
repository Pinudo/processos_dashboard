class Agenda {
  String status;
  String dataInicio;
  String dataFim;

  Agenda(String status, String dataInicio, String dataFim) {
    this.status = status;
    this.dataInicio = dataInicio;
    this.dataFim = dataFim;
  }

  Agenda.fromJson(Map json)
      : status = json['status'],
        dataInicio = json['dataInicio'],
        dataFim = json['dataFim'];

  Map toJson() {
    return {'status': status, 'dataInicio': dataInicio, 'dataFim':dataFim};
  }
}