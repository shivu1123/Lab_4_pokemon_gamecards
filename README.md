# Pokémon Cards App

#took help from friend to complete this project and used co-pilot to generate comments for explaining the code.  

## 📌 Overview
The **Pokémon Cards App** is a mobile application developed using **Flutter** that fetches and displays Pokémon Trading Card Game (TCG) cards from the **Pokémon TCG API**. Users can browse a list of cards, view their names and images, and tap on a card to enlarge it.

## ✨ Features
✅ Fetches Pokémon cards dynamically from the **Pokémon TCG API**
✅ Displays card names and images in a **scrollable ListView**
✅ Tap on a card to enlarge its image for a closer look
✅ **Smooth UI/UX** for seamless navigation
✅ **Cross-platform support** (Android & iOS)

## 🛠️ Technologies Used
- **Flutter** (Dart)
- **Pokémon TCG API**
- **Android Studio** / **VS Code** (for development)
- **Dart HTTP package** for API requests

## 📂 Project Structure
```
├── lib/
│   ├── main.dart                # Entry point of the application
│   ├── screens/
│   │   ├── home_screen.dart      # Main screen displaying the list of cards
│   │   ├── card_detail_screen.dart # Enlarged view of a selected card
│   ├── models/
│   │   ├── pokemon_card.dart     # Data model for Pokémon cards
│   ├── services/
│   │   ├── api_service.dart      # Handles API requests
│   ├── widgets/
│   │   ├── card_item.dart        # Reusable widget for displaying cards
│
├── assets/
│   ├── images/                   # Stores any local images if needed
│
├── pubspec.yaml                   # Dependency file
├── README.md                      # Documentation
```

## 🚀 Installation
### Prerequisites
Ensure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or VS Code with Flutter extension
- A connected physical device or an emulator

### Steps
1. **Clone the Repository**
   ```sh
   git clone https://github.com/your-username/pokemon-cards-app.git
   cd pokemon-cards-app
   ```

2. **Install Dependencies**
   ```sh
   flutter pub get
   ```

3. **Run the Application**
   ```sh
   flutter run
   ```

## 🔗 API Integration
The app fetches Pokémon card data from the **Pokémon TCG API**.
- API Documentation: [Pokémon TCG API](https://pokemontcg.io/)
- Example API Request:
  ```sh
  https://api.pokemontcg.io/v2/cards
  ```

## 📸 Screenshots
_Add screenshots of the app here if available._

## 🤝 Contribution Guidelines
We welcome contributions! Follow these steps to contribute:
1. **Fork** this repository.
2. **Create a feature branch** (`feature-branch-name`).
3. **Make your changes** and commit with a meaningful message.
4. **Push to your branch** and create a **Pull Request**.

## 📝 License
This project is licensed under the **MIT License**. See the `LICENSE` file for details.

---
Developed with ❤️ using Flutter. Happy coding! 🚀
