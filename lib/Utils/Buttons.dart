//just uncomment the whole code once and  remove this  line(fix  suggestion)

// import 'package:mygrocery/Utils/frequent_utils.dart';
// import 'package:mygrocery/res/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class YellowRaisedButtons extends StatelessWidget {
//   final String title;
//   final Function callback;

//   YellowRaisedButtons({
//     this.title,
//     this.callback,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.020),
//       height: MediaQuery.of(context).size.height * 0.060,
//       width: double.infinity,
//       child: MaterialButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//         elevation: 8,
//         color: textColor,
//         textColor: Colors.black,
//         child: Text(title, style: FrequentUtils.getInstance().kTitleList),
//         onPressed: callback,
//       ),
//     );
//   }
// }

// class ReverdBackButton extends StatelessWidget {
//   final Function callback;

//   ReverdBackButton({
//     this.callback,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//         onPressed: callback,
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.white,
//             ),
//             Text(
//               "Back",
//               style: FrequentUtils.getInstance().kBackButton,
//             ),
//           ],
//         ));
//   }
// }

// class TicketUploadButton extends StatelessWidget {
//   final String title;
//   final Function callback;
//   final Color color;
//   final IconData iconData;

//   TicketUploadButton({this.title, this.callback, this.color, this.iconData});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.height * 0.020,
//             vertical: MediaQuery.of(context).size.height * 0.016),
//         height: MediaQuery.of(context).size.height * 0.060,
//         width: MediaQuery.of(context).size.width,
//         child: MaterialButton(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           elevation: 2,
//           color: color,
//           textColor: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 iconData,
//                 color: Colors.blueGrey,
//               ),
//               SizedBox(
//                 width: 50,
//               ),
//               Text(title,
//                   textAlign: TextAlign.center,
//                   style: FrequentUtils.getInstance().kSubTitleList),
//             ],
//           ),
//           onPressed: callback,
//         ));
//   }
// }

// class BottomSheetCamera extends StatelessWidget {
//   final Function callGalery;
//   final Function callCamera;
//   final String title;
//   BottomSheetCamera({this.callGalery, this.callCamera, this.title});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: textColor,
//       height: 100.0,
//       width: MediaQuery.of(context).size.width,
//       margin: EdgeInsets.symmetric(
//         horizontal: 20,
//         vertical: 20,
//       ),
//       child: Column(
//         children: [
//           Text(title, style: GoogleFonts.lato(fontSize: 20.0)),
//           SizedBox(
//             height: 20.0,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ignore: deprecated_member_use
//               FlatButton.icon(
//                 icon: Icon(Icons.camera),
//                 onPressed: callCamera,
//                 label: Text("Camera"),
//               ),
//               // ignore: deprecated_member_use
//               FlatButton.icon(
//                 icon: Icon(Icons.image),
//                 onPressed: callGalery,
//                 label: Text("Gallery"),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
