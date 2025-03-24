// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() {
//   runApp(MaterialApp(
//     home: GraphScreen(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class GraphScreen extends StatelessWidget {
//   final Map<String, double> expenseData = {
//     "Food": 650.0,
//     "Fuel": 600.0,
//     "Medicine": 500.0,
//     "Entertainment": 475.0,
//     "Shopping": 325.0,
//   };

//   final List<Color> pieColors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.cyan,
//     Colors.purple,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double totalExpense = expenseData.values.reduce((a, b) => a + b);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Graphs',
//           style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {},
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Pie Chart Section
//           SizedBox(
//             height: 250,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                List<PieChartSectionData> _buildPieChartSections() {
//     List<MapEntry<String, double>> entries = expenseData.entries.toList();
//     return List.generate(entries.length, (index) {
//       return PieChartSectionData(
//         color: pieColors[index],
//         value: entries[index].value,
//         title: '', // No text on the chart slices
//         radius: 50,
//       );
//     });
//   } ,
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Total',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.black54,
//                       ),
//                     ),
//                     Text(
//                       '₹ ${totalExpense.toStringAsFixed(2)}',
//                       style: GoogleFonts.poppins(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Legend Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: expenseData.keys
//                   .toList()
//                   .asMap()
//                   .entries
//                   .map((entry) {
//                 int index = entry.key;
//                 String category = entry.value;
//                 return Row(
//                   children: [
//                     Container(
//                       width: 10,
//                       height: 10,
//                       decoration: BoxDecoration(
//                         color: pieColors[index],
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Text(
//                       category,
//                       style: GoogleFonts.poppins(fontSize: 14),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//           Divider(height: 20),
//           // Expense List Section
//           Expanded(
//             child: ListView.builder(
//               itemCount: expenseData.length,
//               itemBuilder: (context, index) {
//                 String category = expenseData.keys.elementAt(index);
//                 double amount = expenseData[category]!;
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: pieColors[index],
//                     child: Icon(
//                       _getCategoryIcon(category),
//                       color: Colors.white,
//                     ),
//                   ),
//                   title: Text(
//                     category,
//                     style: GoogleFonts.poppins(fontSize: 16),
//                   ),
//                   trailing: Text(
//                     '₹ ${amount.toStringAsFixed(2)}',
//                     style: GoogleFonts.poppins(fontSize: 16),
//                   ),
//                 );
//               },
//             ),
//           ),
//           // Total Footer
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Total',
//                   style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   '₹ ${totalExpense.toStringAsFixed(2)}',
//                   style: GoogleFonts.poppins(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   IconData _getCategoryIcon(String category) {
//     switch (category) {
//       case 'Food':
//         return Icons.restaurant;
//       case 'Fuel':
//         return Icons.local_gas_station;
//       case 'Medicine':
//         return Icons.medical_services;
//       case 'Entertainment':
//         return Icons.movie;
//       case 'Shopping':
//         return Icons.shopping_cart;
//       default:
//         return Icons.category;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphScreen extends StatelessWidget {
  GraphScreen({super.key});
 final Map<String, double>? expenseData;
  final Map<String, double> safeExpenseData = expenseData = {
    "Food": 650.0,
    "Fuel": 600.0,
    "Medicine": 500.0,
    "Entertainment": 475.0,
    "Shopping": 325.0,
  };

  final List<Color> pieColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.cyan,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    double totalExpense =  expenseData.values.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Graphs',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Pie Chart Section
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: _buildPieChartSections(),
                    centerSpaceRadius: 60,
                    sectionsSpace: 2,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '₹ ${totalExpense.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Legend Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(expenseData.length, (index) {
                String category = expenseData.keys.elementAt(index);
                return Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: pieColors[index],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      category,
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                );
              }),
            ),
          ),
          Divider(height: 20),
          // Expense List Section
          Expanded(
            child: ListView.builder(
              itemCount: expenseData.length,
              itemBuilder: (context, index) {
                String category = expenseData.keys.elementAt(index);
                double amount = expenseData[category]!;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: pieColors[index],
                    child: Icon(
                      _getCategoryIcon(category),
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    category,
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  trailing: Text(
                    '₹ ${amount.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          // Total Footer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '₹ ${totalExpense.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _buildPieChartSections() {
    if (expenseData.isEmpty) {
    return []; // Return an empty list if data is unavailable
  }
    List<MapEntry<String, double>> entries = expenseData.entries.toList();
    return List.generate(entries.length, (index) {
      return PieChartSectionData(
        color: pieColors[index],
        value: entries[index].value,
        title: '', // No text on the chart slices
        radius: 50,
      );
    });
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Food':
        return Icons.restaurant;
      case 'Fuel':
        return Icons.local_gas_station;
      case 'Medicine':
        return Icons.medical_services;
      case 'Entertainment':
        return Icons.movie;
      case 'Shopping':
        return Icons.shopping_cart;
      default:
        return Icons.category;
    }
  }
}
