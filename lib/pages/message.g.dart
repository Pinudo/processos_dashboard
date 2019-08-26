// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
      json['status'] as String,
      json['dataInicio'] as String,
      json['dataFim'] as String,
      json['agenda'] == null
          ? null
          : Agenda.fromJson(json['agenda'] as Map<String, dynamic>),
      (json['agendaDetalhe'] as List)
          ?.map((e) => e == null
              ? null
              : AgendaDetalhe.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'status': instance.status,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'agenda': instance.agenda,
      'agendaDetalhe': instance.agendaDetalhe
    };
