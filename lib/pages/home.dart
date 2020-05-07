import 'package:covid_19_viewer/imports.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TabBarStore>(context);
    final pageController = PageController();
    pageController.addListener(() {});
    final onPageChanged = (int index) async {
      Provider.of<TabBarStore>(context, listen: false).updateIndex(index);
    };
    final onTap = (int index) async {
      Provider.of<TabBarStore>(context, listen: false).updateIndex(index);
      if (pageController.hasClients) {
        pageController.animateToPage(index,
            duration: const Duration(microseconds: 400),
            curve: Curves.easeInSine);
      }
    };

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
        controller: pageController,
        children: <Widget>[
          Center(
            child: NationWide(),
          ),
          Center(
            child: ByPrefecture(),
          ),
        ],
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            title: Text("全国"),
            icon: Icon(Icons.place),
          ),
          BottomNavigationBarItem(
            title: Text("都道府県別"),
            icon: Icon(Icons.directions_walk),
          ),
        ],
        currentIndex: store.currentIndex,
        onTap: onTap,
      ),
    );
  }
}
