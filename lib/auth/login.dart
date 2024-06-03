import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otw1/components/custombuttonauth.dart';
import 'package:otw1/components/customlogoauth.dart';
// import 'package:otw1/components/textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 100),
              const CustomLogoAuth(),
              Container(height: 20),
              Center(
                child: const Text("Login",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: const Text("Enter your account",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromARGB(255, 69, 69, 69))),
              ),
              Container(height: 10),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  labelText: "Enter Your Email",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Container(height: 13),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: "Enter Your Password",
                  labelStyle: TextStyle(fontSize: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                alignment: Alignment.topRight,
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          CustomButtonAuth(
              title: "Login",
              onPressed: () async{
                              try {
                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                Navigator.of(context).pushReplacementNamed("vehicalee");
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                  AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'error',
                desc: 'No user found for that email.',
                // btnCancelOnPress: () {},
                // btnOkOnPress: () {},
                 ).show();
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                  AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'error ',
                  desc: 'Wrong password provided for that user.',
                  // btnCancelOnPress: () {},
                  // btnOkOnPress: () {},
                  ).show();
                }
              }
                
              }),
          Container(height: 20),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("signup");
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't Have An Account ? ",
                ),
                TextSpan(
                    text: "Register",
                    style: TextStyle(
                        color: Color.fromARGB(255, 39, 39, 39),
                        fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
