import 'package:dmi_practica09_200070/model/Media.dart';
import 'package:flutter/material.dart';

class MediaDetail extends StatelessWidget {
  final Media media;
  MediaDetail(this.media);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Stack(fit: StackFit.expand,
      children: <Widget> [
        Image.network(
          media.getPosterUrl(),
          fit: BoxFit.cover,
          
        )
      ],
      ),
    );
  }
}