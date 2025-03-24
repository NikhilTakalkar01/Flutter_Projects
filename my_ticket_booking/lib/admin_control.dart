import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminControl extends StatefulWidget {
  const AdminControl({super.key});

  @override
 State<AdminControl> createState() => _AdminControlState();
}

class _AdminControlState extends State<AdminControl> {
  List<Movie> movies = []; // List of movies (admin manages this)

  // Method to add a new movie
  void _addMovie() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String genre = '';
        String img = '';
        return AlertDialog(
          title: Text("Add New Movie"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Genre"),
                onChanged: (value) {
                  genre = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "SVG Image Path"),
                onChanged: (value) {
                  img = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty && genre.isNotEmpty && img.isNotEmpty) {
                  setState(() {
                    movies.add(Movie(title: title, genre: genre, img: img));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Method to delete a movie
  void _deleteMovie(int index) {
    setState(() {
      movies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addMovie,
          ),
        ],
      ),
      body: movies.isEmpty
          ? Center(
              child: Text(
                "No movies added yet!",
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 18,
                childAspectRatio: 0.60,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onLongPress: () {
                    // Allow admin to delete movie
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Delete Movie"),
                        content: Text("Are you sure you want to delete this?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _deleteMovie(index);
                              Navigator.pop(context);
                            },
                            child: Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.31,
                          // width: MediaQuery.of(context).size.width,
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.asset(
                              movie.img,
                              fit: BoxFit.cover,
                              // placeholderBuilder: (context) => Center(
                              //     // child: CircularProgressIndicator(),
                              //     ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  movie.genre,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Movie Model
class Movie {
  final String title;
  final String genre;
  final String img;

  Movie({required this.title, required this.genre, required this.img});
}