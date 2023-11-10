import 'package:ecommerce/ui/auth/login/cubit/login_screen_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/use_case/login_use_case.dart';

class LoginScreenViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  bool isObsecure = true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState(loadingMessage: 'loading ..'));
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold((error) {
        emit(LoginErrorState(errorMessage: error.errorMessage));
      }, (respone) {
        emit(LoginSuccessState(resultEntity: respone));
      });
    }
  }
}
