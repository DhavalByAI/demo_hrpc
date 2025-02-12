import 'package:demo_hrpc/api/url.dart';
import 'package:demo_hrpc/models/airport_email_model.dart';
import 'package:dio/dio.dart';
import '../models/airport_model.dart';

class AirportRepository {
  final Dio _dio = Dio();

  Future<List<Airport>> fetchDeployedAirports() async {
    try {
      final response = await _dio.get(url.baseUrl + url.airportDeployed);

      print("--------->response*----->${response.data}");
      if (response.statusCode == 200) {
        return Airport.fromJsonList(response.data['resultArray']);
      }
      throw Exception('Failed to load airports');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<GetAirportListByEmailDomainModel> getAirportsByEmail(
      String email) async {
    try {
      final emailDomain = email.split('@').last;
      final response = await _dio.post(
        url.baseUrl + url.getAirportListByEmailDomain,
        data: {"emailDomain": emailDomain},
      );

      if (response.statusCode == 200) {
        return GetAirportListByEmailDomainModel.fromJson(response.data);
      }
      throw Exception('No access to airports');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
