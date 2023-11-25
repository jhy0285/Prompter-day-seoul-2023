class UserPlant {
  final int id;
  final String name;
  final String plantType;

  UserPlant({
    required this.id,
    required this.name,
    required this.plantType,
  });

  factory UserPlant.fromJson(Map<String, dynamic> json) {
    return UserPlant(
      id: json['id'],
      name: json['name'],
      plantType: json['plantType'],
    );
  }
}
