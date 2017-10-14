library elastic_rest_api;

//export 'src/elastic.dart';
//export 'src/exceptions.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

part 'src/elastic.dart';
part 'src/exceptions.dart';

//clientFactory() => new http.Client();

class ElasticApi {

  ElasticRequest elasticRequest;

  ElasticApi([
    String host,
    http.Client client,
    String login,
    String password])  : elasticRequest = new ElasticRequest(host,  client, login, password);
}