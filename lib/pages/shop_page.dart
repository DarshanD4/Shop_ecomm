import 'package:ecom/components/shoe_tile.dart';
import 'package:ecom/models/shoe.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final List<Shoe> shoes;
  final void Function(Shoe) onAddToCart;

  const ShopPage({super.key, required this.shoes, required this.onAddToCart});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    widget.onAddToCart(shoe);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${shoe.name} added to cart'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search', style: TextStyle(color: Colors.grey)),
              Icon(Icons.search),
            ],
          ),
        ),

        // message
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Everyone flies.. some fly longer than others',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        // hot picks
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'HOT PICKS 🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'SEE ALL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // shoe list
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.shoes.length,
            itemBuilder: (context, index) {
              return ShoeTile(
                shoe: widget.shoes[index],
                onAdd: () => addShoeToCart(widget.shoes[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
