part of 'bloc.dart';

class CategoriesData {

  late final List<CategoryModel> list;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;

  CategoriesData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>CategoryModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = list.map((e)=>e.toJson()).toList();
    _data['links'] = links.toJson();
    _data['meta'] = meta.toJson();
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class CategoryModel {
  late final int id;
  late final String name;
  late final String description;
  late final String media;

  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name']??"";
    description = json['description'];
    media = json['media']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['media'] = media;
    return _data;
  }
}

class Links {

  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json){
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['last'] = last;
    _data['prev'] = prev;
    _data['next'] = next;
    return _data;
  }
}

class Meta {

  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['to'] = to;
    _data['total'] = total;
    return _data;
  }
}