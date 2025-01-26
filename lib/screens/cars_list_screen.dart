import 'package:flutter/material.dart';
import 'car_details.dart'; // Import the CarAuctionDetailScreen

class CarAuctionsScreen extends StatefulWidget {
  const CarAuctionsScreen({super.key});

  @override
  _CarAuctionsScreenState createState() => _CarAuctionsScreenState();
}

class _CarAuctionsScreenState extends State<CarAuctionsScreen> {
  Set<String> selectedCarMakes = {'All'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Cars'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            color: Colors.grey[200],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCarMakeButton('All'),
                  _buildCarMakeButton('Mercedes'),
                  _buildCarMakeButton('BMW'),
                  _buildCarMakeButton('Citroen'),
                  _buildCarMakeButton('Seat'),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.swap_vert),
                  label: const Text('Price'),
                ),
                IconButton(
                  icon: const Icon(Icons.view_list),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: 12, // Placeholder, replace with actual filtered list length
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to CarAuctionDetailScreen when the car item is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarAuctionDetailScreen(),
                      ),
                    );
                  },
                  child: _buildAuctionItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarMakeButton(String label) {
    final bool isSelected = selectedCarMakes.contains(label);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (label == 'All') {
              if (!isSelected) {
                selectedCarMakes.clear();
                selectedCarMakes.add('All');
              }
            } else {
              if (selectedCarMakes.contains('All')) {
                selectedCarMakes.remove('All');
              }
              if (isSelected) {
                selectedCarMakes.remove(label);
              } else {
                selectedCarMakes.add(label);
              }
            }
          });
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.blue,
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildAuctionItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[300],
              image: const DecorationImage(
                image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Ford_Fiesta_2008_front_20081206.jpg/1280px-Ford_Fiesta_2008_front_20081206.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        const Text(
          'Ford Fiesta 2008',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Text(
          'Updated 2 hours ago',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
