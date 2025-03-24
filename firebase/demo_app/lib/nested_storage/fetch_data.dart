import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List<Map<String, dynamic>> Student = [];
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('StudentData').get();

    for (var doc in querySnapshot.docs) {
      Student.add({...doc.data() as Map<String, dynamic>, 'docId': doc.id});
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Fetch Data",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Student.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection('StudentData')
                        .doc(Student[index]['docId'])
                        .delete();
                    Student.removeAt(index);
                    setState(() {});
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("Name: ${Student[index]['stdName']}"),
                      subtitle: Text("Clg: ${Student[index]['clgName']}"),
                      trailing: Text("${Student[index]['course']}"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
