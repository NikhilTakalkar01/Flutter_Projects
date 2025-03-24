import 'package:demo_app/firebase/player_screen.dart';
import 'package:demo_app/firebase/session_data.dart';
import 'package:demo_app/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  void navigate(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        bool status = false;
        await SessionData.getSessionData();

        if (SessionData.isLogin!) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return PlayerScreen(
                  email: SessionData.emailId!,
                );
              },
            ),
          );
        } else {
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const LoginScreen();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/undraw.svg",
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber[600]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
