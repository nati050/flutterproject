import 'package:json_annotation/json_annotation.dart';
import 'package:projectfluttar/models/countrymodel.dart';

part 'countrymodel1.g.dart';

// ignore: camel_case_types
@JsonSerializable()
class countrysModel {
  final List<country>? countries;

  countrysModel(this.countries);
  factory countrysModel.fromJson(Map<String, dynamic> json) =>
      _$countrysModelFromJson(json);
}
