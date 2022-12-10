import 'dart:async';

import 'package:food_delivery_ui/domain/models/models.dart';
import 'package:food_delivery_ui/presentation/base/base_view_model.dart';
import 'package:food_delivery_ui/presentation/resources/assets_manager.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingVieWModelInputs, onBoardingViewModelOutputs {
  //
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  //
  late final List<SliderObject> _list;
  int _pageCurrentIndex = 0;

  //
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDatatoView();
  }

  // onBoarding private Functions
  List<SliderObject> _getSliderData() {
    //
    return [
      //
      SliderObject(
          imagePath: ImagesManager.onBoardingLogo1Path,
          title: StringsManager.onBoardingTitle1,
          subTitle: StringsManager.onBoardingSubTitle1),

      //
      SliderObject(
          imagePath: ImagesManager.onBoardingLogo2Path,
          title: StringsManager.onBoardingTitle2,
          subTitle: StringsManager.onBoardingSubTitle2),
    ];
  }

  //
  void _postDatatoView() {
    //
    inputSliderViewObject.add(SliderViewObject(
        sliderObject: _list[_pageCurrentIndex],
        numOfSlides: _list.length,
        currentIndex: _pageCurrentIndex));
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slidreViewObject) => slidreViewObject);

  @override
  int getNextPageIndex() {
    if (_pageCurrentIndex == _list.length - 1) return -1;
    return _pageCurrentIndex + 1;
  }

  @override
  int getPreviousPageIndex() {
    if (_pageCurrentIndex == 0) return _list.length - 1;
    return _pageCurrentIndex + 1;
  }

  @override
  void onPageChanged(int newPageIndex) {
    _pageCurrentIndex = newPageIndex;
    _postDatatoView();
  }
}

abstract class OnBoardingVieWModelInputs {
  //
  int getNextPageIndex();

  //
  int getPreviousPageIndex();

  //
  void onPageChanged(int newPageIndex);

  //Stream Controller inputs
  Sink get inputSliderViewObject;
}

// ignore: camel_case_types
abstract class onBoardingViewModelOutputs {
  // Stream Controller Outputs
  Stream<SliderViewObject> get outputSliderViewObject;
}
