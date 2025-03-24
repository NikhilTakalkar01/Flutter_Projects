import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_life_cycle/screen2.dart';

class WidgetLifecycle extends StatefulWidget {
  const WidgetLifecycle({super.key});

  @override
  State<WidgetLifecycle> createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  String str = "C2W";
  @override
  Widget build(BuildContext context) {
    log("In Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen1"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Screen2(str: str),
            // Text(str),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    Screen2(str: str);
                    str = (str == 'C2W') ? 'Core2web' : 'C2W';
                  },
                );
              },
              child: const Text("Change Text"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log("In didChangeDependencies");
  }

  @override
  void initState() {
    super.initState();
    log("In initState");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    log("In deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    log("In dispose");
  }


}
