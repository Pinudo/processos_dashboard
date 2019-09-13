// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['processamentoAgendamentoVenda'] == null
          ? null
          : Agenda.fromJson(
              json['processamentoAgendamentoVenda'] as Map<String, dynamic>),
      (json['processamentoReaplicacao'] as List)
          ?.map((e) => e == null
              ? null
              : ProcessamentoReaplicacao.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['processamentoBvArquivo'] == null
          ? null
          : ProcessaArquivoBV.fromJson(
              json['processamentoBvArquivo'] as Map<String, dynamic>),
      json['qtdVendasRegistradas'] == null
          ? null
          : QtdVendasRegistradas.fromJson(
              json['qtdVendasRegistradas'] as Map<String, dynamic>),
      json['processamentoConciliacao'] == null
          ? null
          : ProcessamentoConciliacao.fromJson(
              json['processamentoConciliacao'] as Map<String, dynamic>),
      json['valorVendas'] == null
          ? null
          : ValorVendas.fromJson(json['valorVendas'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'processamentoAgendamentoVenda': instance.processamentoAgendamentoVenda,
      'processamentoReaplicacao': instance.processamentoReaplicacao,
      'processamentoBvArquivo': instance.processamentoBvArquivo,
      'processamentoConciliacao': instance.processamentoConciliacao,
      'valorVendas': instance.valorVendas,
      'qtdVendasRegistradas': instance.qtdVendasRegistradas
    };
