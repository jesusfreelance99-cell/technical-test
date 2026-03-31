import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/core/theme/main_theme_export.dart';

class CustomLoadingComponent extends StatelessWidget {
  final Color? color;
  const CustomLoadingComponent({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Center(
      child: platform == TargetPlatform.iOS
          ? CupertinoActivityIndicator(
              color: color ?? ColorPaletteTheme.primaryColor,
              radius: 12,
            )
          : SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: color ?? ColorPaletteTheme.primaryColor,
                strokeWidth: 2.5,
              ),
            ),
    );
  }
}
