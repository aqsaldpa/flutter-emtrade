// ignore_for_file: prefer_const_constructors

part of 'part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<GetHomeProvider>().getListCard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarHome(),
            const Divider(thickness: 1, color: Colors.black12),
            searchBar(),
            TextResult(),
            Consumer<GetHomeProvider>(
              builder: (context, value, child) {
                switch (cardResponse.status) {
                  case ViewState.loading:
                    return const HomeListLoading();
                  case ViewState.error:
                    return Text(cardResponse.message ?? "Error");
                  case ViewState.completed:
                    return listCard.isEmpty
                        ? EmptyDataSearch()
                        : ListViewCard();
                  default:
                    return const Text("No Data");
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBarHome(),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: kColorTextField,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            prefixIcon: Icon(Icons.search, color: kColorBlue),
            hintStyle: const TextStyle(color: Colors.black38),
            hintText: "Cari topik yang kamu mau disini."),
        onChanged: (val) {
          setState(() {
            listCard = listCardFilter
                .where(
                  (u) => (u.shortContent!.toLowerCase().contains(
                        val.toLowerCase(),
                      )),
                )
                .toList();
            textResult = val;
          });
        },
      ),
    );
  }

  BottomNavigationBar bottomNavigationBarHome() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(color: kColorYellow),
      unselectedLabelStyle: const TextStyle(color: Colors.grey),
      showUnselectedLabels: true,
      items: listBottomNavBar,
      currentIndex: _selectedIndex,
      selectedItemColor: kColorYellow,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
