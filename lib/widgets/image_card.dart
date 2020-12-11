import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String link;
  ImageCard(this.link);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.red,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Image.network(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}
