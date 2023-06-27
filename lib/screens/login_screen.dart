import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/register%20screen.dart';
import 'package:chat_app/widgets/coustomButton.dart';
import 'package:chat_app/widgets/custom%20text%20form%20filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;
  GlobalKey<FormState>formKey=GlobalKey();
  bool isLoding=false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
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
                    onChange: (data){
                      email=data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    text: 'Enter Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFiled(
                      onChange: (data){
                        password=data;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      text: 'Enter password'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () async {
                      if(formKey.currentState!.validate()) {
                        isLoding=true;
                        setState(() {

                        });
                        try {
                          await loginUser();
                          Navigator.pushNamed(context, ChatScreen.routeName);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackBar(context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                       showSnackBar(context, 'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        isLoding=false;
                        setState(() {

                        });
                      }
                    },
                    titelbutton: 'LOGIN'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "don't have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                          child: const Text(
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
        ),
      ),
    );
  }
void showSnackBar(BuildContext context,String massege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.blueGrey,

      content:
      Text(massege)));
}

Future<void> loginUser() async {
  UserCredential user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
      email: email!, password: password!);
}
}