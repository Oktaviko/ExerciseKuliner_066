import 'dart:convert';

class Kuliner {
  final String namatempatkuliner;
  final String kisaranharga;
  final String alamat;
  final String telepon;
  final String foto;
  Kuliner({
    required this.namatempatkuliner,
    required this.kisaranharga,
    required this.alamat,
    required this.telepon,
    required this.foto,
  });

  Kuliner copyWith({
    String? namatempatkuliner,
    String? kisaranharga,
    String? alamat,
    String? telepon,
    String? foto,
  }) {
    return Kuliner(
      namatempatkuliner: namatempatkuliner ?? this.namatempatkuliner,
      kisaranharga: kisaranharga ?? this.kisaranharga,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'namatempatkuliner': namatempatkuliner});
    result.addAll({'kisaranharga': kisaranharga});
    result.addAll({'alamat': alamat});
    result.addAll({'telepon': telepon});
    result.addAll({'foto': foto});
  
    return result;
  }

  factory Kuliner.fromMap(Map<String, dynamic> map) {
    return Kuliner(
      namatempatkuliner: map['namatempatkuliner'] ?? '',
      kisaranharga: map['kisaranharga'] ?? '',
      alamat: map['alamat'] ?? '',
      telepon: map['telepon'] ?? '',
      foto: map['foto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Kuliner.fromJson(String source) => Kuliner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Kuliner(namatempatkuliner: $namatempatkuliner, kisaranharga: $kisaranharga, alamat: $alamat, telepon: $telepon, foto: $foto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Kuliner &&
      other.namatempatkuliner == namatempatkuliner &&
      other.kisaranharga == kisaranharga &&
      other.alamat == alamat &&
      other.telepon == telepon &&
      other.foto == foto;
  }

  @override
  int get hashCode {
    return namatempatkuliner.hashCode ^
      kisaranharga.hashCode ^
      alamat.hashCode ^
      telepon.hashCode ^
      foto.hashCode;
  }
}
