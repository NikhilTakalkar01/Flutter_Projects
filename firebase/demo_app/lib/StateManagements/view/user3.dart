import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/StateManagements/controller/user_info.dart';
import 'package:flutter/material.dart';

class User3 extends StatefulWidget {
  const User3({super.key});

  @override
  State<User3> createState() => _User2State();
}

class _User2State extends State<User3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserInf obj = context.dependOnInheritedWidgetOfExactType()!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Get From Inherited Widget",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              color: Colors.blue[50],
              child: ListTile(
                title: Text(obj.email),
                subtitle: Text(obj.password),
              ),
            )
          ],
        ),
      ),
    );
  }
}
