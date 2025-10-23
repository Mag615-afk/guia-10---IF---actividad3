import 'package:flutter/material.dart';

class AssetThumb extends StatelessWidget {
  final String imageUrl;
  final double size;
  final VoidCallback? onTap;
  final bool circular;

  const AssetThumb({
    Key? key,
    required this.imageUrl,
    this.size = 80,
    this.onTap,
    this.circular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: circular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: circular ? null : BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }
}
