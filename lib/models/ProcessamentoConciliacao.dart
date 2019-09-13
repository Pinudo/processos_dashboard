class ProcessamentoConciliacao {
  String arquivo;
  String status;

  ProcessamentoConciliacao(this.status, this.arquivo) {
    this.status = status;
    this.arquivo = arquivo;
  }

  ProcessamentoConciliacao.fromJson(Map json)
      : status = json['status'],
        arquivo = json['arquivo'];

  Map toJson() {
    return {'status': status, 'arquivo': arquivo};
  }
}
