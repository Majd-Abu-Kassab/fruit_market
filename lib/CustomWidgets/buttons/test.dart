// import 'package:flutter/material.dart';
//
// class TransparentButton extends StatelessWidget {
//   final VoidCallback onPressed;
//
//   const TransparentButton({Key? key, required this.onPressed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         height: 50.0,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border.all(
//             color: Colors.grey[400]!,
//             width: 2.0,
//           ),
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.search,
//               color: Colors.grey[400]!,
//             ),
//             SizedBox(width: 10.0),
//             Expanded(
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   hintStyle: TextStyle(
//                     color: Colors.grey[400]!,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
