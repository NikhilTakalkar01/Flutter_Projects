import 'package:flutter/material.dart';
import 'package:my_ticket_booking/admin_movie_info.dart';
import 'package:my_ticket_booking/admin_side.dart';
import 'package:my_ticket_booking/login_screen.dart';
// import 'package:my_ticket_booking/login_screen.dart';
// import 'package:my_ticket_booking/profile_user.dart';
// import 'package:my_ticket_booking/sing_in.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminSide(),
    );
  }
}
