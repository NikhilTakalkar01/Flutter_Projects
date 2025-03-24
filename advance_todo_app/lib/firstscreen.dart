import 'dart:async';
import './databaseConnection.dart';
// import 'package:advance_todo_app/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:intl/intl.dart";
import "modelclass.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

class FirstUI extends StatefulWidget {
  const FirstUI({super.key});

  @override
  State<FirstUI> createState() => _FirstUIState();
}

class _FirstUIState extends State<FirstUI> {
  //For dynamic time change

  String greeting = '';
  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(minutes: 1), (Timer t) {
      return _updateTime();
    });
  }

  void _updateTime() {
    final hour = DateTime.now().hour;
    setState(() {
      if (hour >= 5 && hour < 12) {
        greeting = 'Good Morning';
      } else if (hour >= 12 && hour < 18) {
        greeting = 'Good Afternoon';
      } else if (hour >= 18 && hour < 22) {
        greeting = 'Good Evening';
      } else {
        greeting = 'Good Night';
      }
    });
  }

  //image picker
  File? _image;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  bool mode = true;
//colors
  List<Color> colors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];
//showing calender
  Future<void> showCalender(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );

    String formatedDate = DateFormat.yMMMd().format(pickdate!);
    setState(() {
      dateController.text = formatedDate;
    });
  }

  //namecontrollers
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //bottomsheet
  
  void openBottonSheet(bool edit, [ModelClass? obj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.horizontal_rule_rounded,
              size: 40,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                // top: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  const Text(
                    "Create To-Do",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
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
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: titleController,
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
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: descriptionController,
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
                          style: TextStyle(
                            color: Color.fromRGBO(89, 57, 241, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextField(
                          controller: dateController,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(89, 57, 241, 1),
                                    width: 5,
                                  )),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    //calender
                                    showCalender(context);
                                  },
                                  icon: const Icon(Icons.date_range_rounded))),
                          onTap: () {
                            //calender
                            showCalender(context);
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: GestureDetector(
                            onTap: () {
                              //logic
                              if (edit == true) {
                                submit(true, context, obj);
                              } else {
                                submit(false, context);
                                _image = _image!;
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 340,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(89, 57, 241, 1),
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
        );
      },
    );
  }

  List<ModelClass> dataList = [];

  void inState() {
    super.initState();
    loadTodo();
  }

  Future loadTodo() async {
    final data = await getTodo();
    dataList = data.cast<ModelClass>();
    setState(() {});
  }

  Future addTodo() async {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      await insertTodo(titleController.text, descriptionController.text,
          dateController.text);
      loadTodo();
    }
  }

  //submit botton logic

  void submit(bool edit, BuildContext context, [ModelClass? obj]) {
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (edit) {
        // Edit Icon
        obj!.title = titleController.text;
        obj.description = descriptionController.text;
        obj.date = dateController.text;
        Navigator.of(context).pop();
        clearControllers();
      } else {
        // Submit Botton
        dataList.add(ModelClass(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text));
        Navigator.of(context).pop();
        clearControllers();
        addTodo();
      }
    }
    setState(() {});
  }

  //for clear name controllers
  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        greeting,
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            mode = !mode;
                            setState(() {});
                          },
                          icon: (mode)
                              ? const Icon(
                                  Icons.wb_sunny,
                                  color: Colors.yellow,
                                )
                              : const Icon(
                                  Icons.brightness_3,
                                  color: Colors.white,
                                )),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Text(
                    "Core2web",
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Expanded(
              child: Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: Text(
                        "CREATE TO-DO LIST",
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        // height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: (mode)
                              ? Colors.black
                              : const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        //margin: EdgeInsets.only(top: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: dataList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Slidable(
                                // controller: SlidableController(vsync),
                                closeOnScroll: true,
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  extentRatio: 0.25,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              titleController.text =
                                                  dataList[index].title;
                                              descriptionController.text =
                                                  dataList[index].description;
                                              dateController.text =
                                                  dataList[index].date;
                                              openBottonSheet(
                                                  true, dataList[index]);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    89, 57, 241, 1),
                                              ),
                                              child: const Icon(
                                                Icons.edit_outlined,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              dataList.remove(dataList[index]);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromRGBO(
                                                    89, 57, 241, 1),
                                              ),
                                              child: const Icon(
                                                Icons.delete_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                child: Card(
                                  // color: const Color.fromRGBO(255, 255, 255, 1),
                                  shadowColor: const Color.fromRGBO(0, 0, 0, 1),

                                  color: colors[index % 4],
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12,
                                        bottom: 11,
                                        left: 16,
                                        right: 35),
                                    child: Row(
                                      children: [
                                        Container(
                                            height: 55,
                                            width: 55,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/group.png")),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                _pickImage();
                                              },
                                              child: _image != null
                                                  ? Image.file(
                                                      _image!,
                                                      fit: BoxFit.cover,
                                                      repeat:
                                                          ImageRepeat.noRepeat,
                                                    )
                                                  : null,
                                            )),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dataList[index].title,
                                                style: GoogleFonts.quicksand(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                dataList[index].description,
                                                style: GoogleFonts.quicksand(
                                                  textStyle: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 0.7),
                                                ),
                                                maxLines: 2,
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              //Date
                                              Text(
                                                dataList[index].date,
                                                style: GoogleFonts.quicksand(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 0.7)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            openBottonSheet(false);
          },
          backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
          child: const Icon(
            Icons.add_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
