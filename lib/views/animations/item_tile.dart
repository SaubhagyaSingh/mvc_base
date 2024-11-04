import 'package:flutter/cupertino.dart';

class ItemTile extends StatefulWidget {
  final String title;
  final String subText;
  final String img;
  final String price;

  const ItemTile({
    super.key,
    required this.title,
    required this.subText,
    required this.img,
    required this.price,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Image on the left
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          const SizedBox(width: 10),

          // Title and subtitle in the center
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.subText,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Price on the far right
          Text(
            widget.price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.systemBlue,
            ),
          ),
        ],
      ),
    );
  }
}
