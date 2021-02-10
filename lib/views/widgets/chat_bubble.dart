// import 'package:flutter/material.dart';
// import 'package:tdlib/td_api.dart';
//
// class ChatBubble extends StatelessWidget {
//
//   final bool isMe;
//   final bool isSameUser;
//   final Message _message;
//
//   const ChatBubble({this.message, this.isMe, this.isSameUser});
//
//   @override
//   Widget build(BuildContext context)
//   {
//     if (isMe) {
//       return Column(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.topRight,
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.80,
//               ),
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).primaryColor,
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Text(
//                 message.text,
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           !isSameUser
//               ? Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               Text(
//                 message.time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black45,
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   radius: 15,
//                   backgroundImage: AssetImage(message.sender.imageUrl),
//                 ),
//               ),
//             ],
//           )
//               : Container(
//             child: null,
//           ),
//         ],
//       );
//     } else {
//       return Column(
//         children: <Widget>[
//           Container(
//             alignment: Alignment.topLeft,
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.80,
//               ),
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.symmetric(vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                   ),
//                 ],
//               ),
//               child: Text(
//                 message.text,
//                 style: TextStyle(
//                   color: Colors.black54,
//                 ),
//               ),
//             ),
//           ),
//           !isSameUser
//               ? Row(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: CircleAvatar(
//                   radius: 15,
//                   backgroundImage: AssetImage(message.sender.imageUrl),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 message.time,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black45,
//                 ),
//               ),
//             ],
//           )
//               : Container(
//             child: null,
//           ),
//         ],
//       );
//     }
//   }
// }
