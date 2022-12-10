import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/app/shared.dart';
import 'package:food_delivery_ui/domain/models/models.dart';
import 'package:food_delivery_ui/presentation/resources/colorsManager.dart';
import 'package:food_delivery_ui/presentation/resources/constants_manager.dart';
import 'package:food_delivery_ui/presentation/resources/routes_manager.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';
import 'package:food_delivery_ui/presentation/resources/values_manager.dart';
import 'package:food_delivery_ui/presentation/views/on_boarding_view/view_model/on_boarding_view_model.dart';
import 'package:food_delivery_ui/presentation/views/shared/widgets.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  //
  final PageController _pageController = PageController();

  //
  final OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  //
  @override
  void initState() {
    super.initState();
    _bind();
  }

  //
  @override
  Widget build(BuildContext context) {
    final screenHeigth = getScreenHeight(context);
    final screenWidth = getScreenWidth(context);
    return StreamBuilder(

        //
        stream: _onBoardingViewModel.outputSliderViewObject,

        //
        builder: (context, snapshot) {
          //
          return _getPageContent(snapshot.data, screenHeigth, screenWidth);
        });
  }

  //
  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }

  //
  void _bind() {
    _onBoardingViewModel.start();
  }

  //
  Widget _getPageContent(SliderViewObject? sliderViewObject,
      double screenHeight, double screenWidth) {
    //
    return sliderViewObject == null
        ? Container()
        : Scaffold(
            //
            body: PageView.builder(
                //
                controller: _pageController,

                //
                onPageChanged: (int newPageIndex) {
                  _onBoardingViewModel.onPageChanged(newPageIndex);
                },

                //
                itemCount: sliderViewObject.numOfSlides,

                //
                itemBuilder: (context, index) {
                  return OnBoardingPage(
                    sliderObject: sliderViewObject.sliderObject,
                  );
                }),

            bottomSheet: CustomBottomSheet(
              appButton1: AppButton1(
                height: screenHeight * 0.07,
                width: screenWidth * ValuesManager.v0_4,
                color: ColorsManager.green1,
                onPressed: _appButton1onPressed,
                child: Text(
                  StringsManager.next,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          );
  }

  //
  void _appButton1onPressed() {
    final nextPageIndex = _onBoardingViewModel.getNextPageIndex();
    if (nextPageIndex == -1) {
      Navigator.of(context).pushReplacementNamed(RoutesManager.loginRoute);
    }
    _pageController.animateToPage(nextPageIndex,
        duration: ConstantsManager.slidingAnimationDuration,
        curve: Curves.bounceInOut);
  }
}

//
class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage({
    super.key,
    required sliderObject,
  }) : _sliderObject = sliderObject;

  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = getScreenHeight(context);

    //
    return Column(
      //
      children: [
        //
        SizedBox(height: screenHeight * ValuesManager.v0_05),

        //
        Container(
            width: double.infinity,
            height: screenHeight * ValuesManager.v0_5,
            child: Image.asset(
              _sliderObject.imagePath,
              fit: BoxFit.cover,
            )),

        //
        SizedBox(
          height: screenHeight * ValuesManager.v0_1,
        ),

        //
        Center(
            child: Text(
          _sliderObject.title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        )),

        //
        SizedBox(height: screenHeight * ValuesManager.v0_05),

        //
        Text(
          _sliderObject.subTitle,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
