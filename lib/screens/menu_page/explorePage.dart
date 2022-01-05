import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // ?Control text input
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
// ?Control menu
  bool flag = false;
  String title = "Find Product";
  double childRatio = 2.8 / 3;
  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          flag ? appbar() : sliverappbar(),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return flag ? itemMenu(menuIndex, index) : allMenus(index);
              },
              childCount: flag
                  ? products[products.keys.toList()[menuIndex]].length
                  : products.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: childRatio,
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.green,
      //   unselectedItemColor: Colors.black,
      //   items: [
      //     const BottomNavigationBarItem(
      //       label: "Shop",
      //       icon: Icon(
      //         Icons.home_outlined,
      //       ),
      //     ),
      //     BottomNavigationBarItem(
      //       label: "Explore",
      //       icon: IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.manage_search_outlined),
      //       ),
      //     ),
      //     const BottomNavigationBarItem(
      //       label: "Cart",
      //       icon: Icon(Icons.shopping_cart_outlined),
      //     ),
      //     const BottomNavigationBarItem(
      //       label: "Favorite",
      //       icon: Icon(Icons.favorite_border_outlined),
      //     ),
      //     const BottomNavigationBarItem(
      //       label: "Account",
      //       icon: Icon(Icons.person_outline_outlined),
      //     ),
      //   ],
      // ),
    );
  }

  appbar() {
    return SliverAppBar(
      title: Text(title),
      pinned: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      leading: IconButton(
        onPressed: () {
          setState(() {
            flag = false;
            title = "Find Product";
            childRatio = 2.8 / 3;
          });
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  sliverappbar() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.2,
      backgroundColor: Colors.white,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          ),
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
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Form(
              key: _formKey,
              child: TextFormField(
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (value) {
                  List types = products.keys.toList();
                  for (var element in types) {
                    for (var i = 0; i < products[element].length; i++) {
                      print(products[element].length);
                      if (products[element][i]['name'] ==
                          _nameController.text.toString()) {
                        Navigator.pushNamed(context, "/searchPage",
                            arguments: {"item": products[element][i]});
                      }
                    }
                    _nameController.clear();
                  }
                },
                controller: _nameController,
                decoration: InputDecoration(
                  label: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search Store",
                  hintStyle: const TextStyle(color: Colors.black),
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
    );
  }

  itemMenu(int itemIndex, index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
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
            flex: 8,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/aboutPage", arguments: {
                  "item": products[products.keys.toList()[itemIndex]][index]
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "${products[products.keys.toList()[itemIndex]][index]['pic']}"),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${products[products.keys.toList()[itemIndex]][index]['name']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${products[products.keys.toList()[itemIndex]][index]['size']}",
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
                  "\$${products[products.keys.toList()[itemIndex]][index]['price']}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      cart_addings.add(
                          products[products.keys.toList()[itemIndex]][index]);
                    });
                    itemNumbers.add(1);
                    sumOf.add(
                      double.parse(
                        products[products.keys.toList()[itemIndex]][index]
                            ['price'],
                      ),
                    );
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.1,
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
    );
  }

  allMenus(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          flag = true;
          title = "${products.keys.toList()[index]}";
          childRatio = 2 / 3;
          menuIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: menu['backColor'][index],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: menu['lineColor'][index],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset("${menu['menu'][index]}"),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "${products.keys.toList()[index]}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
