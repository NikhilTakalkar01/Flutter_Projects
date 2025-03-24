import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/constants/app_constant.dart';
import 'package:groceriet/database_connection/database.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatefulWidget {
  String? img; // img should be a single image, not a list
  String? productName;
  String? price;
  String? weight;

  ProductDetailsScreen(
      {super.key, this.img, this.price, this.productName, this.weight});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _currentIndex = 0;
  int index = 1;
  bool islike = false;

  late List<String> images = [];

  double price = 60.00;
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _favouriteProducts();

    // Ensure images is a list and assign the img from the widget.
    if (widget.img != null) {
      // If img is not null, use it as the first image in the list
      images = [widget.img!, widget.img!, widget.img!];
    } else {
      // If img is null, use a default set of images
      images = ['assets/apple2.png', 'assets/apple2.png', 'assets/apple2.png'];
    }
  }

  Future<void> _favouriteProducts() async {
    final data = await _dbHelper.getFavorites();
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: const Color.fromRGBO(242, 243, 242, 1),
            ),
            height: MediaQuery.of(context).size.height * 0.43,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left,
                          size: 30,
                        ),
                      ),
                      const Icon(
                        Icons.file_upload_outlined,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CarouselSlider(
                    items: images.map((image) {
                      return Image.asset(
                        image,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: images.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.green, // Active dot color
                      dotColor: Colors.grey, // Inactive dot color
                      dotHeight: 7,
                      dotWidth: 7,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.productName!,
                      style: GoogleFonts.dmSans(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(24, 23, 37, 1),
                      ),
                    ),
                    const Spacer(),
                    (islike)
                        ? GestureDetector(
                            onTap: () async {
                              await _dbHelper
                                  .removeFavorite(widget.productName!);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Product remove from favourite!',
                                    style:
                                        GoogleFonts.dmSans(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red[400],
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              setState(() {
                                islike = false;
                              });
                            },
                            child: const Icon(
                              Icons.favorite,
                              size: 26,
                              color: Colors.red,
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              Map<String, dynamic> product = {
                                'productName': widget.productName,
                                'productWeight': widget.weight,
                                'price': price,
                                'image': widget.img,
                              };
                              await _dbHelper.addFavorite(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Product added to favourite!',
                                    style:
                                        GoogleFonts.dmSans(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              setState(() {
                                islike = true;
                              });
                            },
                            child: SvgPicture.asset("assets/like.svg"))
                  ],
                ),
                Text(
                  "1kg, Price",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color.fromRGBO(124, 124, 124, 1),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (index > 1) {
                          setState(() {
                            index--;
                            price = price - 60.00;
                          });
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 28,
                        color: const Color.fromRGBO(179, 179, 179, 1),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: const Color.fromRGBO(226, 226, 226, 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "$index",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index++;
                          price = price + 60.00;
                        });
                      },
                      child: Icon(
                        Icons.add,
                        size: 28,
                        color: const Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "₹$price",
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: const Color.fromRGBO(24, 23, 37, 1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Color.fromRGBO(226, 226, 226, 0.7),
                ),
                const SizedBox(height: 10),
                Text(
                  "Product Detail",
                  style: GoogleFonts.dmSans(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Text(
                  "Apples Are Nutritious. Apples May Be Good For Weight Loss. Apples May Be Good For Your Heart. As Part Of A Healthy And Varied Diet.",
                  style: GoogleFonts.dmSans(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been used since the 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: GoogleFonts.dmSans(
                      color: Color.fromRGBO(124, 124, 124, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () async {
                    Map<String, dynamic> product = {
                      'productName': widget.productName,
                      'productWeight': widget.weight,
                      'price': price,
                      'image': widget.img,
                      'quantity': index,
                    };

                    // Insert product into the database
                    await _dbHelper.insertProduct(product);

                    // Show Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Product added to cart!',
                          style: GoogleFonts.dmSans(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: AppConstant.primaryColor,
                    ),
                    child: Center(
                        child: Text(
                      "Add To Basket",
                      style: GoogleFonts.dmSans(
                          color: Color.fromRGBO(255, 249, 255, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
