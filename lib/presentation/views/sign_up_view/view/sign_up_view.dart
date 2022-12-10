import 'package:flutter/material.dart';
import 'package:food_delivery_ui/app/shared.dart';
import 'package:food_delivery_ui/presentation/resources/colorsManager.dart';
import 'package:food_delivery_ui/presentation/resources/routes_manager.dart';
import 'package:food_delivery_ui/presentation/resources/strings_manager.dart';
import 'package:food_delivery_ui/presentation/resources/values_manager.dart';
import 'package:food_delivery_ui/presentation/views/shared/widgets.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  //
  bool isKeepMeSignedInChecked = false;
  bool isEmailMeChecked = false;

  @override
  Widget build(BuildContext context) {
    //
    final screenHeight = getScreenHeight(context);
    final screenWidth = getScreenWidth(context);

    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //
      body: Column(
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
                //
                Text(
                  StringsManager.signUpForFree,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_025),

                //
                Form(
                  child: Column(
                    //
                    children: [
                      //
                      const LoginSignUpTextField(
                        hintTxt: StringsManager.userName,
                        prefixIcon: Icon(Icons.person_rounded),
                      ),

                      //
                      SizedBox(height: screenHeight * ValuesManager.v0_015),

                      //
                      const LoginSignUpTextField(
                        hintTxt: StringsManager.email,
                        prefixIcon: Icon(Icons.email_rounded),
                      ),

                      //
                      SizedBox(height: screenHeight * ValuesManager.v0_015),

                      //
                      LoginSignUpTextField(
                        hintTxt: StringsManager.password,
                        prefixIcon: const Icon(Icons.lock_rounded),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.visibility_rounded),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_025),

                //
                CirculairCheckedBox(
                  value: isKeepMeSignedInChecked,
                  text: StringsManager.keepMeSignedIn,
                ),

                //
                SizedBox(height: screenHeight * ValuesManager.v0_01),

                //
                CirculairCheckedBox(
                  value: isEmailMeChecked,
                  text: StringsManager.emailMeAboutSpecialPricing,
                ),
              ],
            ),
          ),
        ],
      ),

      //
      bottomSheet: CustomBottomSheet(
        textBtnTxt: StringsManager.alreadyHaveAnAccount,
        textBtnCallback: () {
          Navigator.of(context).pushReplacementNamed(RoutesManager.loginRoute);
        },
        appButton1: AppButton1(
            height: screenHeight * ValuesManager.v0_075,
            width: screenWidth * ValuesManager.v0_4,
            color: ColorsManager.green1,
            child: Text(
              StringsManager.signUp,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {}),
      ),
    );
  }
}

//

class CirculairCheckedBox extends StatefulWidget {
  bool value;
  final String text;

  CirculairCheckedBox({required this.value, required this.text});

  @override
  State<CirculairCheckedBox> createState() => _CirculairCheckedBoxState();
}

class _CirculairCheckedBoxState extends State<CirculairCheckedBox> {
  @override
  Widget build(BuildContext context) {
    //
    final screenWidth = getScreenWidth(context);

    //
    return Row(
      children: [
        Container(
          //
          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle,

              //
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(ValuesManager.v0_25),
                  blurRadius: ValuesManager.v10,
                  spreadRadius: ValuesManager.v5_0,
                  offset: const Offset(0, ValuesManager.v5_0),
                )
              ]),

          //

          //
          child: CircleAvatar(
            //
            backgroundColor:
                widget.value ? ColorsManager.primaryColor : ColorsManager.white,

            //

            //
            child: IconButton(
              icon: widget.value
                  ? const Icon(
                      Icons.check_rounded,
                      color: ColorsManager.white,
                    )
                  : Container(),
              onPressed: () {
                setState(() {
                  widget.value = !widget.value;
                });
              },
            ),
          ),
        ),

        //
        //
        SizedBox(
          width: screenWidth * 0.05,
        ),

        //
        Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
