import 'package:flutter/material.dart';

import '../models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //CircleAvatar is often used to display a profile image or user’s avatar in a circular shape
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(post.profileImageUrl),
            ),
            //Adds 16-pixel padding between the two widgets
            const SizedBox(
              width: 16,
            ),
            //Expanded widget makes the child occupy all available space
            Expanded(
              child: Column(
                //Column widget vertically stacks children. MainAxisSize.min aligns them to occupy minimum space. CrossAxisAlignment.start horizontally aligns the child widgets to the left side
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                //Display two Text widgets, the post contents followed by the post’s timestamp.
                children: [
                  Text(
                    post.comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    '${post.timestamp} mins ago',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
