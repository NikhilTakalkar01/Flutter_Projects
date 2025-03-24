import 'dart:developer';

import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String str;
  const Screen2({super.key, required this.str});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.str);
  }

  @override
  void didUpdateWidget(covariant Screen2 oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    log("In DidUpdate");
  }
}
