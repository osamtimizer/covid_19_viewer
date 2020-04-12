import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid-19 Viewer",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                child: Text("Menu"),
              ),
            ),
            ListTile(
              title: Text("プライバシーポリシー"),
              onTap: () async {
                const url =
                    "https://covid-19-viewer-document.now.sh/privacyPolicy";
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
            ListTile(
              title: Text("このアプリについて"),
              onTap: () async {
                const url = "https://covid-19-viewer-document.now.sh/";
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Center(
            child: NationWide(),
          ),
          Center(
            child: ByPrefecture(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          title: Text("全国"),
          icon: Icon(Icons.place),
        ),
        BottomNavigationBarItem(
          title: Text("都道府県別"),
          icon: Icon(Icons.directions_walk),
        ),
      ]),
    );
  }
}
