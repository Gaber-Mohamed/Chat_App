import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/Component/Button.dart';
import 'package:scholar_chat/Component/Fields.dart';
import 'package:scholar_chat/Constants/Constants.dart';
import 'package:scholar_chat/Screens/Chat_page.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';

class RegusterPage extends StatefulWidget {
  @override
  State<RegusterPage> createState() => _RegusterPageState();
}

class _RegusterPageState extends State<RegusterPage> {
    TextEditingController controller=TextEditingController();

  String? Email, Password;
  bool loading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
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
                  'Reguster',
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
                  OnChange: (email) {
                    Email = email;
                    controller.clear();
                  },
                  hinttext: 'Email'),
              SizedBox(
                height: 5,
              ),
              TextformField(
                passwordvisible: true,
                  OnChange: (password) {
                    Password = password;
                    controller.clear();
                  },
                  hinttext: 'Password'),
              SizedBox(
                height: 20,
              ),
              Button(
                  hintText: 'REGUSTER',
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      try {
                        await Authentication();
                        snackBar(context, 'Email created');
                        Navigator.pushNamed(context , 'ChatPage');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          snackBar(context,
                              'Password should be at least 6 characters');
                        } else if (ex.code == 'email-already-in-use') {
                          snackBar(context, 'email already in use');
                        } else if (ex.code == 'invalid-email') {
                          snackBar(context, 'Email is invalid');
                        } else {
                          snackBar(
                              context, 'there is a problem, please try again');
                        }
                      } catch (ex) {
                        snackBar(context, '${ex.toString()}');
                      }
                      setState(() {
                        loading = false;
                      });
                    }
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you have an account! ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('Sign In',
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

  Future<void> Authentication() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: Email!, password: Password!);
  }
}
