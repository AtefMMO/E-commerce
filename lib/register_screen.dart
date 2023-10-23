import 'package:ecommerce/login_screen.dart';
import 'package:ecommerce/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  String name = '';

  String password = '';

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  'assets/images/Route.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'Full Name',
                              hintText: 'enter your name',
                              onChanged: (value) => name = value,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your name';
                                }
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Mobile Number',
                              hintText: 'enter your mobile no',
                              onChanged: (value) => name = value,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your mobile no';
                                }
                                if (value.length!=13) {
                                  return 'invalid number';
                                }
                              },
                              keyboardType: TextInputType.phone,
                            ),
                            TextFieldItem(
                              fieldName: 'E-mail address',
                              hintText: 'enter your email address',
                              onChanged: (value) => name = value,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'please enter your email address';
                                }
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'invalid email';
                                }
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'enter your password',
                              onChanged: (value) => password = value,
                              validator: (value) {
                                if (value == null || value.trim()!.isEmpty) {
                                  return 'please enter password';
                                }
                                if (value.trim()!.length < 6 ||
                                    value.trim()!.length > 30) {
                                  return 'password should be >6 & <30';
                                }
                              },keyboardType: TextInputType.visiblePassword,
                              isObsecure: isObsecure,
                              suffixIcon: InkWell(
                                child: isObsecure?Icon(Icons.visibility_off):Icon(Icons.visibility),
                                onTap: () {
                                  if (isObsecure) {
                                    isObsecure = false;
                                  } else {
                                    isObsecure = true;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        child: SizedBox(
                          height: 64.h,
                          width: 398.w,
                          child: Center(
                            child: Text(
                              'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: AppTheme.blue, fontSize: 20.sp),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
