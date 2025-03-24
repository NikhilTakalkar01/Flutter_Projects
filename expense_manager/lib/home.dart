import 'package:expense_manager/graph_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  bool flag1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 135.0),
            child: Row(
              children: [
                Text(
                  'Expense Manager',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 17.5),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ],
            ),
          ),
        ],
        // backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        width: 240,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expense Manager',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(height: 5),
                  Text(
                    'Saves all your Transactions',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 20),
            buildDrawerItem(
              index: 0,
              icon: Icons.list_alt,
              title: 'Transaction',
            ),
            buildDrawerItem(
              index: 1,
              icon: Icons.bar_chart,
              title: 'Graphs',
            ),
            buildDrawerItem(
              index: 2,
              icon: Icons.category,
              title: 'Category',
            ),
            buildDrawerItem(
              index: 3,
              icon: Icons.delete,
              title: 'Trash',
            ),
            buildDrawerItem(
              index: 4,
              icon: Icons.info,
              title: 'About Us',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 5, // Example: 5 transactions
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  child: const Icon(Icons.money, color: Colors.orange),
                ),
                title: Text(
                  '₹ ${500 + index * 50}', // Dynamic transaction amount
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '3 June | 11:50 AM',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey.shade400,
                  size: 16,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        shape: const StadiumBorder(),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 42,
                          width: 330,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          "Amout",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 42,
                          width: 330,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          "Category",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 42,
                          width: 330,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 42,
                          width: 330,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(0, 0, 0, 0.3),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Add functionality here
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(130, 40),
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              // padding: EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
          setState(() {});
        },
        isExtended: true,
        icon: const Icon(
          Icons.add_circle,
          color: Colors.green,
          size: 35,
        ),
        label: Text(
          "Transaction",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return GraphScreen();
            }));
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Container(
          width: 100,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: selectedIndex == index
                ? const Color.fromRGBO(14, 161, 125, 0.15)
                : null,
          ),
          child: Center(
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(icon, color: Colors.green),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: selectedIndex == index ? Colors.green : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
