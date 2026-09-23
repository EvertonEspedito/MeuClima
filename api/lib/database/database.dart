import 'package:postgres/postgres.dart';

class Database {
  static final connection = Connection.open(
    Endpoint(
      host: const String.fromEnvironment(
        'DB_HOST',
        defaultValue: 'localhost',
      ),
      port: int.fromEnvironment(
        'DB_PORT',
        defaultValue: 5432,
      ),
      database: const String.fromEnvironment(
        'DB_NAME',
        defaultValue: 'meuclima',
      ),
      username: const String.fromEnvironment(
        'DB_USER',
        defaultValue: 'meuclima_user',
      ),
      password: const String.fromEnvironment(
        'DB_PASSWORD',
        defaultValue: '',
      ),
    ),
    settings: const ConnectionSettings(
      sslMode: SslMode.disable,
    ),
  );
}