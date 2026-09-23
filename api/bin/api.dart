import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import '../lib/routes/health_route.dart';
import '../lib/routes/leitura_route.dart';

void main() async {

  final router = Router();

  router.get('/api/health', healthCheck);

  router.post('/api/v1/leituras', criarLeitura);

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final server = await shelf_io.serve(
    handler,
    '0.0.0.0',
    8080,
  );

  print(
    'API rodando em http://${server.address.host}:${server.port}',
  );
}