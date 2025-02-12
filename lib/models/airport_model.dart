import 'dart:convert';

class Airport {
  final String airportCode;
  final String airportName;
  final String airportLogo;

  Airport(
      {required this.airportCode,
      required this.airportName,
      required this.airportLogo});

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      airportCode: json['airportCode'],
      airportName: json['airportName'],
      airportLogo: json['airportLogo'],
    );
  }

  static List<Airport> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Airport.fromJson(json)).toList();
  }
}
