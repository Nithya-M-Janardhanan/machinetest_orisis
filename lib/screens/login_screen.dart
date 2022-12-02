import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_orisis/grid_dashboard.dart';
import 'package:machine_test_orisis/sharedpref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your email',
                      border: OutlineInputBorder()
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
               const SizedBox(height: 20,),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder()
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Enter Password';
                    }
                    return null;
                  },
                ),
               const SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    FocusScope.of(context).unfocus();
                    if(_formKey.currentState!.validate()){
                      SharedPreferenceHelper.setEmail(emailController.text);
                      SharedPreferenceHelper.setPassword(passwordController.text);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GridDashboard()));
                    }
                  },
                  child:const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
