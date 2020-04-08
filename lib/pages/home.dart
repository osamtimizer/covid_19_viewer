import 'package:covid_19_viewer/imports.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final covid19 = Provider.of<Covid19Store>(context).covid19;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text(covid19.transition.carriers.first.count.toString()),
      ),
    );
  }
}
