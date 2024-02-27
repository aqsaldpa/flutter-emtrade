import 'package:emtrade_test_apps/common/theme.dart';
import 'package:emtrade_test_apps/presentation/provider/part.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatefulWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _AppBarHomeState();
}

class _AppBarHomeState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.white,
      title: const Text(
        "Education",
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),
      ),
      actions: [
        filter(context),
      ],
    );
  }

  InkWell filter(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, setStateSB) {
                  return Container(
                      height: 320,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filter",
                                  style: const TextStyle().copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setStateSB((() {
                                      selectedCategory.clear();
                                      Navigator.pop(context);
                                      setState(() {});
                                    }));
                                  },
                                  child: Text(
                                    "Reset",
                                    style: const TextStyle().copyWith(
                                        fontSize: 14,
                                        color: kColorYellow,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Divider(thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Category",
                                style: const TextStyle().copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Wrap(
                              children: _buildChoiceList(setStateSB),
                            ),
                            const Divider(thickness: 1),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                      ),
                                      child: Text(
                                        "Batal",
                                        style: const TextStyle()
                                            .copyWith(color: kColorYellow),
                                      )),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          backgroundColor: kColorYellow2),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text(
                                        "Simpan",
                                        style: const TextStyle()
                                            .copyWith(color: kColorYellow),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));
                },
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: selectedCategory.isEmpty
            ? Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(
                    Icons.tune,
                    color: kPrimaryColor,
                  ),
                  const SizedBox(width: 5),
                  Text("Filter",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                  const SizedBox(width: 10),
                ],
              )
            : Card(
                elevation: 0,
                color: kColorGreen,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Badge(
                      smallSize: 11,
                      backgroundColor: kPrimaryColor,
                      child: Icon(
                        Icons.tune,
                        color: kPrimaryColor,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text("Filter",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 17)),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
      ),
    );
  }

  _buildChoiceList(void Function(void Function()) func) {
    List<Widget> choices = [];
    for (var item in listCategory) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(16)),
          backgroundColor: Colors.white,
          selectedColor: kColorYellow,
          label: Text(
            item,
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          selected: selectedCategory.contains(item),
          onSelected: (selected) {
            func((() {
              selectedCategory.contains(item)
                  ? selectedCategory.remove(item)
                  : selectedCategory.add(item);
            }));
          },
        ),
      ));
    }
    return choices;
  }
}
