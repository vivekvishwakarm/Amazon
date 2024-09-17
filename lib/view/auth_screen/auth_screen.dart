import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:amazon/constants/common_functions.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController mobileController = TextEditingController();
  bool isLogin = false;
  String currentCountryCode = "+91";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image(
          image: const AssetImage(
            'assets/images/amazon_logo.png',
          ),
          height: height * 0.04,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyShade3,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: greyShade3,
                            ),
                          ),
                          color: greyShade1),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: height * 0.03,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: grey),
                                  color: white),
                              child: Icon(
                                Icons.circle,
                                size: height * 0.015,
                                color: isLogin ? transparent : secondaryColor,
                              ),
                            ),
                          ),
                          CommonFunctions.blankSpace(
                            0,
                            width * 0.02,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Create Account. ",
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "New to amazon?",
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.01,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLogin = true;
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: height * 0.03,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: grey),
                                      color: white),
                                  child: Icon(
                                    Icons.circle,
                                    size: height * 0.015,
                                    color:
                                        isLogin ? secondaryColor : transparent,
                                  ),
                                ),
                              ),
                              CommonFunctions.blankSpace(
                                0,
                                width * 0.02,
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Sign In. ",
                                      style: textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Already a Customer",
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CommonFunctions.blankSpace(height * 0.01, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                      context: context,
                                      onSelect: (val) {
                                        setState(() {
                                          currentCountryCode =
                                              '+${val.phoneCode}';
                                        });
                                      });
                                },
                                child: Container(
                                  height: height * 0.06,
                                  width: width * 0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: greyShade2,
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  child: Text(
                                    currentCountryCode,
                                    style: textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.06,
                                width: width * 0.64,
                                child: TextFormField(
                                  controller: mobileController,
                                  cursorColor: black,
                                  cursorHeight: 18,
                                  style: textTheme.bodySmall,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    hintStyle: textTheme.bodySmall,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: grey,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CommonFunctions.blankSpace(height * 0.02, 0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                width * 0.88,
                                height * 0.06,
                              ),
                              backgroundColor: amber,
                            ),
                            child: Text(
                              "Continue",
                              style: textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          CommonFunctions.blankSpace(height * 0.02, 0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By continuing you agree to Amazon\'s',
                                  style: textTheme.labelMedium,
                                ),
                                TextSpan(
                                  text: 'Contidion of Use',
                                  style: textTheme.labelMedium!
                                      .copyWith(color: blue),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: textTheme.labelSmall,
                                ),
                                TextSpan(
                                  text: 'Privacy Notice',
                                  style: textTheme.labelMedium!.copyWith(
                                    color: blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.05, 0),
              Column(
                children: [
                  Container(
                    height: 1,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [white, grey, white],
                      ),
                    ),
                  ),
                  CommonFunctions.blankSpace(height * 0.02, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Condition of Use",
                        style: textTheme.bodyMedium!.copyWith(
                          color: blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Privacy Notice",
                        style: textTheme.bodyMedium!.copyWith(
                          color: blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Help",
                        style: textTheme.bodyMedium!.copyWith(
                          color: blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Text(
                    '© 1996-2023, Amazon.com, Inc, or its affilliates',
                    style: textTheme.labelMedium!.copyWith(
                      color: grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
