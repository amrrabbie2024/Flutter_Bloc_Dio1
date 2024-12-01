part of 'bloc.dart';

class MNewsEvents{}

class getMNewsDataEvent extends MNewsEvents{
  final String country_code;

  getMNewsDataEvent({required this.country_code});
}