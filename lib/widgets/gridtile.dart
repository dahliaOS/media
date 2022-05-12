import 'package:flutter/material.dart';

class MediaGridTile extends StatefulWidget {
  final int? index;

  const MediaGridTile({Key? key, @required this.index}) : super(key: key);
  @override
  _MediaGridTileState createState() => _MediaGridTileState();
}

List<int> _selectedList = List<int>.empty(growable: true);

class _MediaGridTileState extends State<MediaGridTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (!_selectedList.contains(widget.index)) {
                    setState(() {
                      _selectedList.add(widget.index!);
                    });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      margin: EdgeInsets.all(10),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: "Unselect All",
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          setState(() {
                            _selectedList.clear();
                          });
                        },
                      ),
                      content:
                          Text("Selected: " + _selectedList.length.toString()),
                      duration: Duration(days: 1),
                    ));
                    print(_selectedList.length);
                  } else {
                    _selectedList.remove(widget.index);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    if (_selectedList.length != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        action: SnackBarAction(
                          label: "Unselect All",
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            setState(() {
                              _selectedList.clear();
                            });
                          },
                        ),
                        content: Text(
                            "Selected: " + _selectedList.length.toString()),
                        duration: Duration(days: 1),
                      ));
                    }
                  }
                });
              },
              child: SizedBox(
                width: 500,
                height: 150,
                child: Image.asset(
                  "assets/examples/logo.png",
                  package: "media",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        _selectedList.contains(widget.index)
            ? Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(Icons.check),
              )
            : SizedBox.shrink()
      ],
    );
  }
}
