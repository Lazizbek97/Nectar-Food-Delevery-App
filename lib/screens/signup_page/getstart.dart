import 'dart:convert';

import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          30, MediaQuery.of(context).size.height * 0.5, 30, 5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/getstart.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(color: Colors.white, fontSize: 50, inherit: false),
          ),
          const Text(
            'to our store',
            style: TextStyle(color: Colors.white, fontSize: 50, inherit: false),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
            child: Text(
              "Get your groceries in as fast as one hour",
              style: TextStyle(color: Colors.white, inherit: false),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/loginPage"),
            child: const Text("Get Started"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
