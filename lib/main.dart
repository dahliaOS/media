import 'package:Media/widgets/coloredtabbar.dart';
import 'package:Media/widgets/ui/tabs/albums.dart';
import 'package:Media/widgets/ui/tabs/photos.dart';
import 'package:Media/widgets/ui/tabs/videos.dart';
import 'package:Media/widgets/ui/viewer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Media());
}

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => Home(),
        "viewer": (context) => Viewer(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar: ColoredTabBar(
            Colors.grey[900],
            TabBar(
              indicator: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              physics: BouncingScrollPhysics(),
              controller: DefaultTabController.of(context),
              tabs: [
                Tab(
                  icon: Icon(Icons.photo_library_outlined),
                  text: "Photos",
                ),
                Tab(
                  icon: Icon(Icons.video_library_outlined),
                  text: "Videos",
                ),
                Tab(
                  icon: Icon(Icons.photo_album_outlined),
                  text: "Albums",
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: DefaultTabController.of(context),
            children: [
              PhotoTab(),
              VideoTab(),
              AlbumTab(),
            ],
          )),
    );
  }
}
