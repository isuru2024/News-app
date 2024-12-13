import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';

import '../../../../../core/utils/functions/show_search.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Spacer(),
          CustomButton(
            icon: CupertinoIcons.search,
            onTap: () {
              showSearchBar(context);
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20.0,
        backgroundColor: Colors.grey[300],
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
