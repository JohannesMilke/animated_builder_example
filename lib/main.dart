import 'package:animated_builder_example/widget/rotation_box_widget.dart';
import 'package:animated_builder_example/widget/slidetransition_box_widget.dart';
import 'package:animated_builder_example/widget/transform_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'AnimatedBuilder';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
            primaryColor: Colors.white, scaffoldBackgroundColor: Colors.black),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildPages(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Text('AnimatedBuilder'),
              title: Text('Rotation'),
            ),
            BottomNavigationBarItem(
              icon: Text('AnimatedBuilder'),
              title: Text('Transition'),
            ),
            BottomNavigationBarItem(
              icon: Text('AnimatedBuilder'),
              title: Text('Transform'),
            ),
          ],
          onTap: (int index) => setState(() => this.index = index),
        ),

        // Rotation
      );

  Widget buildPages() {
    switch (index) {
      case 0:
        return RotationBoxWidget();
      case 1:
        return SlideTransitionBoxWidget();
      case 2:
        return TransformBoxWidget();
      default:
        return Container();
    }
  }
}
