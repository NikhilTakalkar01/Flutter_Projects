import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInf extends InheritedWidget {
  String email;
  String password;
  UserInf(
      {super.key,
      required this.email,
      required this.password,
      required super.child}); //: super(child: child);

  static UserInf of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserInf>()!;
  }

  @override
  bool updateShouldNotify(UserInf oldWidget) {
    return true;
  }
}
