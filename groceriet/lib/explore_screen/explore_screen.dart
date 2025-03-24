import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/beverages.dart/beverages_screen.dart';
import 'package:groceriet/constants/app_constant.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Map<String, String>> categories = [
    {'name': 'Fresh Fruits & Vegetable', 'icon': 'assets/ex1.png'},
    {'name': 'Cooking Oil & Ghee', 'icon': 'assets/ex2.png'},
    {'name': 'Meat & Fish', 'icon': 'assets/ex3.png'},
    {'name': 'Bakery & Snacks', 'icon': 'assets/ex4.png'},
    {'name': 'Dairy & Eggs', 'icon': 'assets/ex5.png'},
    {'name': 'Beverages', 'icon': 'assets/ex6.png'},
    {'name': 'Fresh Fruits & Vegetable', 'icon': 'assets/ex1.png'},
    {'name': 'Cooking Oil & Ghee', 'icon': 'assets/ex2.png'},
  ];

  List<Map<String, Color>> categoryColors = [
    {'categoryColor1': Color.fromRGBO(83, 177, 117, 0.1)},
    {'categoryColor2': Color.fromRGBO(248, 164, 76, 0.1)},
    {'categoryColor3': Color.fromRGBO(247, 165, 147, 0.25)},
    {'categoryColor4': Color.fromRGBO(211, 176, 224, 0.25)},
    {'categoryColor5': Color.fromRGBO(253, 229, 152, 0.25)},
    {'categoryColor6': Color.fromRGBO(183, 223, 245, 0.25)},
    {'categoryColor1': Color.fromRGBO(131, 106, 246, 0.15)},
    {'categoryBorder2': Color.fromRGBO(215, 59, 119, 0.15)},
  ];

  List<Map<String, Color>> categoryBorders = [
    {'categoryBorder1': Color.fromRGBO(83, 177, 117, 1)},
    {'categoryBorder2': Color.fromRGBO(248, 164, 76, 1)},
    {'categoryBorder3': Color.fromRGBO(247, 165, 147, 1)},
    {'categoryBorder4': Color.fromRGBO(211, 176, 224, 1)},
    {'categoryBorder5': Color.fromRGBO(253, 229, 152, 1)},
    {'categoryBorder6': Color.fromRGBO(183, 223, 245, 1)},
    {'categoryBorder1': Color.fromRGBO(131, 106, 246, 0.5)},
    {'categoryColor2': Color.fromRGBO(215, 59, 119, 0.5)},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Center(
                child: Text(
                  "Find Products",
                  style: GoogleFonts.dmSans(
                    color: const Color.fromRGBO(24, 23, 37, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppConstant.searchBarColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    borderSide: BorderSide.none, // Remove border line
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    borderSide: BorderSide(
                      color: AppConstant
                          .primaryColor, // Optional: Add a color when focused
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    size: 28,
                  ),
                  hintText: "Search Store",
                  hintStyle: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color.fromRGBO(124, 124, 124, 1),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              SizedBox(
                // height:
                //     screenHeight * 0.6, // Set a fixed height for the GridView
                child: GridView.builder(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),
                  // physics:
                  //     const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    childAspectRatio: (screenWidth * 0.40) /
                        (screenHeight * 0.20), // Adjust aspect ratio
                    crossAxisSpacing: 15, // Spacing between columns
                    mainAxisSpacing: 15, // Spacing between rows
                  ),
                  itemCount: 8, // Total number of items
                  itemBuilder: (context, index) {
                    String categoryName = categories[index]['name']!;
                    String categoryIcon = categories[index]['icon']!;
                    Color categoryColor = categoryColors[index].values.first;
                    Color categoryBorderColor =
                        categoryBorders[index].values.first;

                    return buildCategoryItem(
                      categoryName,
                      categoryIcon,
                      () {
                        if (index == 5) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return BeveragesScreen();
                          }));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green[400],
                              content: Text(
                                "Coming Soon!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              duration: Duration(
                                  seconds: 2), // Duration of the SnackBar
                            ),
                          );
                        }
                        // Define onTap action here
                        print("Tapped on $categoryName");
                      },
                      categoryColor,
                      categoryBorderColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryItem(String name, String icon, VoidCallback onTap,
      Color categoryColor, Color categoryBorderColor) {
    return GestureDetector(
      onTap: onTap, // Handle the onTap action
      child: Container(
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(color: categoryBorderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.0),
              spreadRadius: 0,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(24, 23, 37, 1),
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
