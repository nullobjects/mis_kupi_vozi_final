import 'package:flutter/material.dart';
import '../models/auction_item.dart';

class AuctionItemWidget extends StatelessWidget {
  final AuctionItem auctionItem;
  final VoidCallback onFavoriteToggle;

  const AuctionItemWidget({
    super.key,
    required this.auctionItem,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://autotraderau-res.cloudinary.com/image/upload/e_trim:10,f_auto/c_scale,t_cg_base,w_345/glasses/BhDMEpES.jpg",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auctionItem.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  auctionItem.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stars
              Row(
                children: List.generate(
                  5,
                      (index) => Icon(
                    index < auctionItem.stars
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  ),
                ),
              ),
              SizedBox(width: 5),

              IconButton(
                onPressed: onFavoriteToggle,
                icon: Icon(
                  auctionItem.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
