
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Shoes",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 147, 23, 243),
            ),
          ),
          actions: const [
            Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 147, 23, 243),
            ),
            Padding(
              padding: EdgeInsets.all(7),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 350,
              width: 450,
              //color: Colors.amber,
              child: Image.network(
                  "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",fit: BoxFit.cover,),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Nike Air Force 1* 07",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
           Row(
            children: [
             const SizedBox(width: 10,),
                 ElevatedButton(
                    onPressed: () {
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color?>(Color.fromARGB(255, 147, 23, 243)),padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right: 15,top: 1,bottom: 1,),),
                    ),
                    child: const Text("Shoes",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
                  ),
                  const SizedBox(width: 17,),
                   ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color?>(Color.fromARGB(255, 147, 23, 243)),padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right: 15,top: 1,bottom: 1,),),
                    ),
                    child: const Text("Footwear",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                //  const SizedBox(height: 15,),
            ],
           ),
          const  Row(
              children: [
                 SizedBox(width: 17,height: 140,),
                 SizedBox(
                  height: 120,
                  width: 370,
                child: Text("With iconic style and legendary comfort, the AF-1 was made to be worn on repeat. This iteration puts a fresh spin on the hoopsclassic with crisp leather, era- echoing '80s construction and reflective-design Swooth logos.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                ),
              ],
            ),

              Row(
              children: [
              const  SizedBox(
                  width: 17,
                  height: 10,
                ),
               const Text("Ouantity",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
               const SizedBox(width: 7,),
                GestureDetector(onTap: () {
                  if(count!=0){
                    count--;
                  }
                setState(() {
                  
                },);
                },
                child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 5,),
                Container(
                  height: 27,
                  width: 32,
                  //color: const Color.fromARGB(255, 246, 244, 240),
                  decoration:  BoxDecoration( border: Border.all(strokeAlign: BorderSide.strokeAlignCenter)),
                  alignment: Alignment.center,
                  child:  Text("$count",style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  
                ),
               // SizedBox(width: 10,),
                //const  SizedBox(width: 1,height:10 ), 
                GestureDetector(onTap: (){
                  setState(() {
                  count++;
                    
                  });
                },child: const Icon(Icons.add),)
              ],
            ),
          const  SizedBox(
              height: 30,
              width: 17,
            ),
            SizedBox(
              height: 43,
              width: 300,
              child: ElevatedButton(onPressed: (){}, 
              style: ElevatedButton.styleFrom(backgroundColor:const Color.fromARGB(255, 138, 28, 248),)
              ,
              child: const Text("PURCHASE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),) 
              ),
            ), 
          ],
          
        ),
      ),
    );
  }
}
