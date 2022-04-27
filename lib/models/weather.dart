import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';

part 'weather.g.dart';


@JsonSerializable()
class Weather {
  double? temp;
  double? lowest;
  double? highest;
  String? description;

  Weather({
    this.temp,
    this.lowest,
    this.highest,
    this.description
  });

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
      temp: json['main']['temp'].toDouble(),
      lowest: json['main']['temp_min'].toDouble(),
      highest: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }

}