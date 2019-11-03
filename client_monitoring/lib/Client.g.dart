// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(json['id'] as int, json['firstName'] as String,
      json['lastName'] as String);
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName
    };
