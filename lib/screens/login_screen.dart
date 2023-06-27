import 'package:chat_app/screens/register%20screen.dart';
import 'package:chat_app/widgets/coustomButton.dart';
import 'package:chat_app/widgets/custom%20text%20form%20filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'loginScreen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset("assets/images/scholar.png"),
              const Text(
                "Chat",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 80,),
              Row(
                children: const [
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormFiled(
                keyboardType: TextInputType.emailAddress,
                text: 'Enter Email',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormFiled(
                  keyboardType: TextInputType.visiblePassword,
                  text: 'Enter password'),
              const SizedBox(
                height: 10,
              ),
              CustomButton(titelbutton: 'LOGIN', onTap: () {  },),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: Text(
                        "Register",
                        style:
                            TextStyle(fontSize: 15, color: Colors.cyanAccent),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
