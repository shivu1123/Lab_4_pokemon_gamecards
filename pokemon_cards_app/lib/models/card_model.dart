/// Represents a Pokémon Trading Card Game card.
///
/// The [CardModel] class encapsulates the essential details of a Pokémon card,
/// including its unique identifier, name, and image URLs.
///
/// Example usage:
/// ```dart
/// CardModel card = CardModel(
///   id: 'xy7-54',
///   name: 'Pikachu',
///   imageUrl: 'https://images.pokemontcg.io/xy7/54.png',
///   imageUrlHiRes: 'https://images.pokemontcg.io/xy7/54_hires.png',
/// );
/// ```
class CardModel {
  /// The unique identifier for the card.
  ///
  /// This ID is typically assigned by the Pokémon TCG API and follows a specific
  /// format, such as 'xy7-54'.
  final String id;

  /// The name of the Pokémon card.
  ///
  /// For example, 'Pikachu'.
  final String name;

  /// The URL of the card's small image.
  ///
  /// This URL points to a lower-resolution image of the card, suitable for
  /// thumbnails or previews.
  final String imageUrl;

  /// The URL of the card's high-resolution image.
  ///
  /// This URL points to a higher-resolution image of the card, suitable for
  /// detailed views.
  final String imageUrlHiRes;

  /// Creates a new instance of [CardModel].
  ///
  /// All parameters are required to instantiate a [CardModel].
  ///
  /// - [id]: The unique identifier for the card.
  /// - [name]: The name of the Pokémon card.
  /// - [imageUrl]: The URL of the card's small image.
  /// - [imageUrlHiRes]: The URL of the card's high-resolution image.
  const CardModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.imageUrlHiRes,
  });

  /// Creates a new instance of [CardModel] from a JSON object.
  ///
  /// This factory constructor parses the provided [json] map to extract the
  /// necessary fields and instantiate a [CardModel].
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   'id': 'xy7-54',
  ///   'name': 'Pikachu',
  ///   'images': {
  ///     'small': 'https://images.pokemontcg.io/xy7/54.png',
  ///     'large': 'https://images.pokemontcg.io/xy7/54_hires.png',
  ///   },
  /// };
  /// CardModel card = CardModel.fromJson(json);
  /// ```
  ///
  /// - [json]: A map containing key-value pairs corresponding to the card's
  ///   properties.
  ///
  /// Returns a [CardModel] instance with properties initialized from the JSON
  /// data.
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['images']['small'] as String,
      imageUrlHiRes: json['images']['large'] as String,
    );
  }
}
