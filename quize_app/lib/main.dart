import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizeApp(),
    );
  }
}

class QuizeApp extends StatefulWidget {
  const QuizeApp({super.key});
  @override
  State createState() => _QuizeAppState();
}

class _QuizeAppState extends State {
  List<Map> allQuestion = [
    {
      "question": "Who is the founder of Microsoft",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Mask"],
      "corectAnswer": 1
    },
    {
      "question": "Who is the founder of Google",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Mask"],
      "corectAnswer": 2
    },
    {
      "question": "Who is the founder of SpaceX",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Mask"],
      "corectAnswer": 3
    },
    {
      "question": "Who is the founder of Apple",
      "option": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Mask"],
      "corectAnswer": 0
    },
    {
      "question": "Who is the founder of Meta",
      "option": ["Steve Jobs", "Bill Gates", "Mark Zuckerberg", "Elon Mask"],
      "corectAnswer": 2
    }
  ];
  int selectAnsIndex = -1;
  int currentQuestionIndex = 0;
  bool questionScreen = true;
  WidgetStateProperty<Color?> checkAnswer(int ansIndex) {
    if (selectAnsIndex != -1) {
      if (ansIndex == allQuestion[currentQuestionIndex]["corectAnswer"]) {
        return const WidgetStatePropertyAll(Color.fromARGB(255, 163, 248, 166));
      } else if (ansIndex == selectAnsIndex) {
        return const WidgetStatePropertyAll(Color.fromARGB(255, 237, 149, 142));
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  Widget getSign(int buttonNo) {
    if (allQuestion[currentQuestionIndex]["corectAnswer"] == buttonNo &&
        selectAnsIndex != -1) {
      return const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 35, 243, 42),
        radius: 15,
        child: Icon(
          Icons.check,
          size: 20,
        ),
      );
    } else if (buttonNo == selectAnsIndex) {
      return const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 15,
        child: Icon(
          Icons.close,
          size: 20,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  bool nextButtonPressed = false;

  bool questionPage = true;
  int score = 0;
  int currentPageScore = 0;

  @override
  Widget build(BuildContext context) {
    return homeScreen();
  }

  Scaffold homeScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quize_App",
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 25),
          ),
          backgroundColor: const Color.fromARGB(214, 96, 179, 247),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Question : ${currentQuestionIndex + 1} /${allQuestion.length}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Score: $score",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.green),
                ),
              ],
            ),

            const SizedBox(
              height: 45,
            ),

            // Question

            SizedBox(
              width: 330,
              height: 40,
              child: Text(
                allQuestion[currentQuestionIndex]["question"],
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Option 1

            SizedBox(
              height: 55,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                ),
                onPressed: () {
                  if (selectAnsIndex == -1) {
                    selectAnsIndex = 0;
                    setState(() {});
                    if (selectAnsIndex ==
                        allQuestion[currentQuestionIndex]["corectAnswer"]) {
                      score++;
                      setState(() {});
                    }
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "A. ${allQuestion[currentQuestionIndex]["option"][0]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    getSign(0)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Option 2

            SizedBox(
              height: 55,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(1)),
                onPressed: () {
                  if (selectAnsIndex == -1) {
                    selectAnsIndex = 1;
                    setState(() {});
                    if (selectAnsIndex ==
                        allQuestion[currentQuestionIndex]["corectAnswer"]) {
                      score++;
                      setState(() {});
                    }
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "B. ${allQuestion[currentQuestionIndex]["option"][1]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    getSign(1)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Option 3

            SizedBox(
              height: 55,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: checkAnswer(2)),
                onPressed: () {
                  if (selectAnsIndex == -1) {
                    selectAnsIndex = 2;
                    setState(() {});
                    if (selectAnsIndex ==
                        allQuestion[currentQuestionIndex]["corectAnswer"]) {
                      score++;
                      setState(() {});
                    }
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "C. ${allQuestion[currentQuestionIndex]["option"][2]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    getSign(2)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Option 4

            SizedBox(
              height: 55,
              width: 330,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                  shadowColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 247, 112, 112)),
                ),
                onPressed: () {
                  if (selectAnsIndex == -1) {
                    selectAnsIndex = 3;
                    setState(() {});
                    if (selectAnsIndex ==
                        allQuestion[currentQuestionIndex]["corectAnswer"]) {
                      score++;
                      setState(() {});
                    }
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "D. ${allQuestion[currentQuestionIndex]["option"][3]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    getSign(3)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 25,
            ),
            (nextButtonPressed && selectAnsIndex == -1)
                ? const Text(
                    "Please Select Answer",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                : const SizedBox()
          ],
        ),

        // Floating Action Button

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              nextButtonPressed = true;
            });
            if (selectAnsIndex != -1) {
              if (currentQuestionIndex < allQuestion.length - 1) {
                currentQuestionIndex++;
                nextButtonPressed = false;
                setState(() {});
              } else {
                questionPage = false;
              }
              selectAnsIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: const Color.fromARGB(255, 118, 188, 246),
          child: const Icon(
            Icons.forward,
            color: Color.fromARGB(183, 0, 0, 0),
          ),
        ),
      );
    }

    //Second Screen

    else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(182, 0, 0, 0),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(220, 33, 149, 243),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getTropy(score),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Congratulation",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (score <= 3) ? "Remark: Well Try" : " Remark: Very Good",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Score: $score ",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.green),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            questionPage = true;
            currentQuestionIndex = 0;
            score = 0;
            nextButtonPressed = false;
            setState(() {});
          },
          backgroundColor: const Color.fromARGB(255, 110, 184, 244),
          child: const Icon(
            Icons.restart_alt_sharp,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  Widget getTropy(int score) {
    if (score < 0) {
      return Image.network("");
    } else {
      return Image.network(
          "https://static.vecteezy.com/system/resources/thumbnails/019/013/598/small_2x/medal-awards-and-trophies-png.png",
          height: 280);
    }
  }
}
