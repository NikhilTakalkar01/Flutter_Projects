import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/cart/payment.dart';
import 'package:groceriet/constants/app_constant.dart';
import 'package:groceriet/database_connection/database.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  // Fetch products from the database
  Future<void> _loadProducts() async {
    final data = await _dbHelper.getProducts();
    setState(() {
      products = data;
    });
  }

  // Update product quantity and price
  Future<void> _updateProduct(
      int index, int newQuantity, double newPrice) async {
    final product = products[index];
    await _dbHelper.updateProduct(product['id'], newQuantity, newPrice);
    await _loadProducts(); // Refresh the product list
  }

  double _calculateTotalPrice() {
    double total = 0.0;
    for (var product in products) {
      total += double.parse(product['price'].toString());
    }
    return total;
  }

  Widget row(String option, String option2, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 10, bottom: 10),
        child: Row(
          children: [
            Text(
              option,
              style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(124, 124, 124, 1)),
            ),
            Spacer(),
            Text(
              option2,
              style: GoogleFonts.dmSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(24, 23, 37, 1)),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _calculateTotalPrice();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Center(
              child: Text(
                "My Cart",
                style: AppConstant.appBarTextStyle,
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 0.45),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: products.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 300.0),
                      child: Center(
                        child: Text(
                          "No products available in My Cart",
                          style: GoogleFonts.dmSans(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset(
                                    product['image'],
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            product['productName'],
                                            style: GoogleFonts.dmSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () async {
                                              await _dbHelper
                                                  .deleteProduct(product['id']);
                                              await _loadProducts(); // Refresh the product list
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Product remove from cart!',
                                                    style: GoogleFonts.dmSans(
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor: Colors.green,
                                                  duration:
                                                      Duration(seconds: 2),
                                                ),
                                              );
                                            },
                                            child: SvgPicture.asset(
                                                "assets/cancle.svg"),
                                          ),
                                        ],
                                      ),
                                      Text(product['productWeight']),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (product['quantity'] > 1) {
                                                final newQuantity =
                                                    product['quantity'] - 1;
                                                final newPrice =
                                                    product['price'] - 60.00;
                                                _updateProduct(index,
                                                    newQuantity, newPrice);
                                              }
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      226, 226, 226, 1),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.remove,
                                                size: 28,
                                                color: Color.fromRGBO(
                                                    179, 179, 179, 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            "${product['quantity']}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(width: 15),
                                          GestureDetector(
                                            onTap: () {
                                              final newQuantity =
                                                  product['quantity'] + 1;
                                              final newPrice =
                                                  product['price'] + 60.00;
                                              _updateProduct(
                                                  index, newQuantity, newPrice);
                                            },
                                            child: Container(
                                              height: 45,
                                              width: 45,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      226, 226, 226, 1),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: 28,
                                                color: Color.fromRGBO(
                                                    83, 177, 117, 1),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            "₹${product['price']}",
                                            style: GoogleFonts.dmSans(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24,
                                              color:
                                                  Color.fromRGBO(24, 23, 37, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 0.45),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          if (totalPrice > 0.0) {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 15),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Checkout",
                                style: GoogleFonts.dmSans(
                                    fontSize: 24, fontWeight: FontWeight.w700),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/cancle.svg",
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.4,
                        ),
                        row("Delivery", "Select Method", () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container();
                              });
                        }),
                        Divider(
                          thickness: 0.4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                "Payment",
                                style: GoogleFonts.dmSans(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.4,
                        ),
                        row("Promo Code", "pick discount", () {}),
                        Divider(
                          thickness: 0.4,
                        ),
                        row("Total Cost", "$totalPrice", () {}),
                        Divider(
                          thickness: 0.4,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20, right: 130, top: 20, bottom: 20),
                          child: Text(
                            "By placing an order you agree to our Terms And Conditions",
                            style: GoogleFonts.dmSans(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return PaymentScreen();
                            }));
                          },
                          child: Container(
                            height: 70,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(83, 177, 117, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "Go to Checkout",
                                      style: GoogleFonts.dmSans(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Container(
                                        height: 25,
                                        width: 50,
                                        color: Color.fromRGBO(72, 158, 103, 1),
                                        child: Center(
                                            child: Text(
                                          "₹$totalPrice",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red[400],
                content: Text(
                  "No product added to card",
                  style: GoogleFonts.dmSans(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )));
          }
        },
        child: Container(
          height: 70,
          width: 350,
          decoration: BoxDecoration(
              color: Color.fromRGBO(83, 177, 117, 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Go to Checkout",
                    style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Container(
                      height: 25,
                      width: 50,
                      color: Color.fromRGBO(72, 158, 103, 1),
                      child: Center(
                          child: Text(
                        "₹$totalPrice",
                        style: TextStyle(color: Colors.white),
                      ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
