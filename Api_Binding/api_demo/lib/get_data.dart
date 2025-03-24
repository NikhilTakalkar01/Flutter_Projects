import 'package:api_demo/details_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DataPage extends StatefulWidget {
  List<dynamic> data = [];
  List images = [
    "assets/google-pixel-6-pro.jpg",
    "assets/Apple iPhone 12 Mini, 256GB, Blue.jpg",
    "assets/Apple iPhone 12 Pro Max.jpg",
    "assets/Apple iPhone 11, 64GB.jpg",
    "assets/Samsung Galaxy Z Fold2.jpg",
    "assets/Apple AirPods.jpg",
    "assets/Apple MacBook Pro 16.jpg",
    "assets/Apple Watch Series 8.jpg",
    "assets/Beats Studio3 Wireless.jpg",
    "assets/Apple iPad Mini 5th Gen01.jpg",
    "assets/Apple iPad Mini 5th Gen.jpg",
    "assets/Apple iPad Air.jpg",
    "assets/Apple iPad Air2.jpg",
  ];
  DataPage({super.key, required this.data});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Data Screen"),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // List<dynamic> details = widget.data ;
                    String img = widget.images[index];
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsPage(img: img,details:widget.data[index]);
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          "${widget.images[index]}",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                // Text("Id : ${widget.data[index]["id"]}"),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.data[index]["name"],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),

                // Text("Name : ${widget.data[index]["name"]}"),
              ],
            ),
          );
        },
        itemCount: widget.images.length, // widget.data.length,
      ),
    );
  }
}
