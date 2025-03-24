import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ticket_booking/admin_movie_info.dart';

class AdminSide extends StatefulWidget {
  const AdminSide({super.key});

  @override
  State<AdminSide> createState() => _AdminSideState();
}

// class Movie {
//   final String Mtitle;
//   final String genre;
//   final String img;

//   Movie({required this.title, required this.genre, required this.img});
// }

class _AdminSideState extends State<AdminSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 15, right: 15),
        child: Column(
          children: [
            const Text(
              "Admin Dashboard",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: const Center(
                    child: Text(
                      "Now Playing",
                      style: TextStyle(
                          color: Color(0xff1C1C1C),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  child: const Center(
                    child: Text(
                      "Coming Soon",
                      style: TextStyle(
                          color: Color(0xff1C1C1C),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            // GridView.builder(
            //   padding: const EdgeInsets.all(8),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 12,
            //     mainAxisSpacing: 18,
            //     childAspectRatio: 0.60,
            //   ),
            //   itemCount: 2, // movies.length,
            //   itemBuilder: (context, index) {
            //     // final movie = movies[index];
            //     return GestureDetector(
            //       onLongPress: () {
            //         // Allow admin to delete movie
            //         // showDialog(
            //         //   context: context,
            //         //   builder: (context) => AlertDialog(
            //         //     title: Text("Delete Movie"),
            //         //     content: Text("Are you sure you want to delete this?"),
            //         //     actions: [
            //         //       TextButton(
            //         //         onPressed: () => Navigator.pop(context),
            //         //         child: Text("Cancel"),
            //         //       ),
            //         //       ElevatedButton(
            //         //         onPressed: () {
            //         //           // _deleteMovie(index);
            //         //           // Navigator.pop(context);
            //         //         },
            //         //         child: Text("Delete"),
            //         //       ),
            //         //     ],
            //         //   ),
            //         // );
            //       },
            //       child: Container(
            //         decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Container(
            //               // height: MediaQuery.of(context).size.height * 0.31,
            //               // width: MediaQuery.of(context).size.width,
            //               height: 230,
            //               width: MediaQuery.of(context).size.width,
            //               decoration: BoxDecoration(
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: Colors.white.withOpacity(0.1),
            //                     blurRadius: 4,
            //                     offset: const Offset(0, 2),
            //                   ),
            //                 ],
            //               ),
            //               child: Container(
            //                 child: Text("data"),
            //               ),
            //               // child: ClipRRect(
            //               //   borderRadius: const BorderRadius.vertical(
            //               //       top: Radius.circular(10)),
            //               //   // child: Image.asset(
            //               //   //   movie.img,
            //               //   //   fit: BoxFit.cover,
            //               //   //   // placeholderBuilder: (context) => Center(
            //               //   //   //     // child: CircularProgressIndicator(),
            //               //   //   //     ),
            //               //   // ),
            //               // ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text(
            //                 // movie.title,
            //                 "nikhil",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //                 maxLines: 2,
            //                 overflow: TextOverflow.ellipsis,
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //               child: Row(
            //                 children: [
            //                   Expanded(
            //                     child: Text(
            //                       // movie.genre,
            //                       "nikhil",
            //                       style: GoogleFonts.poppins(
            //                         color: Colors.white,
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),

            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 4, //dataList.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 16),
            //         child: Column(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(12),
            //                   color: Colors.white),
            //               width: MediaQuery.of(context).size.width * 1,
            //               height: MediaQuery.of(context).size.height * 0.2,
            //               child: Padding(
            //                 padding: const EdgeInsets.only(
            //                     left: 4, right: 4, bottom: 8),
            //                 child: Column(
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 14, right: 14, top: 25),
            //                           child: Container(
            //                             height: 59,
            //                             width: 59,
            //                             decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(50),
            //                               color: const Color.fromRGBO(
            //                                   255, 255, 255, 1),
            //                             ),
            //                             // child:
            //                             // Image.asset("assets/Group 42.png"),
            //                           ),
            //                         ),
            //                         Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             const SizedBox(
            //                               height: 8,
            //                             ),
            //                             SizedBox(
            //                               height: 29,
            //                               child: Text(
            //                                 // dataList[index].titleText,
            //                                 "Movie Name",
            //                                 style: GoogleFonts.quicksand(
            //                                   textStyle: const TextStyle(
            //                                     fontSize: 13,
            //                                     fontWeight: FontWeight.w700,
            //                                     color:
            //                                         Color.fromRGBO(0, 0, 0, 1),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ),
            //                             const SizedBox(
            //                               height: 20,
            //                               child: Text(
            //                                 // dataList[index].description,
            //                                 "nikhil",
            //                                 style:
            //                                     const TextStyle(fontSize: 11),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ],
            //                     ),
            //                     Padding(
            //                       padding:
            //                           const EdgeInsets.only(left: 6, top: 8),
            //                       child: Row(
            //                         children: [
            //                           Text(
            //                             //DateTime.now().toString().split(" ")[0],
            //                             // dataList[index].date,
            //                             "nikhil",
            //                             style: GoogleFonts.quicksand(
            //                                 textStyle:
            //                                     const TextStyle(fontSize: 13),
            //                                 fontWeight: FontWeight.w500),
            //                           ),
            //                           const Spacer(),
            //                           GestureDetector(
            //                             onTap: () {
            //                               // openBottonSheet(true, dataList[index]);
            //                             },
            //                             child: const Icon(
            //                               Icons.edit_outlined,
            //                               color: Color.fromRGBO(0, 139, 148, 1),
            //                               size: 20,
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             width: 8,
            //                           ),
            //                           GestureDetector(
            //                               onTap: () {
            //                                 setState(() {
            //                                   // dataList.removeAt(index);
            //                                 });
            //                               },
            //                               child: const Icon(
            //                                 Icons.delete_outline,
            //                                 color:
            //                                     Color.fromRGBO(0, 139, 148, 1),
            //                                 size: 20,
            //                               )),
            //                           const SizedBox(
            //                             width: 10,
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),

            SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 45,
                width: 180,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AddMovie();
                        },
                      ),
                    );
                  },
                  backgroundColor: const Color(0xffFCC434),
                  child: const Center(
                    child: Text(
                      "Add Movie",
                      style: TextStyle(
                          color: Color(0xff1C1C1C),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              child: Container(
                height: 45,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xffFCC434),
                ),
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color(0xffFCC434),
                  child: const Center(
                    child: Text(
                      "Remove Movie",
                      style: TextStyle(
                          color: Color(0xff1C1C1C),
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
