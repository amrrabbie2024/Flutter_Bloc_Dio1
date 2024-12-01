part of 'bloc.dart';

class SliderStates{}

class GetSliderLoadingData extends SliderStates{}

class GetSliderFailedData extends SliderStates{
  final String msg;

  GetSliderFailedData({required this.msg});
}

class GetSliderSucessData extends SliderStates{
  final List<SliderModel> list;

  GetSliderSucessData({required this.list});
}