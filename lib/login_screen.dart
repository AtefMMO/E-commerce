import 'package:ecommerce/app_theme.dart';
import 'package:ecommerce/register_screen.dart';
import 'package:ecommerce/text_field_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login screen';
  static var formKey = GlobalKey<FormState>();

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = '';

  String password = '';

  bool isObsecure=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        color: Theme.of(context).primaryColor,height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 91.h, bottom: 87.h, left: 97.w, right: 97.w),
                child: Image.asset(
                  'assets/images/Route.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16.sp),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: LoginScreen.formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'User Name',
                              hintText: 'enter your name',
                              onChanged: (value) => name = value,
                              validator: (value) {
                                if(value==null||value.trim().isEmpty){
                                  return 'please enter your name';
                                }
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'enter your password',
                              onChanged: (value) => password = value,
                              validator: (value) {
                                if ( value == null|| value.trim()!.isEmpty ) {
                                  return 'please enter password';
                                }
                                if (value.trim()!.length < 6 ||
                                    value.trim()!.length > 30) {
                                  return 'password should be >6 & <30';
                                }
                              },
                              isObsecure:isObsecure ,
                              suffixIcon: InkWell(
                                child: isObsecure?Icon(Icons.visibility_off):Icon(Icons.visibility),
                                onTap: () {
                                  if(isObsecure){
                                    isObsecure=false;
                                  }else{
                                    isObsecure=true;
                                  }
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'Forgot Password',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppTheme.white),
                      textAlign: TextAlign.end,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: ElevatedButton(
                        onPressed: () {
                          if (LoginScreen.formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(
                                context, RegisterScreen.routeName);
                          }
                        },
                        child: Container(
                          height: 64.h,
                          width: 398.w,
                          child: Center(
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: AppTheme.blue, fontSize: 20.sp),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.white,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 30.h, left: 18.w, right: 18.w),
                        child: Row(
                          children: [
                            Text(
                              'Don’t have an account? ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                              },
                              child: Text(
                                'Create Account',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
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
