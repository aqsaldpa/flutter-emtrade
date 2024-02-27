import 'package:cached_network_image/cached_network_image.dart';
import 'package:emtrade_test_apps/common/theme.dart';
import 'package:emtrade_test_apps/data/model/card_models.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final CardData? item;
  const CardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sectionOne(context),
                item?.contentFormat != "video" ? imageCard() : videoCard()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row sectionOne(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              rowContentFormatCategory(),
              shortContent(context),
              publishedAt(context)
            ],
          ),
        )
      ],
    );
  }

  SizedBox publishedAt(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.5,
      child: Text(
        item?.publishedAt ?? "",
        overflow: TextOverflow.ellipsis,
        style:
            const TextStyle().copyWith(fontSize: 13, color: kColorBlackText1),
      ),
    );
  }

  Padding shortContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        child: Text(
          item?.shortContent ?? "",
          maxLines: 2,
          style: const TextStyle().copyWith(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Row rowContentFormatCategory() {
    return Row(
      children: [
        Text(item?.contentFormat ?? '-',
            style: const TextStyle()
                .copyWith(fontSize: 13, color: kColorBlackText1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            Icons.circle,
            size: 4,
            color: kColorBlackText1,
          ),
        ),
        Text(item?.category ?? "-",
            style: const TextStyle()
                .copyWith(fontSize: 13, color: kColorBlackText1)),
      ],
    );
  }

  Stack videoCard() {
    return Stack(
      children: [
        SizedBox(
          height: 88,
          width: 88,
          child: Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                side: BorderSide(color: Colors.black12)),
            color: Colors.white,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: item?.image ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/errorimage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          left: 28,
          top: 28,
          child: SizedBox(
            height: 35,
            width: 35,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox imageCard() {
    return SizedBox(
      height: 88,
      width: 88,
      child: Card(
        elevation: 2,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(color: Colors.black12)),
        color: Colors.white,
        child: Center(
          child: CachedNetworkImage(
            imageUrl: item?.image ?? "",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/errorimage.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
