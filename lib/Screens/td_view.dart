import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class TdView extends StatelessWidget {
  const TdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1d1d1e),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          const Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage('images/g3.jpg'), // Placeholder image
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Welcome!\nAjdar Kalbiyev',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Flutter3DViewer(
              progressBarColor: Colors.amber,
              src: 'images/bmw_car.glb',
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                buildInfoCard('Engine', 25, 'Engine need check-up', Colors.red),
                buildInfoCard('Accumulator', 35, 'Check the battery regularly',
                    Colors.orange),
                buildInfoCard('Light bulbs', 40, '', Colors.yellow),
                buildInfoCard('Pump pressure', 60, '', Colors.green),
              ],
            ),
          ),
        ],
      ),

      // body: Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Center(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: 400,
      //           width: double.maxFinite,
      //           child: Flutter3DViewer(
      //             progressBarColor: Colors.amber,
      //             src: 'images/bmw_car.glb',
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget buildInfoCard(
      String title, int percentage, String subtitle, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: CircularProgressIndicator(
                      strokeWidth: 7,
                      value: percentage / 100,
                      color: color,
                      backgroundColor: Colors.grey[700],
                    ),
                  ),
                  Text(
                    '$percentage%', // Display the percentage in the center
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle.isNotEmpty) SizedBox(height: 8),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
// as.stl
// import 'package:flutter/material.dart';
// import 'package:flutter_3d_controller/flutter_3d_controller.dart';
// import 'package:tests/images.dart';

// class TdView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DashboardScreen(),
//     );
//   }
// }

// class DashboardScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff1d1d1e),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           const Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundImage:
//                           AssetImage('images/g3.jpg'), // Placeholder image
//                     ),
//                     SizedBox(width: 16),
//                     Text(
//                       'Welcome!\nAjdar Kalbiyev',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 13,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Icon(
//                   Icons.notifications,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           SizedBox(
//             height: 400,
//             width: double.maxFinite,
//             child: Flutter3DViewer(
//               progressBarColor: Colors.amber,
//               src: 'images/bmw_car.glb',
//             ),
//           ),
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 2,
//               children: [
//                 buildInfoCard('Engine', 25, 'Engine need check-up', Colors.red),
//                 buildInfoCard('Accumulator', 35, 'Check the battery regularly',
//                     Colors.orange),
//                 buildInfoCard('Light bulbs', 40, '', Colors.yellow),
//                 buildInfoCard('Pump pressure', 60, '', Colors.green),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildInfoCard(
//       String title, int percentage, String subtitle, Color color) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         color: Colors.grey[900],
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SizedBox(
//                     height: 70,
//                     width: 70,
//                     child: CircularProgressIndicator(
//                       strokeWidth: 7,
//                       value: percentage / 100,
//                       color: color,
//                       backgroundColor: Colors.grey[700],
//                     ),
//                   ),
//                   Text(
//                     '$percentage%', // Display the percentage in the center
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               if (subtitle.isNotEmpty) SizedBox(height: 8),
//               if (subtitle.isNotEmpty)
//                 Text(
//                   subtitle,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 12,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }
