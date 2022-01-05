import 'package:flutter/material.dart';
import 'package:grocceries/main_screen.dart';
import 'package:grocceries/screens/about_page/aboutPage.dart';
import 'package:grocceries/screens/cart_page/cartPage.dart';
import 'package:grocceries/screens/favorite_page/favoritePage.dart';
import 'package:grocceries/screens/menu_page/explorePage.dart';
import 'package:grocceries/screens/menu_page/mainMenu.dart';
import 'package:grocceries/screens/payment_acceptance/accept_pay.dart';
import 'package:grocceries/screens/search_result/search_result.dart';
import 'package:grocceries/screens/signup_page/login.dart';
import 'package:grocceries/screens/signup_page/getstart.dart';
import 'package:grocceries/screens/login_page/signin.dart';
import 'package:grocceries/screens/signup_page/selectLocation.dart';
import 'package:grocceries/screens/signup_page/signupData.dart';
import 'package:grocceries/screens/signup_page/verify_number.dart';

void main(List<String> args) {
  runApp(const MainRout());
}

class MainRout extends StatelessWidget {
  const MainRout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MainScreen(),
        "/loginPage": (context) => const LoginPage(),
        "/getStarted": (context) => const GetStarted(),
        "/signIn": (context) => const SignIn(),
        "/verifyNumber": (context) => const VerifyNumber(),
        "/selectLocation": (context) => const SelecetLocation(),
        "/signUp": (context) => const SignUpPage(),
        "/mainMenu": (context) => const MainMenu(),
        "/explorePage": (context) => const ExplorePage(),
        "/aboutPage": (context) => const AboutPage(),
        "/cartPage": (context) => const CartPage(),
        "/favorotePage": (context) => const FavoritePage(),
        "/acceptPayment": (context) => const AcceptPayment(),
        "/searchPage": (context) => const SearchPage(),
      },
      initialRoute: '/',
    );
  }
}
