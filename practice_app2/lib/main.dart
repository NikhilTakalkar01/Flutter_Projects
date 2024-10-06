import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int card1 = 0;
  int card2 = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: (IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios))),
          title: const Text(
            "My Cart",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.blue,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.height,
                color: const Color.fromARGB(171, 246, 235, 235),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/shoes.jpg",
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nike Shoes",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "With iconic style and legendary comfort, on repeat.",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "\$570.00",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (card1 != 0) {
                                                card1--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Container(
                                        height: 23,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromARGB(
                                                  255, 11, 71, 250),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$card1",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              card1++;
                                            });
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(247, 246, 235, 235),
                ),
                height: 140,
                width: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/shoes.jpg",
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(width: 17),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Nike Shoes",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w700),
                            ),
                            const Text(
                              "With iconic style and legendary comfort, on repeat.",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "\$570.00",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (card2 != 0) {
                                                card2--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Container(
                                        height: 23,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              strokeAlign:
                                                  BorderSide.strokeAlignOutside,
                                              color: const Color.fromARGB(
                                                  255, 11, 71, 250),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "$card2",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              card2++;
                                            });
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            const  Row(
                children: [
                  Expanded(child: Text("Subtotal:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))),
                  Text("\$800.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  
                ],
              ),
              const  Row(
                children: [
                  Expanded(child: Text("Delivery Fee:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600))),
                  Text("\$5.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600)),
                  
                ],
              ),
              const  Row(
                children: [
                  Expanded(child: Text("Discount:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)),
                  Text("40%",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  
                ],
              ),
             const SizedBox(height: 15,),
               SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(onPressed: (){}, 
              style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 25, 85, 234),)
              ,
              child: const Text("Checkout for ₹480.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),) 
              ),
            ), 
            const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
