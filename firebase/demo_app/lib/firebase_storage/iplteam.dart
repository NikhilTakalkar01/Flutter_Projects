// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class IplData extends StatefulWidget {
//   const IplData({super.key});

//   @override
//   State<IplData> createState() => _IplDataState();
// }

// class _IplDataState extends State<IplData> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController jerNoController = TextEditingController();
//   TextEditingController teamController = TextEditingController();
//   File? pickedImage;

//   Future<void> pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         pickedImage = File(image.path);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('No image selected!')),
//       );
//     }
//   }

//   Future<void> addPlayer() async {
//     String name = nameController.text.trim();
//     String jerseyNo = jerNoController.text.trim();
//     String team = teamController.text.trim();

//     if (name.isEmpty ||
//         jerseyNo.isEmpty ||
//         team.isEmpty ||
//         pickedImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please fill all fields and select an image!')),
//       );
//       return;
//     }

//     try {
//       // Upload image to Firebase Storage
//       String imagePath = 'player_images/$team/$name.jpg';

//       UploadTask uploadTask =
//           FirebaseStorage.instance.ref(imagePath).putFile(pickedImage!);
//       TaskSnapshot snapshot = await uploadTask;
//       String imageUrl = await snapshot.ref.getDownloadURL();

//       // Save player details to Firestore
//       await FirebaseFirestore.instance.collection('players').add({
//         'name': name,
//         'jerseyNo': jerseyNo,
//         'team': team,
//         'imageUrl': imageUrl,
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Player added successfully!')),
//       );

//       // Clear fields and image
//       nameController.clear();
//       jerNoController.clear();
//       teamController.clear();
//       setState(() {
//         pickedImage = null;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error adding player: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "IPL Data",
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blue[700],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             children: [
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       GestureDetector(
//                         onLongPress: () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content: Text('Hold to change image.')),
//                           );
//                         },
//                         child: Container(
//                           height: 150,
//                           width: 150,
//                           clipBehavior: Clip.antiAlias,
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Color.fromARGB(97, 158, 158, 158)),
//                           child: pickedImage != null
//                               ? Image.file(
//                                   pickedImage!,
//                                   fit: BoxFit.cover,
//                                 )
//                               : const Icon(
//                                   Icons.sports_cricket,
//                                   size: 60,
//                                 ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: pickImage, // Call pickImage function
//                           child: Container(
//                             height: 40,
//                             width: 40,
//                             decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 4.0,
//                                   offset: Offset(0, 2),
//                                 ),
//                               ],
//                             ),
//                             child: const Center(
//                               child: Icon(
//                                 Icons.edit,
//                                 size: 22,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Enter Player Name",
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: jerNoController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Enter Jersey No",
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: teamController,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: "Enter Team Name",
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[700]),
//                     onPressed: () {
//                       addPlayer();
//                     },
//                     child: const Text(
//                       "Add Player",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue[700]),
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return const Teams();
//                           },
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "View Players",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Teams extends StatefulWidget {
//   const Teams({super.key});

//   @override
//   State<Teams> createState() => _TeamsState();
// }

// class _TeamsState extends State<Teams> {
//   List<String> teams = [
//     'Mumbai Indians',
//     'Chennai Super Kings',
//     'Sunrisers Hyderabad',
//     'Royal Challengers Bangalore',
//     'Kolkata Knight Riders',
//     'Rajasthan Royals',
//     'Delhi Capitals',
//     'Punjab Kings',
//     'Gujarat Titans',
//     'Lucknow Super Giants',
//   ];

//   // Mapping team names to image assets
//   final Map<String, String> teamImages = {
//     'Mumbai Indians': 'assets/mi.png',
//     'Chennai Super Kings': 'assets/csk.png',
//     'Sunrisers Hyderabad': 'assets/srh.png',
//     'Royal Challengers Bangalore': 'assets/rcb.png',
//     'Kolkata Knight Riders': 'assets/kkr.png',
//     'Rajasthan Royals': 'assets/rr.png',
//     'Delhi Capitals': 'assets/delhi.jpg',
//     'Punjab Kings': 'assets/punjab.png',
//     'Gujarat Titans': 'assets/gt.png',
//     'Lucknow Super Giants': 'assets/lacknow.jpg',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blue[700],
//         title: const Text(
//           "IPL Teams",
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: teams.length,
//               itemBuilder: (context, index) {
//                 String teamName = teams[index];
//                 return Card(
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   elevation: 4,
//                   child: ListTile(
//                     leading: CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Colors.grey[200],
//                       backgroundImage: AssetImage(
//                         teamImages[teamName] ?? 'assets/placeholder.png',
//                       ),
//                     ),
//                     title: Text(
//                       teamName,
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IplData extends StatefulWidget {
  const IplData({super.key});

  @override
  State<IplData> createState() => _IplDataState();
}

class _IplDataState extends State<IplData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jerNoController = TextEditingController();
  String? selectedTeam;
  File? pickedImage;

  final List<String> teams = [
    'Mumbai Indians',
    'Chennai Super Kings',
    'Sunrisers Hyderabad',
    'Royal Challengers Bangalore',
    'Kolkata Knight Riders',
    'Rajasthan Royals',
    'Delhi Capitals',
    'Punjab Kings',
    'Gujarat Titans',
    'Lucknow Super Giants',
  ];

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected!')),
      );
    }
  }

  Future<void> addPlayer() async {
    String name = nameController.text.trim();
    String jerseyNo = jerNoController.text.trim();

    if (name.isEmpty ||
        jerseyNo.isEmpty ||
        selectedTeam == null ||
        pickedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and select an image!')),
      );
      return;
    }

    try {
      // Upload image to Firebase Storage
      String imagePath = 'player_images/$selectedTeam/$name.jpg';

      UploadTask uploadTask =
          FirebaseStorage.instance.ref(imagePath).putFile(pickedImage!);
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();

      // Save player details to Firestore
      await FirebaseFirestore.instance.collection('players').add({
        'name': name,
        'jerseyNo': jerseyNo,
        'team': selectedTeam,
        'imageUrl': imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Player added successfully!')),
      );

      // Clear fields and image
      nameController.clear();
      jerNoController.clear();

      setState(() {
        pickedImage = null;
        selectedTeam = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding player: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IPL Data",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Hold to change image.')),
                          );
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(97, 158, 158, 158)),
                          child: pickedImage != null
                              ? Image.file(
                                  pickedImage!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.sports_cricket,
                                  size: 60,
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: pickImage, // Call pickImage function
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.edit,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Player Name",
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: jerNoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Jersey No",
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedTeam,
                items: teams.map((team) {
                  return DropdownMenuItem(
                    value: team,
                    child: Text(team),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTeam = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Select Team",
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700]),
                    onPressed: () {
                      addPlayer();
                    },
                    child: const Text(
                      "Add Player",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700]),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const Teams();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "View Players",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final List<String> teams = [
    'Mumbai Indians',
    'Chennai Super Kings',
    'Sunrisers Hyderabad',
    'Royal Challengers Bangalore',
    'Kolkata Knight Riders',
    'Rajasthan Royals',
    'Delhi Capitals',
    'Punjab Kings',
    'Gujarat Titans',
    'Lucknow Super Giants',
  ];

  final Map<String, String> teamImages = {
    'Mumbai Indians': 'assets/mi.png',
    'Chennai Super Kings': 'assets/csk.png',
    'Sunrisers Hyderabad': 'assets/srh.png',
    'Royal Challengers Bangalore': 'assets/rcb.png',
    'Kolkata Knight Riders': 'assets/kkr.png',
    'Rajasthan Royals': 'assets/rr.png',
    'Delhi Capitals': 'assets/delhi.jpg',
    'Punjab Kings': 'assets/punjab.png',
    'Gujarat Titans': 'assets/gt.png',
    'Lucknow Super Giants': 'assets/lacknow.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        title: const Text(
          "IPL Teams",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, index) {
          String teamName = teams[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage(
                  teamImages[teamName] ?? 'assets/placeholder.png',
                ),
              ),
              title: Text(
                teamName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeamPlayersScreen(teamName: teamName),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TeamPlayersScreen extends StatelessWidget {
  final String teamName;

  const TeamPlayersScreen({super.key, required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        title: Text(
          "$teamName Players",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('players')
            .where('team', isEqualTo: teamName)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No players found for this team.'));
          }

          List<QueryDocumentSnapshot> players = snapshot.data!.docs;

          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              var player = players[index];
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                            child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(player['imageUrl']),
                          ),
                        )),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Name: ${player['name']}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(15),
                            Text(
                              "Jersey No: ${player['jerseyNo']}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(player['imageUrl']),
                    ),
                    title: Text(
                      player['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Jersey No: ${player['jerseyNo']}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
