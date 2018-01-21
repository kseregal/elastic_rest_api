
part of elastic_rest_api;

final _responseDecoder = const Utf8Decoder().fuse(const JsonDecoder());

class ElasticRequest {
  final String host;
  final String _login;
  final String _password;
  final http.Client client = new http.Client();


  ElasticRequest(
      this.host,
      this._login,
      this._password);

  Future get(String path) => _request('GET', path);
  Future post(String path, body) => _request('POST', path, body);
  Future put(String path, body) => _request('PUT', path, body);
  Future delete(String path) => _request('DELETE', path);

  Future _request(String method, String path, [body]) async {
    var responseBody;
    try {
      var request = new http.Request(method, Uri.parse('$host/$path'));

      if (body != null) {
        if (body is! String) {
          body = JSON.encode(body);
        }
        request.body = body;
      }

      var _headerStr = UTF8.encode("$_login:$_password");
      var _base64HeaderStr = BASE64.encode(_headerStr);
      request.headers['Content-Type'] = "application/json";
      request.headers['Accept'] = "application/json";
      request.headers['Authorization'] = "Basic $_base64HeaderStr";
      //print(request.toString());

      var response = await client.send(request);
      responseBody = _responseDecoder.convert(
          await response.stream.toBytes());
      //print(responseBody.toString());
      //print(response.statusCode);

      if (response.statusCode >= 400) {
        if (response.statusCode == 404) {
          /// Записи не найдены.
        } else {
          var error = responseBody['error'];
          if ((error is String && error.startsWith('IndexMissingException'))
              || (error is Map && error['type'] == 'index_missing_exception')) {
            throw new IndexMissingException(responseBody);
          }
        }

        //throw new ElasticsearchException(responseBody);
      }
    } catch(e, stackTrace){
      print(e.toString());
      print(path.toString());
      if (body != null) {
        print(path.toString());
      }
      print(stackTrace);
    }

    return responseBody;
  }
}