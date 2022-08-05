import 'package:http_multi_server/http_multi_server.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:demo/service.dart';

void main() async {
  var port = 12345;
  var address = '0.0.0.0';

  var service = Service();
  var server = const shelf.Pipeline()
    .addMiddleware(shelf.logRequests())
    .addHandler(service.handler);
  await shelf_io.serve(server, address, port);

  print("listen $port");
}
