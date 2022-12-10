import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_ui/app/shared.dart';
import 'package:food_delivery_ui/presentation/resources/assets_manager.dart';
import 'package:food_delivery_ui/presentation/resources/colorsManager.dart';
import 'package:food_delivery_ui/presentation/resources/font_manager.dart';
import 'package:food_delivery_ui/presentation/resources/routes_manager.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';
import 'package:food_delivery_ui/presentation/resources/styles_manager.dart';
import 'package:food_delivery_ui/presentation/resources/values_manager.dart';
import 'package:food_delivery_ui/presentation/views/shared/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = getScreenHeight(context);
    final screenWidth = getScreenWidth(context);

    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //

      //

      //
      body: Column(
        //
        children: [
          //
          const BgImgWithLogo(),

          //
          SizedBox(height: screenHeight * ValuesManager.v0_01),

          //
          Padding(
            //
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p40),

            //
            child: Column(
              //
              children: [
                Text(
                  StringsManager.loginToYourAccount,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_025),

                Form(
                  //

                  child: Column(
                    //
                    children: [
                      //
                      const LoginSignUpTextField(hintTxt: StringsManager.email),

                      //
                      SizedBox(height: screenHeight * ValuesManager.v0_015),

                      //
                      const LoginSignUpTextField(
                          hintTxt: StringsManager.password),
                    ],
                  ),
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_025),

                //
                Text(
                  StringsManager.orContinueWith,
                  style: getBoldStyle(
                      fontSize: FontSizeManager.s12,
                      color: ColorsManager.black1),
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_01),

                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //
                  children: [
                    //
                    ContinueWithBox(
                      label: StringsManager.facebook,
                      logoPath: ImagesManager.facebookLogoPath,
                      width: screenWidth * ValuesManager.v0_35,
                    ),

                    //
                    ContinueWithBox(
                      label: StringsManager.google,
                      logoPath: ImagesManager.googleLogoPath,
                      width: screenWidth * ValuesManager.v0_35,
                    ),
                  ],
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_015),

                //
                TextButton(
                    child: Text(
                      StringsManager.forgotYourPassword,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onPressed: () {}),
              ],
            ),
          )
        ],
      ),

      //
      bottomSheet: CustomBottomSheet(
        textBtnTxt: StringsManager.createNewAccount,
        textBtnCallback: () {
          Navigator.of(context).pushReplacementNamed(RoutesManager.signUpRoute);
        },
        appButton1: AppButton1(
            height: screenHeight * ValuesManager.v0_075,
            width: screenWidth * ValuesManager.v0_4,
            color: ColorsManager.green1,
            child: Text(
              StringsManager.login,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {}),
      ),
    );
  }
}

class ContinueWithBox extends StatelessWidget {
  //
  final String label;
  final String logoPath;
  final double width;

  const ContinueWithBox(
      {super.key,
      required this.label,
      required this.logoPath,
      required this.width});

  @override
  Widget build(BuildContext context) {
    //

    //
    return Container(
      //
      padding: const EdgeInsets.all(ValuesManager.v20),
      width: width,

      //

      //
      decoration: BoxDecoration(
        //
        borderRadius: BorderRadius.circular(
          ValuesManager.v15,
        ),

        //
        color: ColorsManager.white,

        //
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(ValuesManager.v0_3),
              spreadRadius: ValuesManager.v5_0,
              blurRadius: ValuesManager.v10,
              offset: const Offset(ValuesManager.v0, ValuesManager.v10))
        ],

        //
        shape: BoxShape.rectangle,
        /* border: Border.all(
          color: ColorsManager.grey1,
          width: ValuesManager.v0_25,
        ),*/
      ),

      //
      child: Row(
        //
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        //
        children: [
          //
          SvgPicture.asset(logoPath),

          //
          Text(
            label,
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}


//
