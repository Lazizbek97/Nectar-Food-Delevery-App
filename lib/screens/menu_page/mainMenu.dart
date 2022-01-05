import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';
import 'package:grocceries/screens/account/account_page.dart';
import 'package:grocceries/screens/cart_page/cartPage.dart';
import 'package:grocceries/screens/favorite_page/favoritePage.dart';
import 'package:grocceries/screens/menu_page/explorePage.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentElement = 0;
  List<Widget> pages = const <Widget>[
    HomePageone(),
    ExplorePage(),
    CartPage(),
    FavoritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentElement],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: "Shop",
            icon: Icon(
              Icons.home_outlined,
            ),
          ),
          BottomNavigationBarItem(
            label: "Explore",
            icon: Icon(Icons.manage_search_outlined),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite_border_outlined),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.person_outline_outlined),
          ),
        ],
        selectedLabelStyle: const TextStyle(color: Colors.green),
        selectedIconTheme: const IconThemeData(color: Colors.green),
        currentIndex: currentElement,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentElement = index;
    });
    // if (currentElement == 0) {
    // } else if (currentElement == 1) {
    //   Navigator.pushNamed(context, "/explorePage");
    // } else if (currentElement == 2) {
    //   Navigator.pushNamed(context, "/explorePage");
    // } else if (currentElement == 3) {
    //   Navigator.pushNamed(context, "/explorePage");
    // } else if (currentElement == 4) {
    //   Navigator.pushNamed(context, "/explorePage");
    // }
  }
}

class HomePageone extends StatefulWidget {
  const HomePageone({Key? key}) : super(key: key);

  @override
  _HomePageoneState createState() => _HomePageoneState();
}

class _HomePageoneState extends State<HomePageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/redcarrot.png",
                    height: 30,
                    width: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 20,
                      ),
                      Text(
                        "${user['locationZone']}, ${user['locationArea']}",
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.1,
              title: Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.all(5),
                child: Center(
                  child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: "Search Store",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/banner.png"),
                ),
              ),
            ),
          ),
          // !  Eclusive Offer
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Exclusive Offer",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: exclusiveOffer.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/aboutPage",
                        arguments: {
                          "item": exclusiveOffer[index],
                        },
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "${exclusiveOffer[index]['pic']}"),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${exclusiveOffer[index]['name']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${exclusiveOffer[index]['size']}",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${exclusiveOffer[index]['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart_addings.add(exclusiveOffer[index]);
                                    });
                                    itemNumbers.add(1);
                                    sumOf.add(
                                      double.parse(
                                        exclusiveOffer[index]['price'],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image.asset(
                                      "assets/images/plusButton.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // ! Best Selling
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Best Selling",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: bestSelling.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      "/aboutPage",
                      arguments: {
                        "item": bestSelling[index],
                      },
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "${bestSelling[index]['pic']}"),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${bestSelling[index]['name']}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${bestSelling[index]['size']}",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${bestSelling[index]['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart_addings.add(exclusiveOffer[index]);
                                    });
                                    itemNumbers.add(1);
                                    sumOf.add(
                                      double.parse(
                                        exclusiveOffer[index]['price'],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image.asset(
                                      "assets/images/plusButton.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // ! Groceries
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Groceries",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: groceries['names'].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    decoration: BoxDecoration(
                      color: groceries['color'][index],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: Image.asset(
                            "${groceries['pic'][index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "${groceries['names'][index]}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          //  ! Meats
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Meats",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: products['Meat & Fish'].length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/aboutPage",
                        arguments: {
                          "item": products['Meat & Fish'][index],
                        },
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      "${products['Meat & Fish'][index]['pic']}"),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${products['Meat & Fish'][index]['name']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${products['Meat & Fish'][index]['size']}",
                                  style: TextStyle(color: Colors.grey.shade400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${products['Meat & Fish'][index]['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart_addings
                                          .add(products['Meat & Fish'][index]);
                                    });
                                    itemNumbers.add(1);
                                    sumOf.add(
                                      double.parse(
                                        products['Meat & Fish'][index]['price'],
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: Image.asset(
                                      "assets/images/plusButton.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
