import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/extensions.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/router.dart';
import '../../../data/models/models.dart';

class RecNewsItem extends StatelessWidget {
  const RecNewsItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        AppRouter.newsDetailsScreenRoute,
        extra: newsModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            height: context.height * 0.15,
            child: Row(
              children: [
                Container(
                  width: context.width * 0.35,
                  height: context.height * 0.15,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: newsModel.urlToImage!,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Image.asset(
                      AssetsManager.newsImagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => Image.asset(
                      AssetsManager.newsImagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                (context.width * 0.04).spaceX,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'News',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        newsModel.title!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                              AssetsManager.defaultAuthorImageUrl,
                            ),
                          ),
                          (context.width * 0.015).spaceX,
                          Text(
                            newsModel.source!.name!,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          (context.width * 0.015).spaceX,
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 3.0,
                          ),
                          (context.width * 0.015).spaceX,
                          Text(
                            DateFormat.yM()
                                .format(DateTime.parse(newsModel.publishedAt!)),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
