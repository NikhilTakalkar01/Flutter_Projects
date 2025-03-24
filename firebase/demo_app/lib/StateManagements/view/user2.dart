import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/StateManagements/view/user3.dart';
import 'package:flutter/material.dart';

class User2 extends StatefulWidget {
  const User2({super.key});

  @override
  State<User2> createState() => _User2State();
}

class _User2State extends State<User2> {
  List<dynamic> data = [];
  void fetchData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("InheritedWidget").get();
    // for(var doc in response.docs){
    //         data.add({...doc.data() as Map<String, dynamic>, 'docId': doc.id});
    // }

    for (int i = 0; i < response.docs.length; i++) {
      data = response.docs;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "Get From Firebase",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.blue[50],
                    child: ListTile(
                      title: Text("${data[index]['email']}"),
                      subtitle: Text('${data[index]['password']}'),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return User3();
          }));
        },
        child: Icon(
          Icons.navigate_next,
          size: 35,
        ),
      ),
    );
  }
}
