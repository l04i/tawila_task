class Hours {
  final Day? friday;
  final Day? monday;
  final Day? sunday;
  final Day? tuesday;
  final Day? saturday;
  final Day? thursday;
  final Day? wednesday;

  Hours({
    this.friday,
    this.monday,
    this.sunday,
    this.tuesday,
    this.saturday,
    this.thursday,
    this.wednesday,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => Hours(
        friday: json['friday'] == null
            ? null
            : Day.fromJson(json['friday'] as Map<String, dynamic>),
        monday: json['monday'] == null
            ? null
            : Day.fromJson(json['monday'] as Map<String, dynamic>),
        sunday: json['sunday'] == null
            ? null
            : Day.fromJson(json['sunday'] as Map<String, dynamic>),
        tuesday: json['tuesday'] == null
            ? null
            : Day.fromJson(json['tuesday'] as Map<String, dynamic>),
        saturday: json['saturday'] == null
            ? null
            : Day.fromJson(json['saturday'] as Map<String, dynamic>),
        thursday: json['thursday'] == null
            ? null
            : Day.fromJson(json['thursday'] as Map<String, dynamic>),
        wednesday: json['wednesday'] == null
            ? null
            : Day.fromJson(json['wednesday'] as Map<String, dynamic>),
      );
}

class Day {
  final String? closing;
  final String? opening;

  Day({
    this.closing,
    this.opening,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        closing: json['closing'] as String?,
        opening: json['opening'] as String?,
      );
}
