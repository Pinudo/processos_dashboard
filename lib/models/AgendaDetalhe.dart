class AgendaDetalhe {
  String dataProcessamento;
  int qtdRegistros;

  AgendaDetalhe(String dataProcessamento, int qtdRegistros) {
    this.dataProcessamento = dataProcessamento;
    this.qtdRegistros = qtdRegistros;
  }

  AgendaDetalhe.fromJson(Map json)
      : dataProcessamento = json['dataProcessamento'],
        qtdRegistros = json['qtdRegistros'];

  Map<String, dynamic> toJson() => {
    'dataProcessamento': dataProcessamento,
    'qtdRegistros': qtdRegistros
  };      
}
