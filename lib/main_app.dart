import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'imports.dart';

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => Covid19Store(),
            )
          ],
          child: MyHomePage(title: 'Covid 19 Viewer'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    Client client = http.Client();
    if (Constants.isDebug) {
      client = MockClient((_) async {
        final loadData = await rootBundle.loadString("assets/covid19.json");
        return Response(loadData, 200,
            headers: {'Content-Type': 'application/json; charset=utf-8'});
      });
    }
    final request = Covid19Request(client: client);
    request.fetch().then((value) {
      Provider.of<Covid19Store>(context, listen: false).updateCovid19(value);
    });
    return Home();
  }
}
