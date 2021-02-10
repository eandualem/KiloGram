import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {

  final bool isOnline;
  final String imageUrl;
  final int unReadMessages;

  ImageWidget({this.isOnline, this.imageUrl, this.unReadMessages = 0 });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.9, 0.9),
      children: [
        Container(
          decoration: isOnline ?
          BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
            // shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          )
              : BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(imageUrl),
          ),
        ),
        this.unReadMessages != 0 ? Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Text(
            '27',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
            ),
          )
        ) : Container(
          child: null,
        ),
    ]);
  }
}
