import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../resources/lottie_assets.dart';
import '../../../utils/ext/build_context_ext.dart';

import 'custom_icon_button.dart';

class CustomImageSwitcher extends StatefulWidget {
  final VoidCallback onAnotherFactPressed;
  final VoidCallback onFavoritePressed;
  final String? imageUrl;

  const CustomImageSwitcher({
    required this.onAnotherFactPressed,
    required this.onFavoritePressed,
    required this.imageUrl,
    super.key,
  });

  @override
  State<CustomImageSwitcher> createState() => _CustomImageSwitcherState();
}

class _CustomImageSwitcherState extends State<CustomImageSwitcher> {
  bool _isLoading = true;

  Future<void> _onAnotherFactPressed() async {
    setState(() => _isLoading = true);
    widget.onAnotherFactPressed();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSwitcher(),
          _buildButtonsSection(),
        ],
      ),
    );
  }

  Widget _buildSwitcher() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      switchOutCurve: Curves.easeOutBack,
      switchInCurve: Curves.easeInCubic,
      child: _isLoading ? _buildLottie() : _buildNetworkImage(),
    );
  }

  Widget _buildLottie() {
    return Lottie.asset(
      LottieAssets.cat,
      height: 400,
      width: 400,
    );
  }

  Widget _buildNetworkImage() {
    final url = widget.imageUrl;
    if (url == null) {
      return _buildLottie();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: widget.imageUrl!,
        height: 400,
        width: 400,
        fit: BoxFit.cover,
        errorWidget: (context, err, _) => _buildLottie(),
      ),
    );
  }

  Widget _buildButtonsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      color: context.colorTheme.mainBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAnotherFact(),
          _buildFavorite(),
        ],
      ),
    );
  }

  Widget _buildAnotherFact() {
    return TextButton(
      onPressed: _onAnotherFactPressed,
      style: context.buttonTheme.common,
      child: Text(
        context.strings.anotherFact,
        style: context.textTheme.getCatFact,
      ),
    );
  }

  Widget _buildFavorite() {
    return CustomLottieIconButton(
      onPressed: widget.onFavoritePressed,
    );
  }
}
