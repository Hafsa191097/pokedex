
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../cubit/auth_bloc/authentication_cubit.dart';


// ignore: must_be_immutable
class SignupForm extends StatelessWidget {
  SignupForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        leading: null,
          title: const Text(
            'SignUp',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                FormBuilderTextField(
                  controller: emailController,
                  key: _emailFieldKey,
                  name: 'email',
                  scrollPadding:const EdgeInsets.only(left: 10),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'password',
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password_outlined),
                  ),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  controller: confirmpasswordController,
                  name: 'confirm_password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: (_formKey.currentState
                                ?.fields['confirm_password']?.hasError ??
                            false)
                        ? const Icon(Icons.error, color: Colors.red)
                        : const Icon(Icons.check, color: Colors.green),
                  ),
                  obscureText: true,
                  validator: (value) =>
                      _formKey.currentState?.fields['password']?.value != value
                          ? 'Not matching password field'
                          : null,
                ),
                const SizedBox(height: 30),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is AuthenticationSuccess) {
                      Navigator.of(context).pushReplacementNamed('/login');
                    }
                    if (state is AuthenticationFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return MaterialButton(
                        color: Colors.redAccent,
                        minWidth: double.infinity,
                        height: 45,
                        onPressed: () {
                            try {
                              if(passwordController.text == confirmpasswordController.text){
                                BlocProvider.of<AuthenticationCubit>(context)
                                  .createUser(emailController.text,
                                      passwordController.text);
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Password & Confirm Password Should be Same'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                              }
                              
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                        child: const Text('SignUp',
                            style: TextStyle(color: Colors.white)),
                      );
                    }

                  },
                ),
                const SizedBox(height: 30),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text.rich(
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: 'Already have an Account? ',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Log In',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.redAccent,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}