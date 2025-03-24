import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final TextEditingController movieController = TextEditingController();
  final TextEditingController moviedescController = TextEditingController();
  final TextEditingController moviegenreController = TextEditingController();
  final TextEditingController movieCensorshipController =
      TextEditingController();
  final TextEditingController movieLanguageController = TextEditingController();
  final TextEditingController movieRatingController = TextEditingController();
  final TextEditingController movieTimeController = TextEditingController();
  final TextEditingController moviePriceController = TextEditingController();

  List<String> movies = [];

  //image picker
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';

  File? _image;
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);
    }
    setState(() {});
  }

  Widget _customTextfield(
      {String? fieldName, TextEditingController? tcontroller}) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff1C1C1C),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: tcontroller,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
        decoration: InputDecoration(
            labelText: fieldName,
            labelStyle: GoogleFonts.poppins(
                color: const Color.fromARGB(192, 255, 255, 255)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              repeat: ImageRepeat.noRepeat,
                            )
                          : const Icon(
                              Icons.movie,
                              color: Colors.white,
                              size: 250,
                            )
                      ),
                  GestureDetector(
                    onTap: () {
                      _pickImage();
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Movie Name",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                fieldName: "Enter MovieName",
                tcontroller: movieController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Movie Description",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                fieldName: "Enter Description",
                tcontroller: moviedescController,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Genre",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Enter genre", tcontroller: moviegenreController),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Censorship",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Movie Censorship",
                  tcontroller: movieCensorshipController),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Language",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Enter Movie Language",
                  tcontroller: movieLanguageController),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Rating",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Enter Rating",
                  tcontroller: movieRatingController),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Movie time",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Enter MovieTame",
                  tcontroller: movieTimeController),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Price",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffFCC434)),
              ),
              _customTextfield(
                  fieldName: "Price", tcontroller: moviePriceController),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
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
                  
                    Navigator.of(context).pop();
                  },
                  backgroundColor: const Color(0xffFCC434),
                  child: const Center(
                    child: Text(
                      "Done",
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
                      "Cancel",
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
