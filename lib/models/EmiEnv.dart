class EmiEnv {
  String arquivo;
  String status;

  EmiEnv(this.status, this.arquivo) {
    this.status = status;
    this.arquivo = arquivo;
  }

  EmiEnv.fromJson(Map json)
      : status = json['status'],
        arquivo = json['arquivo'];

  Map toJson() {
    return {'status': status, 'arquivo': arquivo};
  }
}
