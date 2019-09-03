class NewRet {
  String arquivo;
  String status;

  NewRet(this.status, this.arquivo) {
    this.status = status;
    this.arquivo = arquivo;
  }

  NewRet.fromJson(Map json)
      : status = json['status'],
        arquivo = json['arquivo'];

  Map toJson() {
    return {'status': status, 'arquivo': arquivo};
  }
}
