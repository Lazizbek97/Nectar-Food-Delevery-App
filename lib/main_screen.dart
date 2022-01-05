import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pushNamed(context, "/getStarted"),
        child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.4,
              horizontal: MediaQuery.of(context).size.width * 0.2,
            ),
            decoration: BoxDecoration(color: Colors.green),
            child: Stack(
              children: [
                Image.asset("assets/images/logo.png"),
                const Positioned(
                  top: 50,
                  left: 80,
                  child: Text(
                    "Online Grocceries",
                    style: TextStyle(
                        fontSize: 16, color: Colors.white, inherit: false),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
