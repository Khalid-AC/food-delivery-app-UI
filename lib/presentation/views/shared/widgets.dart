import 'package:flutter/material.dart';
import 'package:food_delivery_ui/app/shared.dart';
import 'package:food_delivery_ui/presentation/resources/assets_manager.dart';
import 'package:food_delivery_ui/presentation/resources/colorsManager.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';
import 'package:food_delivery_ui/presentation/resources/values_manager.dart';

// Buttons
class AppButton1 extends StatelessWidget {
  //
  final double height;
  final double width;
  final Color color;
  final Widget child;

  //
  final Function onPressed;

  const AppButton1(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      //
      color: Colors.transparent,

      //
      child: InkWell(
        onTap: () {
          onPressed();
        },

        //

        highlightColor: ColorsManager.black1,

        borderRadius: BorderRadius.circular(ValuesManager.v15),

        //
        child: Ink(
          //
          height: height,
          width: width,

          //
          decoration: BoxDecoration(
            //
            borderRadius: BorderRadius.circular(ValuesManager.v15),

            //
            gradient: LinearGradient(colors: [
              ColorsManager.green1.withOpacity(ValuesManager.v0_7),
              ColorsManager.green1,
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),

          //
          child: Center(child: child),
        ),
      ),
    );
  }
}

//
class BgImgWithLogo extends StatelessWidget {
  const BgImgWithLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = getScreenHeight(context);
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Stack(
        //
        children: [
          //
          Container(
              width: double.infinity,
              child: Image.asset(
                ImagesManager.splashRouteBgImg,
                fit: BoxFit.cover,
              )),

          //
          Center(
              heightFactor: ValuesManager.v1_8,
              child: Image.asset(ImagesManager.logo))
        ],
      ),
    );
  }
}

//
class LoginSignUpTextField extends StatelessWidget {
  final String hintTxt;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const LoginSignUpTextField(
      {super.key, required this.hintTxt, this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ValuesManager.v15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(ValuesManager.v0_3),
                spreadRadius: ValuesManager.v5_0,
                blurRadius: ValuesManager.v10,
                offset: const Offset(ValuesManager.v0, ValuesManager.v10))
          ]),
      child: TextFormField(
        //
        cursorColor: ColorsManager.grey1,
        style: Theme.of(context).textTheme.labelMedium,

        //

        //
        decoration: InputDecoration(
          //
          prefixIcon: prefixIcon,

          suffixIcon: suffixIcon,
          //
          hintText: hintTxt,
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  final String? textBtnTxt;
  final Function? textBtnCallback;
  final AppButton1 appButton1;

  const CustomBottomSheet(
      {super.key,
      this.textBtnTxt,
      this.textBtnCallback,
      required this.appButton1});

  //
  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = getScreenHeight(context);

    //
    return Container(
      //
      height: screenHeight * 0.15,
      color: Colors.transparent,
      //
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        //
        children: [
          //
          Center(child: appButton1),

          SizedBox(height: screenHeight * ValuesManager.v0_01),

          //
          TextButton(
              child: Text(
                textBtnTxt != null ? textBtnTxt! : StringsManager.emptyString,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onPressed: () {
                if (textBtnCallback != null) {
                  textBtnCallback!();
                }
              }),
        ],
      ),
    );
  }
}
