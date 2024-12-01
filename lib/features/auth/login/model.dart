part of 'bloc.dart';

class UserData {

  late final UserModel userModel;
  late final String status;
  late final String message;

  UserData.fromJson(Map<String, dynamic> json){
    userModel = UserModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = userModel.toJson();
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class UserModel {
  late final int id;
  late final String fullname;
  late final String phone;
  late final String email;
  late final String image;
  late final int isBan;
  late final bool isActive;
  late final int unreadNotifications;
  late final String userType;
  late final String token;
  late final Null country;
  late final City city;
  late final Null identityNumber;
  late final int userCartCount;

    String deviceToken="test";

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    isBan = json['is_ban'];
    isActive = json['is_active'];
    unreadNotifications = json['unread_notifications'];
    userType = json['user_type'];
    token = json['token'];
    country = null;
    city = City.fromJson(json['city']);
    identityNumber = null;
    userCartCount = json['user_cart_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullname'] = fullname;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['image'] = image;
    _data['is_ban'] = isBan;
    _data['is_active'] = isActive;
    _data['unread_notifications'] = unreadNotifications;
    _data['user_type'] = userType;
    _data['token'] = token;
    _data['country'] = country;
    _data['city'] = city.toJson();
    _data['identity_number'] = identityNumber;
    _data['user_cart_count'] = userCartCount;
    return _data;
  }
}

class City {

  late final String id;
  late final String name;

  City.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}