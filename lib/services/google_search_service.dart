import 'dart:convert';
import 'package:http/http.dart' as http;

class GeocodingService {
  final String apiKey;

  GeocodingService({required this.apiKey});

  

Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
  const apiKey = 'AIzaSyDwF79_5qpd86Fh9pifOeBL5sOACgwmh0w';
  final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final address = jsonResponse['results'][0]['formatted_address'];
    return address;
  } else {
    throw Exception('Failed to load address');
  }
}

}
