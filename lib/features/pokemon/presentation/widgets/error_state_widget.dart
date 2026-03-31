import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:pokemonapp/features/pokemon/presentation/widgets/custom_buttons.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorStateWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            FluentIcons.warning_24_filled,
            size: 64,
            color: Colors.redAccent,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: textStyle.titleMedium?.copyWith(color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          CustomPrincipalButton(
            text: 'Volver a intentar',
            isLoading: false,
            colorButton: Colors.white.withValues(alpha: 0.1),
            colorText: Colors.white,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
