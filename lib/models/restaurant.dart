class Restaurant {
  final String? id;
  final String? name;
  final String? photoUrl;
  final String? description;
  final bool? isActive;

  Restaurant(
      {required this.id,
      required this.name,
      required this.photoUrl,
      required this.description,
      required this.isActive});

  factory Restaurant.fromJson(Map<dynamic, dynamic> json) {
    return Restaurant(
        id: json['id'],
        name: json['name'],
        photoUrl: json['photo_url'],
        description: json['description'],
        isActive: json['is_active']);
  }
}
