import 'package:flutter/material.dart';

import '../../utils/ext/build_context_ext.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CircularProgressIndicator(
          color: context.colorTheme.majorAccent,
        ),
      ),
    );
  }
}
