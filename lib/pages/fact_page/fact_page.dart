import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/di/locator.dart';
import '../../utils/ext/build_context_ext.dart';

import '../base/base_state.dart';
import '../common_view/loader.dart';
import '../common_view/sliver_app_bar.dart';

import 'fact_page_cubit.dart';
import 'view/custom_image_switcher.dart';

class FactPage extends StatefulWidget {
  const FactPage({super.key});

  @override
  State<FactPage> createState() => _FactPageState();
}

class _FactPageState extends State<FactPage> {
  late final FactPageCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = locator.get<FactPageCubit>()..init();
  }

  void _onStateUpdate(BuildContext context, FactPageState state) {
    if (state.error != null) {
      _cubit.resetError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<FactPageCubit, FactPageState>(
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

  Widget _buildLoadedState(FactPageState state) {
    return Scaffold(
      backgroundColor: context.colorTheme.mainBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: CustomImageSwitcher(
              imageUrl: state.imageCurrentUrl,
              onAnotherFactPressed: () async => _cubit.fetchNewFact(),
              onFavoritePressed: () async {
                await _cubit.addToFavorites();
              },
            ),
          ),
          _buildFactContent(state)
        ],
      ),
    );
  }

  Widget _buildFactContent(FactPageState state) {
    final fact = state.fact;
    if (fact == null) {
      return const SliverToBoxAdapter();
    }
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.formattedDate ?? context.strings.emptyString,
              style: context.textTheme.factDate,
            ),
            const SizedBox(height: 8),
            Text(
              fact.text,
              style: context.textTheme.fact,
            ),
          ],
        ),
      ),
    );
  }
}
