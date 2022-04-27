// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      temp: (json['temp'] as num?)?.toDouble(),
      lowest: (json['lowest'] as num?)?.toDouble(),
      highest: (json['highest'] as num?)?.toDouble(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temp': instance.temp,
      'lowest': instance.lowest,
      'highest': instance.highest,
      'description': instance.description,
    };
