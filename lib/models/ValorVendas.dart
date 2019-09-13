class ValorVendas {
  String valor;
  
  ValorVendas(this.valor) {
    this.valor = valor;
  }

  ValorVendas.fromJson(Map json)
      : valor = json['valor'];

  Map toJson() {
    return {'valor': valor};
  }
}