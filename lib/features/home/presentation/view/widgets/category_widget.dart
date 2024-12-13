import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.15,
      height: context.height * 0.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: CupertinoColors.systemPink,
      ),
      child: const Center(
        child: Text(
          'News',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
