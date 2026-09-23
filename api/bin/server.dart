import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  print('======================================');
  print('MEUCLIMA SERVER NOVO');
  print('======================================');

  final router = Router();

  router.get('/api/v1/leituras', (Request request) {
    print('GET /api/v1/leituras');

    return Response.ok(
      'GET funcionando!',
    );
  });

  router.post('/api/v1/leituras', (Request request) async {
    final body = await request.readAsString();

    print('POST /api/v1/leituras');
    print('Body: $body');

    return Response.ok(
      'POST funcionando!',
    );
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router.call);

  final server = await shelf_io.serve(
    handler,
    'localhost',
    8080,
  );

  print(
    'MeuClima API rodando em '
    'http://${server.address.host}:${server.port}',
  );
}