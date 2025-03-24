import 'package:flutter/material.dart';
import 'package:my_ticket_booking/login_screen.dart';
//import 'package:my_ticket_booking/model.dart';
import 'package:my_ticket_booking/profile_user.dart';
//import 'package:flutter_svg/svg.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
              color: Colors.white,
            )),
        title: const Text(
          "Sing In",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 65),
            child: SizedBox(
                height: 250,
                width: 250,
               // child: //SvgPicture.asset("assets/sign_in.svg")
                // child: Image.asset(
                //   "assets/rb_7873.png",
                //   fit: BoxFit.cover,
                // ),
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "UserName",
              style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
              decoration: InputDecoration(
                labelText: "Enter User Name",
                labelStyle:
                    TextStyle(color: Color.fromARGB(192, 255, 255, 255)),
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Password",
              style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
              decoration: InputDecoration(
                labelText: "Enter Your Password",
                labelStyle:
                    TextStyle(color: Color.fromARGB(192, 255, 255, 255)),
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileUser()),
                );
                setState(() {});
              },
              child: Container(
                height: 45,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber),
                child: const Center(
                    child: Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(218, 12, 4, 4)),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
