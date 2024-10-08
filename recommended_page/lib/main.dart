import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> name = ["Data Science", "Machine Learning", "Apache Spark"];
  List<Map> data = [
    {
      "CourceName":"Data Science",
      "Univercity":"Harved Univercity",
      "text":"Lorem ipsum dolor sit amet eget nunc dictum est nunc",
      "BText":["Data Science","Machine Learning"]
    },
    {
      "CourceName":"AI & ML",
      "Univercity":"Harved Univercity",
      "text":"Lorem ipsum dolor sit amet eget nunc dictum est nunc",
      "BText":["Machine Learning","Decision Tree"]
    },
    {
      "CourceName":"Big Data",
      "Univercity":"Harved Univercity",
      "text":"Lorem ipsum dolor sit amet eget nunc dictum est nunc",
      "BText":["Big Data","Apache Spark"]
    },
    {
      "CourceName":"Devops",
      "Univercity":"Harved Univercity",
      "text":"Lorem ipsum dolor sit amet eget nunc dictum est nunc",
      "BText":["Docker","Kubernetes"]
    }

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Recomended",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 91, 135, 1)),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color.fromRGBO(0, 91, 135, 1),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.black,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Start a new career",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 6,
                  left: 10,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(0, 91, 135, 1),
                        ),
                        child: Text(
                          name[0],
                          style: const TextStyle(
                              fontSize: 15, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 235, 239),
                        ),
                        child: Text(
                          name[1],
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(0, 91, 135, 1)),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 224, 235, 239),
                        ),
                        child: Text(
                          name[2],
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(0, 91, 135, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             const SizedBox(height: 10,),
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 6, right: 6, bottom: 5),
                              child: Column(
                                children: [
                                  Container(
                                    height: 160,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: const Color.fromARGB(104, 223, 227, 229),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 12, left: 15),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 130,
                                            width: 130,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              child: Image.asset(
                                                  "assets/page.jpg"),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                 Text(
                                                  data[index]["CourceName"],
                                                  style: const TextStyle(
                                                    fontSize: 23,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                    data[index]["Univercity"],),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  "Lorem ipsum dolor sit amet eget nunc dictum est nunc.",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:const EdgeInsets.only(top: 5,bottom: 2),
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 25,
                                                          width: 90,
                                                          decoration: BoxDecoration(
                                                              color: const Color.fromARGB(231,177,216,226),
                                                              borderRadius:BorderRadius.circular(5)),
                                                          padding:const EdgeInsets.only(top: 4),
                                                          child: Text(
                                                            data[index]["BText"][0],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                fontWeight:FontWeight.w500,
                                                                color: Color.fromRGBO(0,91,135,1),fontSize: 11),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 2,
                                                              left: 10),
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 25,
                                                          width: 90,
                                                          decoration: BoxDecoration(
                                                              color: const Color.fromARGB(231,177,216,226),
                                                              borderRadius:BorderRadius.circular(5)),
                                                          padding: const EdgeInsets.only(top: 4),
                                                          child: Text(
                                                           data[index]["BText"][1],
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: const TextStyle(
                                                                fontWeight:FontWeight.w500,
                                                                color: Color.fromRGBO(0,91,135,1),
                                                                fontSize: 11),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
