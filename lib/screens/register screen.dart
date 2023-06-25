import 'package:chat_app/widgets/coustomButton.dart';
import 'package:chat_app/widgets/custom%20text%20form%20filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName='RegisterScreen';

  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset("assets/images/scholar.png"),
            const Text("Chat",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: const [
                Text("REGISTER",style: TextStyle(fontSize: 25,color: Colors.white),),
              ],
            ),
            const SizedBox(height: 15,),
            CustomTextFormFiled(
              keyboardType: TextInputType.emailAddress, text: 'Enter Email',),
            const SizedBox(height: 10,),
            CustomTextFormFiled(
                keyboardType: TextInputType.visiblePassword,
                text: 'Enter password'),
            const SizedBox(height: 10,),
            CustomButton(titelbutton: 'REGISTER'),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text("don't have an account?",style: TextStyle(color: Colors.white),),
                SizedBox(width: 5,),
                InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text("Register",style: TextStyle(fontSize: 15,color: Colors.cyanAccent),)),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
