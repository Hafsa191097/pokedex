import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'login_form.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SignUp',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),centerTitle: true, backgroundColor: Colors.redAccent,elevation: 0),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                FormBuilderTextField(
                  key: _emailFieldKey,
                  name: 'email',
                  scrollPadding: EdgeInsets.only(left:10),
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
                  decoration: const InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.password_outlined),),
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                const SizedBox(height: 10),
                FormBuilderTextField(
                  name: 'confirm_password',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: (_formKey.currentState?.fields['confirm_password'] ?.hasError ?? false)
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
                
                MaterialButton(
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  height: 45,
                  onPressed: () {
                    if (_formKey.currentState?.isValid ?? false) {
                      log("not signup");
                      if (true) {
                        log("Done signupp");
                      }
                    }
                    debugPrint(_formKey.currentState?.value.toString());
                  },
                  child: const Text('SignUp', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 30),
                TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) =>const LoginForm()));
                },
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                  child:const Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    text: 'Already have an Account? ',
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.grey, decoration: TextDecoration.none, ),
                      
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Log In',
                        
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal, color: Colors.redAccent, decoration: TextDecoration.none,
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
