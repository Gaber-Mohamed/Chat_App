import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Component/Button.dart';
import 'package:scholar_chat/Component/Fields.dart';
import 'package:scholar_chat/Constants/Constants.dart';
import 'package:scholar_chat/Screens/Reguster_Page.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    TextEditingController controller=TextEditingController();
  String? Email, Password;
  bool isloading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Form(
            key: formKey,
            child: ListView(children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextformField(
                  OnChange: (data) {
                    Email = data;
                    controller.clear();
                  },
                  hinttext: 'Email',
                  ),
              SizedBox(
                height: 5,
              ),
              TextformField(
                passwordvisible: true,
                  OnChange: (data) {
                    Password = data;
                    controller.clear();
                  },
                  hinttext: 'Password'),
              SizedBox(
                height: 20,
              ),
              Button(
                  hintText: 'LOGIN',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isloading = true;
                      });
                      try {
                        await LoginUser();
                        Navigator.pushNamed(context, 'ChatPage' , arguments: Email);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'wrong-password') {
                          snackBar(context, 'Wrong Password');
                        } else if (ex.code == 'user-not-found') {
                          snackBar(
                              context, 'No user found for that email');
                        } else {
                          snackBar(
                              context, 'check your email and password.');
                        }
                      } catch (ex) {
                        snackBar(context, '${ex.toString()}');
                      }
                      setState(() {
                        isloading = false;
                      });
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account! ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'RegusterPage');
                    },
                    child: Text('Sign Up',
                        style: TextStyle(fontSize: 18, color: Colors.white70)),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  

  Future<void> LoginUser() async {
    var authen = FirebaseAuth.instance;
    UserCredential user = await authen.signInWithEmailAndPassword(
        email: Email!, password: Password!);
  }
}
