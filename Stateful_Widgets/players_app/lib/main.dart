import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override  
  State createState()=> _MyAppState();
}

class _MyAppState extends State{
  int count = 0;
  List playerList = ["https://pngfre.com/wp-content/uploads/1000072450.png",
  "https://images.mykhel.com/ph-big/2024/07/rohit-sharma-beams-with-joy-as-he-holds-t20-world-cup-after-india-thrilling-win-against-sa-17198090737.jpg",
  "https://www.nicepng.com/png/detail/259-2595882_mahendra-singh-dhoni-png-image-ms-dhoni-png.png",
  "https://cf-cdn.newsbytesapp.com/sports/players/profile/yuvraj-singh.png"];
  List playerName = ["Virat Kohli","Rohit Sharma","MS_Dhoni","Yuvraj Singh"];
  void next () {
    if(count<playerList.length-1) {
       count++;
     }
      else{
      count = 0;
    }
  }
  void previous () {
    if(count>0){
      count--;
    }
    else{
      count = playerList.length-1;
    }
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Cricket_Player"),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true,
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Image.network(playerList[count],
            height: 300,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(height: 30,width: 240,
              color: Colors.white,
             child: Text(playerName[count],style: const TextStyle(fontSize: 25,fontWeight:FontWeight.bold), textAlign: TextAlign.center,),
              ),
            ],
            ),
          ],
          ),
        ),
        
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
           const SizedBox(width: 40,) ,
             FloatingActionButton(
              onPressed:(){
                previous();
                setState(() {});
              },
              backgroundColor: Colors.lightGreenAccent,
              child: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const Spacer(),
              FloatingActionButton(
              onPressed:(){
               next();
                setState(() {});
              },
              backgroundColor: Colors.lightGreenAccent,
              child: const Icon(Icons.arrow_forward_ios_rounded),
              ),
             const SizedBox(height: 10,),
           
          ],
        ),
          
        ),
    );
  }
}