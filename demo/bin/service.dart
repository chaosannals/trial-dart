import 'package:shelf/shelf.dart';

import 'package:shelf_router/shelf_router.dart';

class Service {
  Handler get handler {
    final router = Router();

    return router;
  }
}