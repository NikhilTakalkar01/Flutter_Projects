import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  String img;
  // List<dynamic> details;
  Map details = {};
  DetailsPage({super.key, required this.img, required this.details});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.blue[100],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                    widget.img,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Text("Id : ${widget.data[index]["id"]}"),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.details['name'],
              // (widget.details['name'] == null ||
              //         widget.details['data']['color'] == null)
              //     ? "Not Available"
              //     : widget.details['data']['color'],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              (widget.details['data'] == null ||
                      widget.details['data']['color'] == null)
                  ? "Color: Not Available"
                  : "Color: ${widget.details['data']['color']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              (widget.details['data'] == null)
                  ? "Capacity: Not Available"
                  : (widget.details['data']['capacity'] == null)
                      ? "Capacity: ${widget.details['data']['Capacity']}"
                      : "Capacity: ${widget.details['data']['capacity']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              (widget.details['data'] == null)
                  ? "Price: Not Available"
                  : (widget.details['data']['price'] == null)
                      ? "Price: ${widget.details['data']['Price']}"
                      : "Price: ${widget.details['data']['price']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              (widget.details['data'] == null)
                  ? "Generation: Not Available"
                  : (widget.details['data']['generation'] == null)
                      ? "Generation: ${widget.details['data']['Generation']}"
                      : "Generation: ${widget.details['data']['generation']}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            // Text("Name : ${widget.data[index]["name"]}"),
          ],
        ),
      ),
    );
  }
}
