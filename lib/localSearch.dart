import 'package:flutter/material.dart';

class Item {
  final String name;
  final int price;
  final String id;
  int quantity;
  bool add;
  final String imageUrl;

  Item({
    @required this.name,
    @required this.add,
    @required this.imageUrl,
    @required this.quantity,
    @required this.price,
    @required this.id,
  });
}

class LocalSearch extends StatefulWidget {
  @override
  _LocalSearchState createState() => _LocalSearchState();
}

class _LocalSearchState extends State<LocalSearch> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    List<Item> searchList =
        ITEM_LIST.where((element) => element.name.contains(text)).toList();
    Widget _widget(String searchText) {
      return RaisedButton(
        elevation: 2,
        color: Colors.green,
        child: Text(searchText),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.green,
          elevation: 0,
          bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: controller,
                        onFieldSubmitted: (covariant) {
                          setState(() {
                            text = covariant;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                            hintText: "Search 1100+ Products",
                            hintStyle: TextStyle(fontSize: 15)),
                      )),
                ),
                Container(
                  height: 50,
                  color: Colors.white.withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _widget("Tea"),
                      _widget("water"),
                      _widget("Thums Up"),
                      _widget("H")
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 3),
                    child: Text(
                      "Seach for: $text",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
            preferredSize: Size(3, 120),
          ),
          centerTitle: true,
          title: Text(
            "Search Product",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return CartScreen();
                }));
              },
              icon: Icon(
                Icons.shopping_cart,
                size: 18,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic_none,
                size: 18,
              ),
            )
          ],
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 170,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          searchList[index].imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              searchList[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          stars[index].toString(),
                                          style: TextStyle(
                                              color: Colors.orangeAccent),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                Text(
                                  "  ${rating[index]} Ratings",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "MRP: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Rs ${(searchList[index].price + (searchList[index].price * 0.4)).toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Rs ${searchList[index].price.toString()}",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                            searchList[index].quantity == 0
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FlatButton(
                                      color: Colors.red,
                                      child: Text(
                                        "ADD",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          searchList[index].add = true;
                                          searchList[index].quantity++;
                                        });
                                      },
                                    ),
                                  )
                                : Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove_shopping_cart,
                                          color: Colors.red.withOpacity(0.7),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            searchList[index].quantity--;
                                          });
                                        },
                                      ),
                                      Text(
                                        searchList[index].quantity.toString(),
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            searchList[index].quantity++;
                                          });
                                        },
                                      )
                                    ],
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                )
              ],
            );
          },
          itemCount: searchList.length,
        ));
  }
}

String text = "a";
// ignore: non_constant_identifier_names
List<Item> ITEM_LIST = [
  Item(
      name: "Red Label",
      price: 52,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/266575_15-red-label-tea.jpg"),
  Item(
      name: "Taj Mahal Tea",
      price: 600,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1204491_1-taj-mahal-tea.jpg"),
  Item(
      name: "TATA Tea Gold",
      price: 577,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1204531_1-tata-tea-gold-leaf-tea.jpg"),
  Item(
      name: "Bourn Vita",
      price: 204,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/l/1203452_1-bournvita-pro-health-chocolate-drink-500-gm-pro-health-chocolate-cookies-120-gm.jpg"),
  Item(
      name: "Horlicks",
      price: 105,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/119387_10-horlicks-health-nutrition-drink-classic-malt.jpg"),
  Item(
      name: "NESCAFE",
      price: 540,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1204494_1-nescafe-coffee-classic.jpg"),
  Item(
      name: "Bourn Vita & Oreo",
      price: 234,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/l/1203452_1-bournvita-pro-health-chocolate-drink-500-gm-pro-health-chocolate-cookies-120-gm.jpg"),
  Item(
      name: "Thums Up",
      price: 38,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/288927_6-thums-up-soft-drink.jpg"),
  Item(
      name: "Sunrise Tea",
      price: 350,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/241695_11-nescafe-sunrise-instant-coffee-chicory-mixture.jpg"),
  Item(
      name: "Nescafe Coffee",
      price: 540,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/40154924_2-nescafe-gold-coffee-powder-rich-smooth.jpg"),
  Item(
      name: "Complan",
      price: 487,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/40071210_3-complan-nutrition-health-drink-royale-chocolate.jpg"),
  Item(
      name: "Sofit",
      price: 242,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1202891_1-sofit-soya-milk-chocolate.jpg"),
  Item(
      name: "Amul Lassi",
      price: 20,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1209732_1-amul-mango-lassi.jpg"),
  Item(
      name: "Tonic Water",
      price: 20,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/30009568_6-schweppes-indian-tonic-water.jpg"),
  Item(
      name: "Raw Coconut water",
      price: 45,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/1208638_2-raw-pressery-coconut-water-100-natural.jpg"),
  Item(
      name: "Horlicks",
      price: 111,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/119401_13-horlicks-junior-health-nutrition-drink-original-flavour-stage-2-4-6-years.jpg"),
  Item(
      name: "Pulpy Orange",
      price: 62,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/265722_11-minute-maid-fruit-drink-pulpy-orange.jpg"),
  Item(
      name: "Krack Jack",
      price: 30,
      id: "BEVERAGE",
      quantity: 0,
      add: true,
      imageUrl:
          "https://www.bigbasket.com/media/uploads/p/s/302093_5-parle-krack-jack.jpg"),
];

var stars = [
  5.0,
  4.1,
  2.5,
  4.8,
  3.0,
  2.9,
  3.8,
  4.2,
  2.9,
  3.8,
  4.2,
  2.9,
  3.8,
  4.2,
  2.9,
  3.8,
  4.2,
  2.9,
  3.8,
  4.1
];
List<int> rating = [
  6466,
  5111,
  4543,
  11,
  451,
  547,
  4121,
  234,
  1577,
  2355,
  5111,
  4543,
  11,
  451,
  547,
  4121,
  234,
  1577,
  2355,
  556
];

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Item> buyingItems =
        ITEM_LIST.where((element) => element.quantity > 0).toList();
    int price = 0;
    for (int i = 0; i < buyingItems.length; i++) {
      price = buyingItems[i].price * buyingItems[i].quantity + price;
    }
    print(price);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text(
              "Review Basket",
            ),
            actions: <Widget>[
              Icon(Icons.search),
              Icon(Icons.bubble_chart),
            ],
            bottom: PreferredSize(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black87.withOpacity(0.7),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rs ${price.toString()}",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Saved Rs ${(price * 0.2).roundToDouble().toString()}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width - 160,
                    top: 7,
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.redAccent,
                      ),
                      child: Center(
                        child: Text(
                          "CHECKOUT",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              preferredSize: Size(0, 55),
            )),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 150,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          buyingItems[index].imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              buyingItems[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          stars[index].toString(),
                                          style: TextStyle(
                                              color: Colors.orangeAccent),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                                Text(
                                  "  ${rating[index]} Ratings",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "MRP: ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Rs ${(buyingItems[index].price + (buyingItems[index].price * 0.4)).toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 13,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 180,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Rs ${buyingItems[index].price.toString()}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                  buyingItems[index].quantity == 0
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FlatButton(
                                            color: Colors.red,
                                            child: Text(
                                              "ADD",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                buyingItems[index].add = true;
                                                buyingItems[index].quantity++;
                                              });
                                            },
                                          ),
                                        )
                                      : Row(
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove_shopping_cart,
                                                color:
                                                    Colors.red.withOpacity(0.7),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  buyingItems[index].quantity--;
                                                });
                                              },
                                            ),
                                            Text(
                                              buyingItems[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                color: Colors.green,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  buyingItems[index].quantity++;
                                                });
                                              },
                                            )
                                          ],
                                        )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                )
              ],
            );
          },
          itemCount: buyingItems.length,
        ));
  }
}
