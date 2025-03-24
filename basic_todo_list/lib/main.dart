//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter Demo",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ModelClass {
  String titleText;
  String description;
  String date;
  ModelClass(
      {required this.titleText, required this.description, required this.date});
}

class _MyHomePageState extends State<MyHomePage> {
  void openBottonSheet(bool toDoEdit, [ModelClass? modelClassObj]) {
    if (toDoEdit) {
      nameController1.text = modelClassObj!
          .titleText; 
      nameController2.text = modelClassObj.description;
      nameController3.text = modelClassObj.date;
    } else {
      nameController1.clear();
      nameController2.clear();
      nameController3.clear();
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  const Text(
                    "Create To-Do",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 139, 140, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: nameController1,
                          onTap: () {},
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 139, 140, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: nameController2,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Date",
                          style:
                              TextStyle(color: Color.fromRGBO(0, 139, 140, 1)),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: nameController3,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    showCalender();
                                  },
                                  icon: const Icon(Icons.date_range_rounded))),
                          onTap: () {
                            //calender
                            showCalender();
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: GestureDetector(
                            onTap: () {
                              //logic
                              (toDoEdit)
                                  ? addTask(toDoEdit, modelClassObj)
                                  : addTask(toDoEdit);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 340,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(0, 139, 148, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Submit",
                                style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );  // column
      },
    );
  }

  void addTask(bool toDoEdit, [ModelClass? toDOobj]) {
    String title = nameController1.text.trim();
    String description = nameController2.text.trim();
    String date = nameController3.text.trim();

    if (title.isNotEmpty && description.isNotEmpty && date.isNotEmpty) {
      (!toDoEdit)
          ? dataList.add(
              ModelClass(
                titleText: title,
                description: description,
                date: date,
              ),
            )
          : {
              toDOobj!.titleText = title,
              toDOobj.description = description,
              toDOobj.date = date
            };
      nameController1.clear();
      nameController2.clear();
      nameController3.clear();
      Navigator.pop(context);
      setState(() {});
    }
  }

  Future<void> showCalender() async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );

    String formatedDate = DateFormat.yMMMd().format(pickdate!);
    setState(() {
      nameController3.text = formatedDate;
    });
  }

  //Colors
  List<Color> colors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  //text/description
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();

  List<ModelClass> dataList = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.933),
      appBar: AppBar(
        title: Text(
          "To-do list",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14, top: 3),
            child: Icon(
              Icons.search,
              color: Color.fromRGBO(255, 255, 255, 1),
              size: 27,
            ),
          )
        ],
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 22, left: 14, right: 14, bottom: 10),
        child: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colors[index % 4],
                    ),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 4, right: 4, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 25),
                                child: Container(
                                  height: 59,
                                  width: 59,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Image.asset("assets/Group 42.png"),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 29,
                                      child: Text(
                                        dataList[index].titleText,
                                        style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 55,
                                      child: Text(
                                        dataList[index].description,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6, top: 8),
                            child: Row(
                              children: [
                                Text(
                                  //DateTime.now().toString().split(" ")[0],
                                  dataList[index].date,
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(fontSize: 13),
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    openBottonSheet(true, dataList[index]);
                                  },
                                  child: const Icon(
                                    Icons.edit_outlined,
                                    color: Color.fromRGBO(0, 139, 148, 1),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        dataList.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete_outline,
                                      color: Color.fromRGBO(0, 139, 148, 1),
                                      size: 20,
                                    )),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottonSheet(false);
        },
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 27,
          color: Colors.black,
        ),
      ),
    );
  }
}
