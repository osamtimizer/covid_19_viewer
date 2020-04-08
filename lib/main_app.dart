import 'package:http/http.dart' as http;
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
    final request = Covid19Request(client: http.Client());
    request.fetch().then((value) {
      Provider.of<Covid19Store>(context, listen: false).updateCovid19(value);
    });
    return Home();
  }
}
