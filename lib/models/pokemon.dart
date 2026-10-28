class Pokemon {
  final int id;
  final String nombre;
  final String imagen;
  final List<String> tipos;

  Pokemon({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.tipos,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // INICIO TODO 1
    return Pokemon(
      id: json['id'],
      nombre: json['name'],
      imagen:
          json['sprites']['other']['official-artwork']['front_default'] ?? '',
      tipos: [for (final t in json['types']) t['type']['name'] as String],
    );
  }
}
