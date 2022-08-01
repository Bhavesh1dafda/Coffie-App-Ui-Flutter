import 'package:coffie_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/coffee_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffe type
  final List coffeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Milk Coffee',
      false,
    ],
    [
      'Black Coffee',
      false,
    ]
  ];

  //user tapped on coffetype
  void CoffeeTypeSelected(int index) {
    for (int i = 0; i < coffeType.length; i++) {
      coffeType[i][1] = false;
    }

    setState(() {
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[980],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          //find the best coffie for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find The Best Coffee For You',
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 10),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find Your Coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          //horizental list
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeType.length,
              itemBuilder: (BuildContext context, int index) {
                return CoffeeType(
                  coffeeType: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    CoffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          //horizontal listview of coffe tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                  coffeImagePath: 'lib/images/capcino.jpg',
                  coffiName: 'Cappucino',
                  coffePrice: '6.80'),
              CoffeeTile(
                  coffeImagePath: 'lib/images/latte.jpg',
                  coffiName: 'Latte',
                  coffePrice: '4.50'),
              CoffeeTile(
                  coffeImagePath: 'lib/images/milk.jpg',
                  coffiName: 'Milk Coffee',
                  coffePrice: '8.50'),
            ],
          )),
        ],
      ),
    );
  }
}
