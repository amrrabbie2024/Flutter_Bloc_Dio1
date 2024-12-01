part of 'bloc.dart';

class CitiesData {

  late final List<CityModel> list;
  late final String status;
  late final String message;

  CitiesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>CityModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = list.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class CityModel {

  late final String id;
  late final String name;

  CityModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}