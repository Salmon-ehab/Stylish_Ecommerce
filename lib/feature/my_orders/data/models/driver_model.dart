
class Driver {
  Driver({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.phone,
  });

  final double? latitude;
  final double? longitude;
  final String? name;
  final String? phone;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      latitude: json["latitude"]?.toDouble(),
      longitude: json["longitude"]?.toDouble(),
      name: json["name"],
      phone: json["phone"],
    );
  }
}