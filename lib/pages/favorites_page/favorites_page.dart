import '../../infrastructure/di/locator.dart';
import '../../utils/ext/build_context_ext.dart';

import '../base/base_state.dart';
import '../common_view/loader.dart';
import '../common_view/sliver_app_bar.dart';

import 'favorites_page_cubit.dart';
import 'view/favorite_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late final FavoritesPageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = locator.get<FavoritesPageCubit>()..init();
  }

  void _onStateUpdate(BuildContext context, FavoritesPageState state) {
    if (state.error != null) {
      _cubit.resetError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<FavoritesPageCubit, FavoritesPageState>(
        listener: _onStateUpdate,
        builder: (context, state) {
          switch (state.status) {
            case PageStatus.loading:
              return const Loader();
            case PageStatus.loaded:
              return _buildLoadedState(state);
          }
        },
      ),
    );
  }

  Widget _buildLoadedState(FavoritesPageState state) {
    return Scaffold(
      backgroundColor: context.colorTheme.mainBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            title: context.strings.favoriteFacts,
            leading: true,
          ),
          _buildSections(state),
        ],
      ),
    );
  }

  Widget _buildSections(FavoritesPageState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return FavoriteSection(
            factText: state.favoriteFacts[index].text,
            createdAt: state.favoriteFacts[index].createdAt,
          );
        },
        childCount: state.favoriteFacts.length,
      ),
    );
  }
}
