import 'package:postgres/postgres.dart';
import 'package:dotenv/dotenv.dart';

class Database {
  static final DotEnv env = DotEnv()..load(['.env']);

  static final connection = Connection.open(
    Endpoint(
      host: env['DB_HOST'] ?? 'localhost',
      port: int.parse(env['DB_PORT'] ?? '5432'),
      database: env['DB_NAME'] ?? 'meu_clima',
      username: env['DB_USER'] ?? 'postgres',
      password: env['DB_PASSWORD'] ?? '',
    ),
    settings: const ConnectionSettings(
      sslMode: SslMode.disable,
    ),
  );
}