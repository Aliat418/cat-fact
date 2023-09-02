import 'package:flutter/material.dart';

import '../../../utils/ext/build_context_ext.dart';

class FavoriteSection extends StatelessWidget {
  final String factText;
  final String createdAt;

  const FavoriteSection({
    required this.factText,
    required this.createdAt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            createdAt,
            style: context.textTheme.favoriteFactDate,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Text(
            factText,
            style: context.textTheme.favoriteFact,
          )),
        ],
      ),
    );
  }
}
