# Currency Converter App

Welcome to the Currency Converter App! This app allows you to convert currencies, view historical data, and explore a list of supported currencies with their respective country flags.

## Features

- **List of Supported Currencies**: Explore a list of supported currencies along with their country flags. The data is stored locally in a database after the first API request and loaded from it for future usage.
- **Historical Data**: View historical data for two currencies of your choosing for the last 7 days.
- **Currency Converter**: Easily convert between two currencies by selecting them and entering the amount to convert.

## API and Resources

- **API**: This app uses the [Currency Converter API](https://free.currencyconverterapi.com/) for currency conversion and historical data.
- **Country Flags Icons**: Country flags are fetched from [FlagCDN](https://flagcdn.com/).

## Getting Started

To get started with the Currency Converter App, follow these steps:

1. Navigate to the project directory.
2. Run `flutter pub get` to fetch the dependencies.
3. Ensure you have a `.env` file in the root directory with your API key (if required).
4. Run the app using `flutter run`.

## Architecture

- **Models**: Represent the data structures used in the app.
- **Repositories**: Handle data operations, such as fetching data from APIs or local databases. Repositories abstract the data layer from the rest of the app.
- **BLoCs (Business Logic Components)**: Manage the app's state and business logic. BLoCs observe changes in the data layer (repositories) and expose streams of state changes to the UI layer.
- **Screens**: Represent the UI layer of the app. Screens interact with ViewModels and display data to the user.
- **Network**: Contains network-related utilities and services, such as API clients and request/response models.

## Image Loader Library

The app uses the `cached_network_image` library for image loading. This library provides caching functionality, which helps improve performance by reducing network requests and enhancing user experience. It's chosen for its ease of use and efficiency in loading images from URLs.

## Database

The app utilizes the `shared_preferences` package for local data storage. `shared_preferences` is a lightweight and simple key-value pair storage solution that's suitable for storing small amounts of data, such as user preferences or cached API responses.

## Testing

Unit tests are written for API integration and business logic implementation using the `flutter_test` and `mockito` packages. These tests ensure the reliability and correctness of the app's functionality.

## Dependency Injection

The app implements dependency injection using the `injectable` package. Dependency injection helps manage dependencies and improves code maintainability by decoupling classes from their dependencies. It also facilitates testing by allowing easy swapping of implementations.

## UI Implementation

The UI is built using Google's Material Design components, following the Flutter framework's guidelines for a clean and intuitive user experience.

## Libraries and Dependencies

- Flutter
- cupertino_icons
- http
- shared_preferences
- flutter_bloc
- bloc
- intl
- test
- injectable
- cached_network_image
- build_runner
- flutter_dotenv
- dio
- rxdart
- mockito
- equatable
- auto_route
- injectable_generator
- json_serializable
- flutter_lints
- auto_route_generator
