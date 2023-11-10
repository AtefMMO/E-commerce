import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/ui/auth/register/cubit/register_states.dart';

import '../../../../domain/use_case/reqister_use_case.dart';
class RegisterScreenViewModel extends Cubit <RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterScreenViewModel({required this.registerUseCase}):super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;
  void register()async{
if(formKey.currentState!.validate()){
  emit(RegisterLoadingState(loadingMessage: 'Loading'));
var either= await registerUseCase.invoke(nameController.text, emailController.text, passwordController.text, confirmationPasswordController.text, phoneController.text);
either.fold((l) => emit(RegisterErrorState(errorMessage: l.errorMessage)), (r) => emit(RegisterSuccessState(resultEntity: r)));
}
  }
}