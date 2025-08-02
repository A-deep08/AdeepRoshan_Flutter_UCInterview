import 'package:flutter/material.dart';
import 'package:flutter_unicode_tasks/pages/login_page.dart';
import 'package:flutter_unicode_tasks/pages/signup_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/Welcome.json'),
          SizedBox(height: 40),
          FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: Size(double.infinity, 40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignupPage();
                  },
                ),
              );
            },
            child: Text('SignUp'),
          ),
          TextButton(
            style: TextButton.styleFrom(minimumSize: Size(double.infinity, 40)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
