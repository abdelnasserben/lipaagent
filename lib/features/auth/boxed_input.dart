import 'package:flutter/material.dart';
import '../../core/theme/app_tokens.dart';

class BoxedInput extends StatelessWidget {
  const BoxedInput({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Container(
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.md),
      border: Border.all(color: AppColors.borderHi),
    ),
    child: child,
  );
}
