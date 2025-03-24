import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productColor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Data"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: productName,
                decoration: const InputDecoration(
                  labelText: "Enter Product Name",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: productPrice,
                decoration: const InputDecoration(
                  labelText: "Enter Product Price",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: productColor,
                decoration: const InputDecoration(
                  labelText: "Enter Product Color",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5,
                    bottom: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 45),
                      backgroundColor: Colors.blue[500]),
                  onPressed: () {
                    putData();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void putData() async {
    Uri url = Uri.parse("https://api.restful-api.dev/objects");
    Map<String, dynamic> data = {
      "id": "",
      'name': productName.text,
      "data": {'Price': productPrice.text, "Color": productColor.text}
    };
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json', // Specify the content type
      },
      body: jsonEncode(data),
    );
    log(response.body);

    productName.clear();
    productPrice.clear();
    productColor.clear();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product Data Posted Successfully"),
        ),
        snackBarAnimationStyle:
            AnimationStyle(duration: Duration(milliseconds: 30)));
  }
}
