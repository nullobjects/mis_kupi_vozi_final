import 'package:flutter/material.dart';
import 'models/auction_item.dart';
import 'screens/home_screen.dart';
import 'screens/auction_list_screen.dart';
import 'screens/cars_list_screen.dart';
import 'screens/car_details.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(AuctionApp());
}

class AuctionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

/*Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }*/

/*Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuctionListScreen(
        auctionItems: [
          AuctionItem(title: 'Car Auction 1', description: 'A great car to own', stars: 4, isFavorite: false, seller: "John"),
          AuctionItem(title: 'Car Auction 2', description: 'Reliable car for a good price', stars: 5, isFavorite: true, seller: "Sandra"),
          AuctionItem(title: 'Car Auction 3', description: 'Perfect family car', stars: 3, isFavorite: false, seller: "Finn"),
          AuctionItem(title: 'Car Auction 4', description: 'SUV for your needs', stars: 2, isFavorite: true, seller: "Noah"),
        ],
      ),
    );
  }*/

/*
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Auctions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarAuctionsScreen(),
    );
  }
 */

/*
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Auctions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarAuctionDetailScreen(),
    );
  }
 */

/*
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Auctions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactSellerScreen(),
    );
  }
 */