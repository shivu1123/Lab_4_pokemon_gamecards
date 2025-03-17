// Import Flutter's material package for building UI components.
import 'package:flutter/material.dart';

// Import the cached_network_image package for efficient network image loading and caching.
import 'package:cached_network_image/cached_network_image.dart';

// Import the API service to fetch card data from the Pokémon TCG API.
import 'services/api_service.dart';

// Import the card model which defines the structure of a Pokémon card.
import 'models/card_model.dart';

/// The main function is the entry point of the Flutter application.
void main() {
  // runApp() takes the given Widget and makes it the root of the widget tree.
  runApp(PokemonTCGApp());
}

/// Root widget of the Pokémon TCG application.
class PokemonTCGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application title.
      title: 'Pokemon TCG',
      // Define the theme of the app using a primary swatch color.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // The home property defines the default route of the app, which is the CardListScreen.
      home: CardListScreen(),
    );
  }
}

/// A StatefulWidget that displays a list (grid) of Pokémon TCG cards.
class CardListScreen extends StatefulWidget {
  @override
  _CardListScreenState createState() => _CardListScreenState();
}

/// State class for CardListScreen.
class _CardListScreenState extends State<CardListScreen> {
  // A Future that will hold the list of CardModel objects fetched from the API.
  late Future<List<CardModel>> futureCards;

  @override
  void initState() {
    super.initState();
    // Initialize the futureCards by fetching data using the API service.
    // The fetched raw data is mapped to a list of CardModel objects using the fromJson factory.
    futureCards = ApiService().fetchCards().then((cards) =>
        cards.map((card) => CardModel.fromJson(card)).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar at the top of the screen with a title.
      appBar: AppBar(
        title: Text('Pokemon TCG Cards'),
      ),
      // Use FutureBuilder to handle asynchronous fetching and display of card data.
      body: FutureBuilder<List<CardModel>>(
        // The future that will complete with the list of cards.
        future: futureCards,
        builder: (context, snapshot) {
          // While the data is being fetched, show a loading indicator.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // If an error occurred during data fetching, display the error.
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // If the data is fetched but empty, display a message indicating no cards were found.
          else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No cards found'));
          }
          // Once data is successfully fetched, display it in a grid.
          else {
            return GridView.builder(
              // Define the grid layout using SliverGridDelegateWithFixedCrossAxisCount.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid.
                crossAxisSpacing: 4.0, // Horizontal spacing between items.
                mainAxisSpacing: 4.0, // Vertical spacing between items.
              ),
              // Total number of cards to display.
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // Retrieve the current card from the list.
                final card = snapshot.data![index];
                return GestureDetector(
                  // Define the tap behavior to navigate to the detail screen.
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Pass the selected card to the detail screen.
                        builder: (context) => CardDetailScreen(card: card),
                      ),
                    );
                  },
                  // Display the card image using CachedNetworkImage for improved performance.
                  child: CachedNetworkImage(
                    imageUrl: card.imageUrl, // URL for the card's thumbnail image.
                    // Show a loading spinner while the image loads.
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    // Show an error icon if the image fails to load.
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

/// A StatelessWidget that displays the full details of a selected Pokémon card.
class CardDetailScreen extends StatelessWidget {
  // The card data passed from the previous screen.
  final CardModel card;

  /// Constructor that requires a [CardModel] object.
  CardDetailScreen({required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar displaying the card's name.
      appBar: AppBar(
        title: Text(card.name),
      ),
      // Center the card details on the screen.
      body: Center(
        // Display the high-resolution image of the card.
        child: CachedNetworkImage(
          imageUrl: card.imageUrlHiRes, // URL for the high-resolution image.
          // Show a loading spinner while the image is loading.
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          // Show an error icon if the image fails to load.
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
