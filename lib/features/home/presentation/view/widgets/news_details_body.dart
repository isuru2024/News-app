import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../data/models/models.dart';

class NewsDetailsBody extends StatelessWidget {
  const NewsDetailsBody({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(
                  AssetsManager.defaultAuthorImageUrl,
                ),
              ),
              (context.width * 0.02).spaceX,
              Text(
                newsModel.source!.name!,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              (context.width * 0.01).spaceX,
              const Icon(
                Icons.verified,
                color: CupertinoColors.systemPink,
                size: 20,
              ),
            ],
          ),
          (context.height * 0.04).spaceY,
          Text(
            newsModel.description!.replaceAll('. ', '.\n\n'),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          (context.height * 0.04).spaceY,
          Text(
            newsModel.content!.replaceAll('. ', '.\n\n'),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          (context.height * 0.04).spaceY,
        ],
      ),
    );
  }
}
