import 'package:flutter/material.dart';

class EmptyDataSearch extends StatelessWidget {
  const EmptyDataSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/empty_data.png"),
          const SizedBox(height: 10),
          Text(
            "Hasil Tidak Ditemukan",
            style: const TextStyle()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            "Harap periksa kembali pencarian kamu.",
            style: const TextStyle()
                .copyWith(fontWeight: FontWeight.normal, fontSize: 16),
          )
        ],
      ),
    );
  }
}
