import 'package:chat_app/helper/showsnakebar.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/widgets/coustomButton.dart';
import 'package:chat_app/widgets/custom%20text%20form%20filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  const SizedBox(
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
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: const [
                      Text(
                        "REGISTER",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFiled(
                    onChange: (data) {
                      email = data;
                    },
                    keyboardType: TextInputType.emailAddress,
                    text: 'Enter Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFiled(
                      onChange: (data) {
                        password = data;
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
                            await regesterUser();
                            Navigator.pushNamed(context, ChatScreen.routeName);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                  context, 'The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                          isLoding=false;
                          setState(() {

                          });
                        }
                      },
                      titelbutton: 'REGISTER'),
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
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "LOGIN",
                            style:
                                TextStyle(fontSize: 15, color: Colors.cyanAccent),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Future<void> regesterUser() async {
       UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email!, password: password!);
  }
}
