part of 'bloc.dart';

class SliderData {

  late final List<SliderModel> data;
  late final String status;
  late final String message;

  SliderData.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']??[]).map((e)=>SliderModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class SliderModel {

  late final int id;
  late final String media;

  SliderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['media'] = media;
    return _data;
  }
}