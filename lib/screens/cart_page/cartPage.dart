import 'package:flutter/material.dart';
import 'package:grocceries/data/data.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("My Cart"),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            "${cart_addings[index]['pic']}",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${cart_addings[index]['name']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "${cart_addings[index]['size']}",
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.5),
                                  ),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: () {
                                      itemNumbers[index] > 1
                                          ? setState(() {
                                              itemNumbers[index] -= 1;
                                              sumOf[index] =
                                                  itemNumbers[index] *
                                                      double.parse(
                                                          cart_addings[index]
                                                              ['price']);
                                            })
                                          : null;
                                    },
                                    icon: Icon(Icons.remove,
                                        color: Colors.grey.shade400),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    "${itemNumbers[index]}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.5),
                                  ),
                                  child: IconButton(
                                    iconSize: 20,
                                    onPressed: () {
                                      setState(() {
                                        itemNumbers[index] += 1;
                                        sumOf[index] = itemNumbers[index] *
                                            double.parse(
                                                cart_addings[index]['price']);
                                      });
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                cart_addings.removeAt(index);
                                sumOf.removeAt(index);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 30,
                              ),
                            ),
                            Text(
                              "\$${(double.parse(cart_addings[index]['price']) * itemNumbers[index]).toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: cart_addings.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 1.2,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          extendedPadding: const EdgeInsets.all(30),
          onPressed: () {
            bottomSheet();
          },
          label: Text("Go to Checkout"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xff737373),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Checkout",
                      style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Select Method",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Payment",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.credit_card_rounded,
                          size: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Promo Code",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Pick Discount",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Cost",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${sumOf.isNotEmpty ? sumOf.reduce((a, b) => a + b).toStringAsFixed(2) : 0}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(),
                const Text(
                    "by placing an order you agree to our Terms and Conditions"),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    extendedPadding: EdgeInsets.all(30),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/acceptPayment");
                    },
                    label: const Text("Order Now"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
