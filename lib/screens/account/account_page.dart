import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Icon> icons = const [
    Icon(Icons.shopping_bag_outlined),
    Icon(Icons.badge_outlined),
    Icon(Icons.location_on_outlined),
    Icon(Icons.credit_card_outlined),
    Icon(Icons.qr_code),
    Icon(Icons.notifications),
    Icon(Icons.help_outline_outlined),
    Icon(Icons.account_box_outlined),
  ];
  List<Text> texts = const [
    Text("Orders"),
    Text("My Details"),
    Text("Delivery Address"),
    Text("Payment Methods"),
    Text("Promo Code"),
    Text("Notifications"),
    Text("Help"),
    Text("About"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.fromLTRB(15, 40, 15, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png"),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${user['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Icon(
                              Icons.edit,
                              color: Colors.green,
                            )
                          ],
                        ),
                        Text("${user['email']}"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                shape: Border(
                  bottom: const BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.grey.shade300),
                ),
                leading: icons[index],
                iconColor: Colors.black,
                textColor: Colors.black,
                title: texts[index],
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              );
            }, childCount: texts.length),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 0.4,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
          backgroundColor: const Color(0xffF2F3F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, ("/loginPage"), (route) => false);
          },
          elevation: 0,
          icon: const Icon(
            Icons.exit_to_app_outlined,
            color: Colors.green,
          ),
          label: const Text(
            "Log Out",
            style: TextStyle(color: Colors.green),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
