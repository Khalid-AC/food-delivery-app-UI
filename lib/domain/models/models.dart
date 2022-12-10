// onBoarding models
class SliderObject {
  //
  String imagePath;
  String title;
  String subTitle;
  

  //
  SliderObject(
      {required this.imagePath,
      required this.title,
      required this.subTitle});
}

class SliderViewObject {
  //
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  //
  SliderViewObject(
      {required this.sliderObject,
      required this.numOfSlides,
      required this.currentIndex});
}
