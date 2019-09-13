class QtdVendasRegistradas {
  String count;
  
  QtdVendasRegistradas(this.count) {
    this.count = count;
  }

  QtdVendasRegistradas.fromJson(Map json)
      : count = json['count'];

  Map toJson() {
    return {'count': count};
  }
}