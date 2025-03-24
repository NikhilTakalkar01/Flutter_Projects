import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/constants/app_constant.dart';
import 'package:groceriet/database_connection/database.dart'; // Import DatabaseHelper

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // Method to load favorite products from the database
  Future<void> _loadFavorites() async {
    final favorites = await _dbHelper.getFavorites();
    setState(() {
      _favorites = favorites;
    });
  }

  // Method to remove the favorite product from the database
  Future<void> _removeFavorite(String productName) async {
    await _dbHelper.removeFavorite(productName);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Product removed from favorites!',
          style: GoogleFonts.dmSans(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
    _loadFavorites();
  }

  double _calculateTotalPrice() {
    double total = 0.0;
    for (var product in _favorites) {
      total += double.parse(product['price'].toString());
    }
    return total;
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
                "Favourite",
                style: AppConstant.appBarTextStyle,
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 0.45),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: _favorites.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: Text(
                          "No products available in favorites",
                          style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _favorites.length,
                      itemBuilder: (context, index) {
                        final product = _favorites[
                            index]; // Get the product data from the list

                        return Dismissible(
                          key: Key(product[
                              'productName']), // Unique key for each item
                          direction: DismissDirection
                              .endToStart, // Swipe from right to left
                          onDismissed: (direction) async {
                            // When the item is dismissed, remove from favorites
                            await _removeFavorite(product['productName']);
                          },
                          background: Container(
                            color: Colors.red,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Image.asset(
                                      product['image'], // Use the product image
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product[
                                                      'productName'], // Product name
                                                  style: GoogleFonts.dmSans(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(product[
                                                    'productWeight']), // Product weight
                                              ],
                                            ),
                                            Spacer(),
                                            Row(
                                              children: [
                                                Text('₹${product['price']}',
                                                    style: TextStyle(
                                                        fontSize:
                                                            16)), // Product price
                                                Icon(Icons.keyboard_arrow_right)
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(thickness: 0.45),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
            color: Color.fromRGBO(83, 177, 117, 1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Add all to card",
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
