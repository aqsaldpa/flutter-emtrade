import 'package:emtrade_test_apps/presentation/provider/part.dart';
import 'package:flutter/material.dart';

class TextResult extends StatelessWidget {
  const TextResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: textResult != '',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Text(
              "Hasil Pencarian",
              style: TextStyle().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(width: 10),
            Text(
              "'$textResult'",
              style: TextStyle().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
