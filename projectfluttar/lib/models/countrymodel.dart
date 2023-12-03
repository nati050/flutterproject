

// ignore: camel_case_types
// @JsonSerializable()
// final class countrysModel {
//   final List<country> countries;

//   countrysModel(this.countries);
//   factory countrysModel.fromJson(Map<String, dynamic> json) =>
//       _$countrysFromJson1(json);
// }

import 'package:json_annotation/json_annotation.dart';

part 'countrymodel.g.dart';

@JsonSerializable()
class country {
  final String? name;
  final String? code;
  country(this.name, this.code);

  factory country.fromJson(Map<String, dynamic> json) =>
      _$countryFromJson(json);
}
