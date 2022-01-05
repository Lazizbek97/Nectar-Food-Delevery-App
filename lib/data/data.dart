import 'package:flutter/material.dart';

Map user = {
  "locationZone": "",
  "locationArea": "",
  "name": "",
  "email": "",
  "password": "",
};
Map products = {
  "Fresh Fruits & Vegetables": {
    0: {
      "name": "Organic Bananas",
      "size": "6pcs, Price",
      "price": "4.99",
      "pic": "assets/images/fruits/banana.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Red Apple",
      "size": "1kg, Price",
      "price": "4.50",
      "pic": "assets/images/fruits/apple.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Bell Pepper Red",
      "size": "1kg, Price",
      "price": "3.99",
      "pic": "assets/images/fruits/pepper.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Watermelon",
      "size": "1pcs, Price",
      "price": "5.99",
      "pic": "assets/images/fruits/watermelon.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Stawberries",
      "size": "1kg, Price",
      "price": "7.99",
      "pic": "assets/images/fruits/stawberry.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Oranges",
      "size": "1kg, Price",
      "price": "8.99",
      "pic": "assets/images/fruits/orange.png",
      "type": "",
      "likes": false,
    },
    6: {
      "name": "Lemons",
      "size": "1kg, Price",
      "price": "6.99",
      "pic": "assets/images/fruits/lemon.png",
      "type": "",
      "likes": false,
    },
    7: {
      "name": "Tomatoes",
      "size": "1kg, Price",
      "price": "3.99",
      "pic": "assets/images/fruits/tomato.png",
      "type": "",
      "likes": false,
    },
    8: {
      "name": "Lettuce",
      "size": "1pcs, Price",
      "price": "1.99",
      "pic": "assets/images/fruits/letuce.png",
      "type": "",
      "likes": false,
    },
    9: {
      "name": "Onions",
      "size": "1kg, Price",
      "price": "2.99",
      "pic": "assets/images/fruits/onion.png",
      "type": "",
      "likes": false,
    },
    10: {
      "name": "Potatoes",
      "size": "1kg, Price",
      "price": "3.99",
      "pic": "assets/images/fruits/potato.png",
      "type": "",
      "likes": false,
    },
    11: {
      "name": "Carrots",
      "size": "1kg, Price",
      "price": "4.99",
      "pic": "assets/images/fruits/carrot.png",
      "type": "",
      "likes": false,
    },
  },
  "Cooking Oil & Ghee": {
    0: {
      "name": "Olive Oil",
      "size": "1l, Price",
      "price": "5.99",
      "pic": "assets/images/oils/oil.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Canola Oil",
      "size": "1l, Price",
      "price": "16.50",
      "pic": "assets/images/oils/canolaoil.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Avocado Oil",
      "size": "2l, Price",
      "price": "15.99",
      "pic": "assets/images/oils/avocadooil.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Pumpkin Seeds Oil",
      "size": "1l, Price",
      "price": "5.99",
      "pic": "assets/images/oils/pumpkinoil.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Sesame Oil",
      "size": "1l, Price",
      "price": "7.99",
      "pic": "assets/images/oils/seasameoil.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Almond Oil",
      "size": "1l, Price",
      "price": "14.99",
      "pic": "assets/images/oils/almondoil.png",
      "type": "",
      "likes": false,
    },
  },
  "Meat & Fish": {
    0: {
      "name": "Beef",
      "size": "1kg, Price",
      "price": "7.99",
      "pic": "assets/images/meats/beef.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Lamb meat",
      "size": "1kg, Price",
      "price": "6.50",
      "pic": "assets/images/meats/lamb.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Chicken",
      "size": "2kg, Price",
      "price": "3.99",
      "pic": "assets/images/meats/checken.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Salmon",
      "size": "1kg, Price",
      "price": "11.99",
      "pic": "assets/images/meats/salmon.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Tuna",
      "size": "1kg, Price",
      "price": "12.99",
      "pic": "assets/images/meats/tuna.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Mussel",
      "size": "100gr, Price",
      "price": "4.99",
      "pic": "assets/images/meats/mussel.png",
      "type": "",
      "likes": false,
    },
    6: {
      "name": "King Prawns",
      "size": "1kg, Price",
      "price": "4.99",
      "pic": "assets/images/meats/king.png",
      "type": "",
      "likes": false,
    },
  },
  "Bakery & Snacks": {
    0: {
      "name": "Biscuits",
      "size": "2pc, Price",
      "price": "1.99",
      "pic": "assets/images/bakery/biscuit.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Pie",
      "size": "1pc, Price",
      "price": "6.50",
      "pic": "assets/images/bakery/pie.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Bread",
      "size": "1pc, Price",
      "price": "1.99",
      "pic": "assets/images/bakery/bread.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Cake",
      "size": "1pc, Price",
      "price": "15.99",
      "pic": "assets/images/bakery/cake.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Cookie",
      "size": "1pc, Price",
      "price": "1.9",
      "pic": "assets/images/bakery/cookie.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Cheesecake",
      "size": "1pc, Price",
      "price": "3.8",
      "pic": "assets/images/bakery/cheesecake.png",
      "type": "",
      "likes": false,
    },
    6: {
      "name": "Blueberry muffin",
      "size": "1pc, Price",
      "price": "4.8",
      "pic": "assets/images/bakery/muffin.png",
      "type": "",
      "likes": false,
    },
    7: {
      "name": "Croissant",
      "size": "1pc, Price",
      "price": "3.5",
      "pic": "assets/images/bakery/croissant.png",
      "type": "",
      "likes": false,
    },
  },
  "Dairy & Eggs": {
    0: {
      "name": "Cheese",
      "size": "1kg, Price",
      "price": "3.99",
      "pic": "assets/images/dairy/cheese.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Yoghurt",
      "size": "100gr, Price",
      "price": "2.50",
      "pic": "assets/images/dairy/yogurt.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Eggs",
      "size": "4pcs, Price",
      "price": "1.99",
      "pic": "assets/images/dairy/eggs.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Butter",
      "size": "300gr, Price",
      "price": "3.99",
      "pic": "assets/images/dairy/butter.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Milk",
      "size": "1l, Price",
      "price": "2.99",
      "pic": "assets/images/dairy/milk.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Almond milk",
      "size": "1l, Price",
      "price": "4.99",
      "pic": "assets/images/dairy/almondmilk.png",
      "type": "",
      "likes": false,
    },
  },
  "Beverages": {
    0: {
      "name": "Diet Coke",
      "size": "355ml, Price",
      "price": "1.99",
      "pic": "assets/images/beverages/dietcoke.png",
      "type": "",
      "likes": false,
    },
    1: {
      "name": "Sprite Can",
      "size": "325ml, Price",
      "price": "1.50",
      "pic": "assets/images/beverages/sprite.png",
      "type": "",
      "likes": false,
    },
    2: {
      "name": "Apple & Grape Juice",
      "size": "2l, Price",
      "price": "15.99",
      "pic": "assets/images/beverages/applejuice.png",
      "type": "",
      "likes": false,
    },
    3: {
      "name": "Orange Juice",
      "size": "2l, Price",
      "price": "15.99",
      "pic": "assets/images/beverages/orangejuice.png",
      "type": "",
      "likes": false,
    },
    4: {
      "name": "Coca Cola Can",
      "size": "325ml, Price",
      "price": "4.99",
      "pic": "assets/images/beverages/coke.png",
      "type": "",
      "likes": false,
    },
    5: {
      "name": "Pepse Can",
      "size": "330ml, Price",
      "price": "4.99",
      "pic": "assets/images/beverages/pepsi.png",
      "type": "",
      "likes": false,
    },
  },
};
Map menu = {
  "menu": [
    "assets/images/menu/fruits.png",
    "assets/images/menu/oil.png",
    "assets/images/menu/meat.png",
    "assets/images/menu/bakery.png",
    "assets/images/menu/dairy.png",
    "assets/images/menu/beverage.png",
  ],
  "backColor": const [
    Color(0xffEEF7F1),
    Color(0xffFEF6ED),
    Color(0xffFDE8E4),
    Color(0xffF4EBF7),
    Color(0xffFFF8E5),
    Color(0xffEDF7FC),
  ],
  "lineColor": const [
    Color(0xffEDF7FC),
    Color(0xffFABD7C),
    Color(0xffF7A593),
    Color(0xffD3B0E0),
    Color(0xffFDE598),
    Color(0xffB7DFF5),
  ],
};
List<Map> cart_addings = [];
List<int> itemNumbers = [];
List<Map> likedItems = [];
List sumOf = [];
Map groceries = {
  "names": ["Seeds", "Rice"],
  "pic": ["assets/images/pulses.png", "assets/images/rice.png"],
  "color": const <Color>[Color(0xffFEF1E4), Color(0xffE5F3EA)]
};
Map exclusiveOffer = {
  0: {
    "name": "Organic Bananas",
    "size": "6pcs, Price",
    "price": "4.99",
    "pic": "assets/images/fruits/banana.png",
    "type": "",
    "likes": false,
  },
  1: {
    "name": "Red Apple",
    "size": "1kg, Price",
    "price": "4.50",
    "pic": "assets/images/fruits/apple.png",
    "type": "",
    "likes": false,
  },
  2: {
    "name": "Salmon",
    "size": "1kg, Price",
    "price": "11.99",
    "pic": "assets/images/meats/salmon.png",
    "type": "",
    "likes": false,
  },
  3: {
    "name": "Eggs",
    "size": "4pcs, Price",
    "price": "1.99",
    "pic": "assets/images/dairy/eggs.png",
    "type": "",
    "likes": false,
  },
};
Map bestSelling = {
  0: {
    "name": "Milk",
    "size": "1l, Price",
    "price": "2.99",
    "pic": "assets/images/dairy/milk.png",
    "type": "",
    "likes": false,
  },
  1: {
    "name": "Coca Cola Can",
    "size": "325ml, Price",
    "price": "4.99",
    "pic": "assets/images/beverages/coke.png",
    "type": "",
    "likes": false,
  },
  2: {
    "name": "Bread",
    "size": "1pc, Price",
    "price": "1.99",
    "pic": "assets/images/bakery/bread.png",
    "type": "",
    "likes": false,
  },
  3: {
    "name": "Croissant",
    "size": "1pc, Price",
    "price": "3.5",
    "pic": "assets/images/bakery/croissant.png",
    "type": "",
    "likes": false,
  },
  4: {
    "name": "Stawberries",
    "size": "1kg, Price",
    "price": "7.99",
    "pic": "assets/images/fruits/stawberry.png",
    "type": "",
    "likes": false,
  },
  5: {
    "name": "Oranges",
    "size": "1kg, Price",
    "price": "8.99",
    "pic": "assets/images/fruits/orange.png",
    "type": "",
    "likes": false,
  },
};
// Map meats = {};
