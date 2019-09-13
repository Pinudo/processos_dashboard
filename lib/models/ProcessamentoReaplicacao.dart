class ProcessamentoReaplicacao {
  String dataProcessamento;
  int qtdRegistros;

  ProcessamentoReaplicacao(String dataProcessamento, int qtdRegistros) {
    this.dataProcessamento = dataProcessamento;
    this.qtdRegistros = qtdRegistros;
  }

  ProcessamentoReaplicacao.fromJson(Map json)
      : dataProcessamento = json['dataProcessamento'],
        qtdRegistros = json['qtdRegistros'];

  Map<String, dynamic> toJson() => {
    'dataProcessamento': dataProcessamento,
    'qtdRegistros': qtdRegistros
  };      
}
