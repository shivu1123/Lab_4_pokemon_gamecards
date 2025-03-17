// Import necessary Dart and Flutter packages.
import 'dart:convert'; // Provides encoding and decoding for JSON.
import 'package:http/http.dart' as http; // Provides HTTP requests and responses.

// ApiService class handles communication with the Pokémon TCG API.
class ApiService {
  // API key for authenticating requests. Replace with your actual API key.
  static const String apiKey = '0066410d-e763-46cb-ad4e-afec76a955d9';

  // Base URL for the Pokémon TCG API.
  static const String baseUrl = 'https://api.pokemontcg.io/v2/cards';

  // Asynchronous method to fetch cards from the API.
  Future<List<dynamic>> fetchCards() async {
    // Construct the full URL with the API key as a query parameter.
    final response = await http.get(
      Uri.parse(baseUrl),
      // Include the API key in the headers for authentication.
      headers: {'X-Api-Key': apiKey},
    );

    // Check if the request was successful (status code 200).
    if (response.statusCode == 200) {
      // Decode the JSON response and extract the 'data' field.
      return jsonDecode(response.body)['data'];
    } else {
      // If the server returns an error, throw an exception.
      throw Exception('Failed to load cards');
    }
  }
}
