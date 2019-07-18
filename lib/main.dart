import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyAppCupertino());

class MyAppCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> entries = ["A", "B", "C"];
  final List<int> colorCodes = [600, 500, 100];

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid), title: Text("日记")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_solid), title: Text("我"))
      ]),
      tabBuilder: (context, position) => (CupertinoTabView(
            builder: (context) => (CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: (position == 0) ? Text("日记") : Text("我"),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext contenxt, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber[colorCodes[index]],
                        child: Center(
                          child: Text(entries[index]),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                )),
          )));
}

class DetailScreen extends StatelessWidget {
  final String title;

  DetailScreen(this.title);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Details"),
        ),
        child: Center(
          child: Text("欢迎来到 :$title"),
        ),
      );
}
