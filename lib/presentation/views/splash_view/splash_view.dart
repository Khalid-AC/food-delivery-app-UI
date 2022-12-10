import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/presentation/resources/assets_manager.dart';
import 'package:food_delivery_ui/presentation/resources/constants_manager.dart';
import 'package:food_delivery_ui/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //
  Timer? _timer;

  //
  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Column(
        children: [
          //
          Container(
            width: double.infinity,
            child: Image.asset(
              ImagesManager.splashRouteBgImg,
              fit: BoxFit.cover,
            ),
          ),

          //
          Image.asset(ImagesManager.logo)
        ],
      ),
    );

    //
  }

  //
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  //
  void _startDelay() {
    _timer = Timer(ConstantsManager.splashRouteDelay, _goNext);
  }

  //
  void _goNext() {
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);
  }
}
