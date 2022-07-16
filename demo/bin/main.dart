import 'package:http_multi_server/http_multi_server.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;

void main() async {
  var port = 12345;
  var server = await HttpMultiServer.loopback(port);
  shelf_io.serveRequests(server, (request) {
    return shelf.Response.ok('Hello, world!');
  });
  print("listen $port");
}