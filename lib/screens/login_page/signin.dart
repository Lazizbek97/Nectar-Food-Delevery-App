import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';
import 'package:grocceries/screens/signup_page/login.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _nameControllerEmail = TextEditingController();
  final _formKeyPassword = GlobalKey<FormState>();
  final _nameControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Image.asset("assets/images/redcarrot.png"),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter your emails and password"),
                  Form(
                    key: _formKeyEmail,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _nameControllerEmail,
                          decoration: const InputDecoration(
                            label: Text("Email"),
                          ),
                          validator: (v) {
                            if (v.toString() != user['email']) {
                              return "incorrect email";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Form(
                    key: _formKeyPassword,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameControllerPassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            label: Text("Password"),
                            counterText: "Forgot Password?",
                            counterStyle:
                                TextStyle(fontWeight: FontWeight.bold),
                          ),
                          validator: (v) {
                            if (v.toString() != user['password']) {
                              return "incorrect password";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKeyEmail.currentState!.validate() &&
                            _formKeyPassword.currentState!.validate()) {
                          Navigator.pushNamed(context, "/mainMenu");
                        }
                      },
                      child: const Text("Log In"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.35,
                            vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
