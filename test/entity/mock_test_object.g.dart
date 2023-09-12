// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mock_test_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MockTestObject _$MockTestObjectFromJson(Map<String, dynamic> json) =>
    MockTestObject(
      name: json['name'] as String,
      value: json['value'] as int,
      isSomething: json['isSomething'] as bool,
    );

Map<String, dynamic> _$MockTestObjectToJson(MockTestObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'isSomething': instance.isSomething,
    };
