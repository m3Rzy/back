import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const protocol = "http";
const host = "10.0.2.2:3000";

Future<RequestResult> http_post(String route, [dynamic data]) async
{
  var url = Uri.parse("$protocol://$host/$route");
  var dataStr = jsonEncode(data);
  var result = await http.post(url, body: dataStr, headers: {"Content-Type": "application/json"});
  return RequestResult(true, jsonDecode(result.body));
}