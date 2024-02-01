class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
    );
  }
}
