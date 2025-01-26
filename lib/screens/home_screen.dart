import 'package:flutter/material.dart';
import '../widgets/auction_item_widget.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/category_buttons.dart';
import '../models/auction_item.dart';
import 'cars_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'everything';

  List<AuctionItem> auctionItems = [
    AuctionItem(title: 'Car Auction 1', description: 'A great car to own', stars: 4, isFavorite: false, seller: "John"),
    AuctionItem(title: 'Car Auction 2', description: 'Reliable car for a good price', stars: 5, isFavorite: true, seller: "Sandra"),
    AuctionItem(title: 'Car Auction 3', description: 'Perfect family car', stars: 3, isFavorite: false, seller: "Finn"),
    AuctionItem(title: 'Car Auction 4', description: 'SUV for your needs', stars: 2, isFavorite: true, seller: "Noah"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network('https://media.istockphoto.com/id/480652712/photo/dealer-new-cars-stock.jpg?s=612x612&w=0&k=20&c=Mzfb5oEeovQblEo160df-xFxfd6dGoLBkqjjDWQbd5E=', width: double.infinity, height: 350, fit: BoxFit.cover),
              Container(
                width: 500,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'KupiVozi',
                    style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: custom.SearchBar(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text('Top posts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text('Within 5km', style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
          ),
          CategoryButtons(
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: auctionItems.length,
              itemBuilder: (context, index) {
                return AuctionItemWidget(auctionItem: auctionItems[index], onFavoriteToggle: () {  },);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to CarAuctionsScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarAuctionsScreen()),
                );
              },
              child: Text('View All Cars'),
            ),
          ),
        ],
      ),
    );
  }
}
