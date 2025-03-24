import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> categories = ["All", "Men", "Women", "Kids", "Other"];
  String selectedCategory = "All";
  List<Map<String, dynamic>> cardInfo = [
    {"image": "assets/h1.png", "price": "\$240.32", "name": "Tangerine Shirt"},
    {"image": "assets/h2.png", "price": "\$325.36", "name": "Leather Coat"},
    {"image": "assets/h4.png", "price": "\$257.85", "name": "Tangerine Shirt"},
    {"image": "assets/h3.png", "price": "\$126.47", "name": "Leather Coat"},
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/Menu.svg",
                    height: 32,
                    width: 32,
                  ),
                  SvgPicture.asset(
                    "assets/Profile.svg",
                    height: 32,
                    width: 32,
                  ).paddingOnly(right: 0)
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Explore",
                style: GoogleFonts.imprima(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(13, 13, 14, 1)),
              ),
              Text(
                "Best trendy collection",
                style: GoogleFonts.imprima(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(121, 119, 128, 1)),
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    final isSelected = category == selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.orange : Colors.transparent,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Text(
                          category,
                          style: GoogleFonts.imprima(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: isSelected
                                ? Colors.white
                                : const Color.fromRGBO(13, 13, 14, 1),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 5),
              // Updated to use data from the List of Map
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cardInfo.length, // Use the actual data length
                  itemBuilder: (context, index) {
                    final item = cardInfo[index]; // Fetch data for each card
                    return Tile(
                      image: item['image'],
                      price: item['price'],
                      name: item['name'],
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ).paddingOnly(left: 25, top: 15, right: 20),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/Home.svg",
                height: 30,
                width: 30,
                color: Colors.black,
              ),
              activeIcon: SvgPicture.asset(
                "assets/Home.svg",
                height: 30,
                width: 30,
                color: Colors.orange,
              ),
              // activeIcon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/Search.svg",
                height: 30,
                width: 30,
              ),
              activeIcon: SvgPicture.asset(
                "assets/Search.svg",
                height: 30,
                width: 30,
                color: Colors.orange,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_bag_outlined),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.shopping_bag),
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  // final List<Map<String, String>> items = [
  //   {
  //     "image": "assets/images/item1.png",
  //     "title": "Tangerine Shirt",
  //     "price": "\$240.32"
  //   },
  //   {
  //     "image": "assets/images/item2.png",
  //     "title": "Leather Coat",
  //     "price": "\$325.36"
  //   },
  //   {
  //     "image": "assets/images/item3.png",
  //     "title": "Tangerine Shirt",
  //     "price": "\$126.47"
  //   },
  //   {
  //     "image": "assets/images/item4.png",
  //     "title": "Leather Coat",
  //     "price": "\$257.85"
  //   },
  // ];
}

class Tile extends StatelessWidget {
  final String image;
  final String price;
  final String name;
  final int index;

  const Tile({
    super.key,
    required this.image,
    required this.price,
    required this.name,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: index.isEven ? 285 : 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // color: Colors.amber,
            height: index.isEven ? 220 : 177,
            child: Stack(
              children: [
                // Background Image
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    height: index.isEven ? 212 : 169,
                    fit: BoxFit.cover, // Ensures the image fits nicely
                  ),
                ),
                // Positioned Icon
                Positioned(
                  bottom: -6,
                  right: 15,
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      width: 37,
                      height: 37,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/bag.svg",
                              // color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  price,
                  style: GoogleFonts.imprima(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(13, 13, 14, 1),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  name,
                  style: GoogleFonts.imprima(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(121, 119, 128, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
