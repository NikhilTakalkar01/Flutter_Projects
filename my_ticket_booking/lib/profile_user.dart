import 'package:flutter/material.dart';
import 'package:my_ticket_booking/login_screen.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
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
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 40,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 50),
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.amber),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserName",
                        style: TextStyle(
                            color: Color.fromRGBO(242, 242, 242, 1),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: Color.fromRGBO(222, 222, 222, 1),
                            size: 23,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(91)0987654321",
                            style: TextStyle(
                                color: Color.fromRGBO(222, 222, 222, 1)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: Color.fromRGBO(222, 222, 222, 1),
                            size: 23,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "username@example.com",
                            style: TextStyle(
                                color: Color.fromRGBO(222, 222, 222, 1)),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.edit_note_outlined,
                    color: Color.fromRGBO(222, 222, 222, 1),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50, left: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "My Ticket",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(222, 222, 222, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.4,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Payment History",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(222, 222, 222, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.4,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.translate_rounded,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Language",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(222, 222, 222, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.4,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(222, 222, 222, 1),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Color.fromRGBO(222, 222, 222, 1),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.4,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
