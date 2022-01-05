import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/login_background.png"),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.35),
                    child: const Text(
                      "Get your groceries with Nectar",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.width * 0.05),
                              height: 25,
                              width: 40,
                              child: Image.asset(
                                "assets/images/flag.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            label: const Text("phone number"),
                            prefix: const Text("+998"),
                            suffix: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, "/verifyNumber");
                                  _nameController.clear();
                                }
                              },
                              child: const Icon(
                                Icons.check,
                                size: 20,
                              ),
                            ),
                          ),
                          validator: (v) {
                            if (v!.length < 7) {
                              return "invalid phone number";
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Or connect with social media"),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.only(left: 30),
                    onTap: () {},
                    leading: Image.asset("assets/images/g.png"),
                    title: const Text("Continue with Google"),
                    tileColor: const Color(0xff4269BD),
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.only(left: 30),
                    onTap: () {},
                    leading: Image.asset("assets/images/f.png"),
                    title: const Text("Continue with Google"),
                    tileColor: const Color(0xff4A66AC),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Do you have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/signIn");
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
