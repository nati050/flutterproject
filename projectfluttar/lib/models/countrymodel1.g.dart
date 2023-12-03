// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countrymodel1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

countrysModel _$countrysModelFromJson(Map<String, dynamic> json) =>
    countrysModel(
      (json['countries'] as List<dynamic>?)
          ?.map((e) => country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$countrysModelToJson(countrysModel instance) =>
    <String, dynamic>{
      'countries': instance.countries,
    };
