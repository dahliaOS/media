import 'package:media/widgets/gridtile.dart';
import 'package:flutter/material.dart';

class PhotoTab extends StatefulWidget {
  PhotoTab({Key? key}) : super(key: key);

  @override
  _PhotoTabState createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: GridView.builder(
        itemCount: 100,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100),
        itemBuilder: (context, index) {
          return MediaGridTile(
            index: index,
          );
        },
      ),
    );
  }
}
