import 'package:freerpd/freerpd.dart' as freerpd;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as shelf_io;

void main(List<String> arguments) async {
  var port = 12345;
  var address = '0.0.0.0';

  var server = freerpd.FreerpServer();
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(server.handler);

  await shelf_io.serve(handler, address, port);

  print("listen $port");
}
