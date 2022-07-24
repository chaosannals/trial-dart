import 'package:http_multi_server/http_multi_server.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart';

void main() async {
  var port = 12345;
  var address = '0.0.0.0';
  var server = await HttpMultiServer.loopback(port);

  var site = createStaticHandler(
    'public',
    defaultDocument: 'index.html',
  );

  
  // shelf_io.serve(site, address, port);
  
  shelf_io.serveRequests(server, (request) {
    return shelf.Response.ok('Hello, world!');
  });
  print("listen $port");
}