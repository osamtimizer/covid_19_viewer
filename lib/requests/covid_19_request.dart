import 'package:http/http.dart' as http;

import 'package:covid_19_viewer/imports.dart';

class Covid19Request {
  final uri = Uri.parse(
      "https://raw.githubusercontent.com/kaz-ogiwara/covid19/master/data/data.json");
  final http.Client client;

  Covid19Request({@required this.client});

  Future<Covid19> fetch() async {
    final response = await this.client.get(uri).catchError((error) {
      Crashlytics.instance.recordError(error, StackTrace.current);
      throw error;
    });
    if (response.statusCode >= 400) {
      final error = Exception("http request error");
      throw error;
    }
    return Covid19.fromJson(json.decode(response.body));
  }
}
