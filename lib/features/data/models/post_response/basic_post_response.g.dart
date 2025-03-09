// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicPostResponse _$BasicPostResponseFromJson(Map<String, dynamic> json) =>
    BasicPostResponse(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$BasicPostResponseToJson(BasicPostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
