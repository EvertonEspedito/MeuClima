class Leitura {
  final String deviceId;
  final String bairro;
  final double temperatura;
  final double umidade;
  final double pressao;
  final DateTime timestamp;

  Leitura({
    required this.deviceId,
    required this.bairro,
    required this.temperatura,
    required this.umidade,
    required this.pressao,
    required this.timestamp,
  });

  factory Leitura.fromJson(Map<String, dynamic> json) {
    return Leitura(
      deviceId: json['device_id'],
      bairro: json['bairro'],
      temperatura: (json['temperatura'] as num).toDouble(),
      umidade: (json['umidade'] as num).toDouble(),
      pressao: (json['pressao'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'device_id': deviceId,
      'bairro': bairro,
      'temperatura': temperatura,
      'umidade': umidade,
      'pressao': pressao,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}