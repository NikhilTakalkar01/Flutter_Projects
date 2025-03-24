import 'package:flutter/material.dart';
import 'package:my_ticket_booking/login_screen.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => SingUpPageState();
}

class SingUpPageState extends State<SingUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Sing up",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              
            );
            
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 34,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TextField(
              style: TextStyle(color: Colors.white, fontSize: 28),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 10.0),
                  ),
                  prefixIcon: Icon(
                    Icons.call_outlined,
                    size: 36,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 270,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[600],
                    minimumSize: const Size(0, 50)),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or continue with',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 275,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    backgroundColor: const Color.fromRGBO(26, 26, 26, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/facebook.png"),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Facebook',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 275,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    backgroundColor: const Color.fromRGBO(26, 26, 26, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/Group.png"),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Google',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              //height: 30,
              width: 300,
              child: const Text(
                "By sign in or sign up, you agree to our Terms of Service and Privacy Policy",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
