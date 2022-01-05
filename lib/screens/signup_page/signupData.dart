import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKeyUsername = GlobalKey<FormState>();
  final _nameControllerUsername = TextEditingController();
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
            SizedBox(
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
                    "Sign Up",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter your credentials to continue"),
                  Form(
                    key: _formKeyUsername,
                    child: TextFormField(
                      controller: _nameControllerUsername,
                      decoration: const InputDecoration(
                        label: Text("Username"),
                      ),
                      validator: (value) {
                        if (value!.length >= 6 && value.isEmpty) {
                          return "enter at least 6 characters";
                        }
                      },
                    ),
                  ),
                  Form(
                    key: _formKeyEmail,
                    child: TextFormField(
                      controller: _nameControllerEmail,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                      ),
                      validator: (value) {
                        if (!(value!.contains("@") && value.contains("."))) {
                          return "this is not email";
                        }
                      },
                    ),
                  ),
                  Form(
                    key: _formKeyPassword,
                    child: TextFormField(
                      controller: _nameControllerPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Password"),
                        counterStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length <= 8) {
                          return "enter no less than 8 characters";
                        }
                      },
                    ),
                  ),
                  const Text(
                      "By continuing you agree to our Terms of Service and Privacy Policy"),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKeyUsername.currentState!.validate() &&
                          _formKeyEmail.currentState!.validate() &&
                          _formKeyPassword.currentState!.validate()) {
                        user['name'] = _nameControllerUsername.text;
                        user['email'] = _nameControllerEmail.text;
                        user['password'] = _nameControllerPassword.text;

                        Navigator.pushNamedAndRemoveUntil(
                            context, "/mainMenu", (route) => false);
                      }
                    },
                    child: const Text("Sign Up"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.35,
                          vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/signIn");
                        },
                        child: const Text(
                          "Sign In",
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
