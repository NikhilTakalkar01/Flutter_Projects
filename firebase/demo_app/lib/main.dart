// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demo_app/Shop/homepage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyA7ZouvXDMjw-hRJBu0pB3MidnK1sY7XpM",
//       appId: "1015639183771",
//       messagingSenderId: "1:1015639183771:android:8419051c731279b145513e",
//       projectId: "demoapp-c32f7",
//       storageBucket: "demoapp-c32f7.firebasestorage.app",
//     ),
//   );

//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//       // NestedFirestoreStorage(),
//     );
//   }
// }

// class EmployeeScreen extends StatefulWidget {
//   const EmployeeScreen({super.key});

//   @override
//   State<EmployeeScreen> createState() => _EmployeeScreenState();
// }

// class _EmployeeScreenState extends State<EmployeeScreen> {
//   TextEditingController empNameController = TextEditingController();
//   TextEditingController empSalController = TextEditingController();
//   TextEditingController devTypeController = TextEditingController();

//   List<Map<String, dynamic>> employees = []; // To hold fetched employee data
//   int highSal = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Firebase Demo",
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         backgroundColor: Colors.blue[700],
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: empNameController,
//               decoration: const InputDecoration(
//                 fillColor: Colors.grey,
//                 hintText: "Enter Employee Name",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               controller: empSalController,
//               decoration: const InputDecoration(
//                 fillColor: Colors.grey,
//                 hintText: "Enter Employee Salary",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: const TextInputType.numberWithOptions(),
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               controller: devTypeController,
//               decoration: const InputDecoration(
//                 fillColor: Colors.grey,
//                 hintText: "Enter Employee DevType",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: () {
//                 Map<String, dynamic> data = {
//                   "empName": empNameController.text,
//                   "empSal": empSalController.text,
//                   "deType": devTypeController.text,
//                 };
//                 FirebaseFirestore.instance.collection("empData").add(data);
//                 log("Data Added");
//                 empNameController.clear();
//                 empSalController.clear();
//                 devTypeController.clear();
//               },
//               child: const Text("Add Data"),
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: () async {
//                 QuerySnapshot response = await FirebaseFirestore.instance
//                     .collection("empData")
//                     .orderBy("empSal", descending: true)
//                     .get();

//                 List<Map<String, dynamic>> fetchedData = response.docs
//                     .map((doc) =>
//                         doc.data() as Map<String, dynamic>) // Parse data
//                     .toList();

//                 setState(() {
//                   employees = fetchedData; // Update the employees list
//                 });
//                 log("Data Fetched");
//               },
//               child: const Text("Get Data"),
//             ),
//             const SizedBox(height: 15),
//             Expanded(
//               child: employees.isNotEmpty
//                   ? ListView.builder(
//                       itemCount: 1,
//                       itemBuilder: (context, index) {
//                         final employee = employees[index];
//                         return Card(
//                           elevation: 4,
//                           margin: const EdgeInsets.symmetric(
//                               vertical: 8, horizontal: 8),
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Name: ${employee['empName']}",
//                                   style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   "Salary:${employee['empSal']} Lacs",
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   "DevType: ${employee['deType']}",
//                                   style: const TextStyle(fontSize: 14),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   : const Center(
//                       child: Text(
//                         "No data available. Please add some employees!",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:demo_app/StateManagements/controller/user_info.dart';
import 'package:demo_app/StateManagements/view/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp( const MyApp());
// }

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA7ZouvXDMjw-hRJBu0pB3MidnK1sY7XpM",
      appId: "1015639183771",
      messagingSenderId: "1:1015639183771:android:8419051c731279b145513e",
      projectId: "demoapp-c32f7",
      storageBucket: "demoapp-c32f7.firebasestorage.app",
    ),);
  runApp(
    UserInf(
      email: "",
      password: "",
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // late String email;
  // late int password;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: User1(),
    );
  }
}
