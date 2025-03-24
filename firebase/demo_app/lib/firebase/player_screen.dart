import 'package:flutter/material.dart';
import 'package:demo_app/firebase/player_model.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key,required String email});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  TextEditingController playerNameTextController = TextEditingController();
  TextEditingController jerseyNoTextController = TextEditingController();

  List<PlayerModel> playerlist = [];

  // bool _isLoading = false;

  // void initState() {
  //   super.initState();

  //   Future.delayed(Duration(seconds: 3), () {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          "FireBase",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.black,
              size: 40,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: playerNameTextController,
                  decoration: const InputDecoration(
                      labelText: "Enter Name", border: OutlineInputBorder()),
                ),
              ),
            ),

            // const SizedBox(
            //   height: 20,
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: jerseyNoTextController,
                  decoration: const InputDecoration(
                      labelText: "Enter Jersey No",
                      border: OutlineInputBorder()),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // _isLoading = true;
                if (playerNameTextController.text.trim().isNotEmpty &&
                    jerseyNoTextController.text.trim().isNotEmpty) {
                  Map<String, dynamic> data = {
                    "playerName": playerNameTextController.text.trim(),
                    "jerNo": jerseyNoTextController.text.trim(),
                  };
                  FirebaseFirestore.instance
                      .collection("firebasedemo")
                      .add(data);

                  playerNameTextController.clear();
                  jerseyNoTextController.clear();

                  // initState();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Data Added Successful"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid Data"),
                    ),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                child: const Center(
                  child: Text(
                    "Add Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () async {
                QuerySnapshot response = await FirebaseFirestore.instance
                    .collection("firebasedemo")
                    .get();
                for (var value in response.docs) {
                  log("${value['playerName']}");

                  playerlist.add(
                    PlayerModel(
                      playerName: value['playerName'],
                      playerId: value.id,
                      jerNo: value['jerNo'],
                    ),
                  );
                }
                print("Lenth Of Player List : ${playerlist.length}");
                //Another way for accessing the data
                //for(var value in response.docs){
                //  print("${value['playerName']}")
                //}
                setState(() {});
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue)),
                child: const Center(
                  child: Text(
                    "Get Data",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: playerlist.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection('firebasedemo')
                          .doc(playerlist[index].playerId)
                          .delete();
                      playerlist.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data Deleted"),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[600],
                      ),
                      // elevation: 5,
                      margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Player Name:${playerlist[index].playerName}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Jersey Number: ${playerlist[index].jerNo}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
