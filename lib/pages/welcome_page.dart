import 'package:echotap/pages/login_page.dart';
import 'package:echotap/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            child: Text(
              'EchoTap',
              style: GoogleFonts.inter(
                color: const Color.fromARGB(255, 73, 82, 185),
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          SizedBox(height: 20),
          Lottie.asset('assets/lotties/mouse click.json'),
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
