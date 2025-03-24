import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/nested_storage/fetch_data.dart';
import 'package:flutter/material.dart';

class NestedFirestoreStorage extends StatefulWidget {
  const NestedFirestoreStorage({super.key});

  @override
  State<NestedFirestoreStorage> createState() => _NestedFirestoreStorageState();
}

class _NestedFirestoreStorageState extends State<NestedFirestoreStorage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController clgController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  bool isOfline = true;

  List courseDetails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Nested Storage",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Name"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: clgController,
                decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Collage Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    const Text("Courses:"),
                    for (var course in courseDetails)
                      Text("{ ${course['name']},${course['type']} }"),
                  ],
                ),
              ),
              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(),
                    hintText: "Enter Course Name"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: isOfline
                            ? const WidgetStatePropertyAll(
                                Color.fromARGB(255, 213, 190, 240))
                            : const WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        isOfline = true;
                        setState(() {});
                      },
                      child: Text(
                        "Ofline",
                        style: TextStyle(
                            color: isOfline ? Colors.black : Colors.black),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: isOfline
                            ? const WidgetStatePropertyAll(Colors.white)
                            : const WidgetStatePropertyAll(
                                Color.fromARGB(255, 213, 190, 240)),
                      ),
                      onPressed: () {
                        isOfline = false;
                        setState(() {});
                      },
                      child: Text(
                        "Online",
                        style: TextStyle(
                            color: isOfline ? Colors.black : Colors.black),
                      )),
                  GestureDetector(
                    onTap: () {
                      if (courseController.text.isNotEmpty) {
                        final courseType = isOfline ? 'Ofline' : 'Online';
                        courseDetails.add({
                          'type': courseType,
                          'course': courseController.text,
                        });
                        courseController.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Type Course Name"),
                          ),
                        );
                      }
                      setState(() {});
                      // setState(() {});
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        // border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  if (nameController.text.isNotEmpty &&
                      clgController.text.isNotEmpty &&
                      courseDetails.isNotEmpty) {
                    Map<String, dynamic> data = {
                      'stdName': nameController.text,
                      'clgName': clgController.text,
                      'course': courseDetails
                    };
                    await FirebaseFirestore.instance
                        .collection("StudentData")
                        .add(data);

                    nameController.clear();
                    clgController.clear();
                    courseDetails = [];
                    setState(() {});
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please Fill Details")));
                  }
                },
                child: Container(
                  height: 45,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: const Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const FetchData();
                  }));
                },
                child: Container(
                  height: 45,
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Colors.black),
                      color: Colors.blue[700]),
                  child: const Center(
                    child: Text(
                      "Get Data",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
