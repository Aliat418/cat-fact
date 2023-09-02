import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/routing/router.gr.dart';
import '../../utils/ext/build_context_ext.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String? title;
  final bool leading;

  const CustomSliverAppBar({
    super.key,
    this.title,
    this.leading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: context.colorTheme.majorAccent,
      expandedHeight: 56,
      floating: true,
      leading: leading ? _buildLeadingButton(context) : null,
      title: Text(
        title ?? context.strings.catDailyInfo,
        style: context.textTheme.appBarTitle,
      ),
      actions: [
        if (!leading) _buildActionButton(context),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.push(const FavoritesRoute()),
      style: context.buttonTheme.common,
      icon: const Icon(Icons.history),
    );
  }

  Widget _buildLeadingButton(BuildContext context) {
    return IconButton(
      onPressed: () => context.router.pop(),
      style: context.buttonTheme.common,
      icon: const Icon(Icons.chevron_left_rounded),
    );
  }
}
