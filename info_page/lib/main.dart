import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  String? myName;
  String? company;
  List<Map> playerList = [];

  void _removeCard() {
    setState(() {
      playerList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Infomation_Page",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 300,
                  width: 400,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: nameController,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          hintText: "Name:",
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: nameController2,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                          hintText: "Dream Company:",
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              myName = nameController.text.trim();
                              company = nameController2.text.trim();
                              if (myName != "" && company != "") {
                                playerList
                                    .add({"name": myName, "Company": company});
                              }
                              nameController.clear();
                              nameController2.clear();
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 50),
                                backgroundColor: Colors.blue),
                            child: const Text(
                              "Submit",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _removeCard();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                minimumSize: const Size(150, 50)),
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: playerList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 14,
                      color: Colors.blue[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${playerList[index]["name"]}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Company_Name:  ${playerList[index]["Company"]}",
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                  padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                ),
              ),
            ],
          ),
        ),
       

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => showModalBottomSheet(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return Container(
        //         padding: EdgeInsets.all(16.0),
        //         height: 200,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             Text(
        //               'This is a modal bottom sheet',
        //               style: TextStyle(
        //                   fontSize: 24.0, fontWeight: FontWeight.bold),
        //             ),
        //             SizedBox(height: 20),
        //             Text('You can add any content here.'),
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.amber,
        // ),
      ),
    );
  }
}
