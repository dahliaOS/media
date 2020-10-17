import 'package:flutter/material.dart';

class MediaGridTile extends StatefulWidget {
  @override
  _MediaGridTileState createState() => _MediaGridTileState();
}

class _MediaGridTileState extends State<MediaGridTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 500,
          height: 150,
          child: Image.asset(
            "assets/examples/logo.png",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
