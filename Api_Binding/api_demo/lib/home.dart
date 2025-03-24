import 'dart:convert';
import 'dart:developer';

import 'package:api_demo/get_data.dart';
import 'package:api_demo/post_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Binding"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    getListOfAllObject();
                  },
                  child: Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(15, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 4, 17, 28),
                          width: 1.2),
                    ),
                    child: const Center(
                      child: Text(
                        "Get Data",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return PostData();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(15, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 4, 17, 28),
                          width: 1.2),
                    ),
                    child: const Center(
                      child: Text(
                        "Post Data",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(15, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 4, 17, 28),
                          width: 1.2),
                    ),
                    child: const Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(15, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 4, 17, 28),
                          width: 1.2),
                    ),
                    child: const Center(
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getListOfAllObject() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    http.Response response = await http.get(url);
    // log(response.body);
    List<dynamic> jsonData = json.decode(response.body);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DataPage(data: jsonData);
    }));
  }
}
