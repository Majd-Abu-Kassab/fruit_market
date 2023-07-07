import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton(
              items: [
                DropdownMenuItem(child: Text('Option 1'), value: '1'),
                DropdownMenuItem(child: Text('Option 2'), value: '2'),
                DropdownMenuItem(child: Text('Option 3'), value: '3'),
              ],
              value: '1',
              onChanged: (value) {},
            ),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://via.placeholder.com/150',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Product Title',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '-10% Discount',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        '\$100.00',
                        style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '\150per/kg',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  alignment: Alignment.topRight,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.add),
                          ),
                          SizedBox(width: 8.0),
                          IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
