import 'package:flutter/material.dart';
import 'package:mycard/model/JerseyModel.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<JerseyModel> JerseyList = [
    JerseyModel(
        jersey_count: 0,
        jersey_price: 0,
        init_price: 6,
        name: "Argentina",
        total_price: 0),
    JerseyModel(
        jersey_count: 0,
        jersey_price: 0,
        init_price: 5,
        name: "Bangladesh",
        total_price: 0),
    JerseyModel(
        jersey_count: 0,
        jersey_price: 0,
        init_price: 8,
        name: "Barcelona",
        total_price: 0),
  ];

  int total_price_jersey = 0;

  int total_price() {
    total_price_jersey = 0; // Reset total price to 0
    for (JerseyModel t in JerseyList) {
      total_price_jersey += t.jersey_price;
    }
    return total_price_jersey;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("My Bag", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: JerseyList.length,
                itemBuilder: (BuildContext context, int index) {
                  String name = JerseyList[index].name;
                  int jersey_count = JerseyList[index].jersey_count;
                  int jersey_price = JerseyList[index].jersey_price;

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: Card(
                      child: Container(
                        height: _height / 8,
                        width: _width,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 74, 168, 223),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: _height,
                              width: _width / 3,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage('assets/bd.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            Container(
                              height: _height,
                              width: _width / 2.5,
                              // color: const Color.fromARGB(255, 87, 68, 12),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${name}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text("Color: "),
                                        Text("Green",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Size: "),
                                        Text("L",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {});
                                              if (JerseyList[index]
                                                      .jersey_count >
                                                  0) {
                                                JerseyList[index]
                                                    .jersey_count--;
                                                print(JerseyList[index]
                                                    .jersey_count);

                                                JerseyList[index]
                                                        .jersey_price -=
                                                    JerseyList[index]
                                                        .init_price;
                                              }
                                            },
                                            icon: Icon(Icons.remove)),
                                        Text("${jersey_count}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {});

                                              JerseyList[index].jersey_count++;
                                              print(JerseyList[index]
                                                  .jersey_count);

                                              JerseyList[index].jersey_price +=
                                                  JerseyList[index].init_price;
                                            },
                                            icon: Icon(Icons.add)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // color: Color.fromARGB(255, 12, 87, 82),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.more_vert),
                                      Text(
                                          "${JerseyList[index].jersey_price}\$",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            height: _height / 8,
            width: _width,
            // color: const Color.fromARGB(255, 220, 181, 181),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total amount:"),
                        Text(
                          "${total_price().toString()}\$",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Congratulations!')),
                        );
                      },
                      child: Container(
                        height: _height / 15,
                        width: _width,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text("CHECK OUT",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
