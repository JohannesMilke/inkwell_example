import 'package:flutter/material.dart';
import 'package:inkwell_example/widget/custom_border.dart';
import 'package:inkwell_example/widget/inkwell_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'InkWell Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
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
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              buildBackground(),
              Align(
                alignment: Alignment.center,
                child: buildTitle(),
              ),
              Align(
                alignment: Alignment(0.0, 0.9),
                child: buildActions(),
              ),
              Positioned(
                right: 8,
                top: 4,
                child: buildBookmark(),
              ),
              Positioned(
                left: -32,
                top: 20,
                child: buildBadge(),
              ),
            ],
          ),
        ),
      );

  Widget buildTitle() => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: InkWellWidget(
          color: Colors.red.withOpacity(0.7),
          customBorder: CustomBorder(),
          onTap: () {},
          builder: (isTapped) => Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'LIMITLESS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    'A science fiction thriller film directed by Neil Burger',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildBadge() => RotationTransition(
        turns: AlwaysStoppedAnimation(-45 / 360),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 32),
          color: Colors.white,
          child: Text(
            'POPULAR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget buildActions() => Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWellWidget(
              color: Colors.red.withOpacity(0.7),
              onTap: () {},
              builder: (isTapped) {
                final color = isTapped ? Colors.white : Colors.red;

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_border, color: color),
                      const SizedBox(width: 8),
                      Text(
                        '27 K',
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            InkWellWidget(
              color: Colors.blue.withOpacity(0.7),
              onTap: () {},
              builder: (isTapped) {
                final color = isTapped ? Colors.white : Colors.blue;

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Icons.share, color: color),
                      const SizedBox(width: 8),
                      Text(
                        '3.2 K',
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );

  Widget buildBookmark() => InkWellWidget(
        color: Colors.yellow.withOpacity(0.6),
        borderRadius: BorderRadius.circular(24),
        onTap: () {},
        builder: (isTapped) => Container(
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.bookmark_border,
            color: isTapped ? Colors.black : Colors.white,
            size: 40,
          ),
        ),
      );

  Widget buildBackground() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.black,
          child: Opacity(
            opacity: 0.8,
            child: Image.network(
              'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
}
