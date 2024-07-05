class Address {
  final int? id;
  final String? line1;
  final String? line2;
  final String? city;
  final String? postcode;

  Address({
    this.id,
    this.line1,
    this.line2,
    this.city,
    this.postcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json['id'] as int?,
        line1: json['line1'] as String?,
        line2: json['line2'] as String?,
        city: json['city'] as String?,
        postcode: json['postcode'] as String?,
      );
}
