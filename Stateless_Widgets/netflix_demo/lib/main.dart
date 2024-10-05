import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: (IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.white,
          )),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 27,
            ),
            Padding(padding: EdgeInsets.all(7.0))
          ],
          title: const Text(
            "NETFLIX",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.redAccent),
          ),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: ListView.builder(
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Action Movies",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(238, 244, 67, 54),
                      
                    ),
                    
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          child: Image.network(
                              "https://images.saymedia-content.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:eco%2Cw_1200/MTg3NzAzMzg2ODQ0NDQwNDYz/best-action-movies-netflix.jpg"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          child: Image.network(
                              "https://www.buzzsprout.com/rails/active_storage/representations/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCTVZ4cEFjPSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--d6a7dd24f5d00a8b5fd9a2705c848eede3aa044a/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9MWm05eWJXRjBPZ2hxY0djNkUzSmxjMmw2WlY5MGIxOW1hV3hzV3docEFsZ0NhUUpZQW5zR09nbGpjbTl3T2d0alpXNTBjbVU2Q25OaGRtVnlld1k2REhGMVlXeHBkSGxwUVRvUVkyOXNiM1Z5YzNCaFkyVkpJZ2x6Y21kaUJqb0dSVlE9IiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--1924d851274c06c8fa0acdfeffb43489fc4a7fcc/Thumbnail%20-%20Podcast.png"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 170,
                          width: 170,
                          child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn0U1Mg8Y8YPr757AmtFOlitqHpfaFyCf50A&s"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
