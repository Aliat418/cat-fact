import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/lottie_assets.dart';

class CustomLottieIconButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CustomLottieIconButton({
    required this.onPressed,
    super.key,
  });

  @override
  State<CustomLottieIconButton> createState() => _CustomLottieIconButtonState();
}

class _CustomLottieIconButtonState extends State<CustomLottieIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _lottieController;
  bool _isPressed = false;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() => _isAnimating = true);
      _lottieController.reverse();
      Timer(const Duration(microseconds: 200), () {
        setState(() {
          _isPressed = false;
          _isAnimating = false;
        });
      });
    }
  }

  void _onTap() {
    setState(() => _isPressed = !_isPressed);
    if (_isPressed && !_isAnimating) {
      _lottieController
        ..forward()
        ..addStatusListener(_handleAnimationStatus);
    }
    widget.onPressed();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: SizedBox(
        height: 48,
        width: 48,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isPressed
              ? _buildLottie()
              : const Icon(
                  Icons.favorite_rounded,
                  size: 24,
                ),
        ),
      ),
    );
  }

  Widget _buildLottie() {
    return Lottie.asset(
      LottieAssets.heart,
      key: ValueKey<bool>(_isPressed),
      controller: _lottieController,
      repeat: false,
    );
  }
}
