import 'package:emtrade_test_apps/presentation/provider/part.dart';
import 'package:emtrade_test_apps/presentation/widget/item_card.dart';
import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: textResult != ""
            ? MediaQuery.sizeOf(context).height * 0.60
            : MediaQuery.sizeOf(context).height * 0.64,
        child: ListView.builder(
          itemCount: listCard.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return CardItem(item: listCard[index]);
          },
        ),
      ),
    );
  }
}
