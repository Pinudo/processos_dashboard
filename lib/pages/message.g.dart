// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(json['status'] as String, json['dataInicio'] as String, json['dataFim'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) =>
    <String, dynamic>{'status': instance.status, 'dataInicio': instance.dataInicio, 'dataFim': instance.dataFim};
