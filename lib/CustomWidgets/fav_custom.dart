import 'package:flutter/material.dart';

class CardWithImage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final String price;

  const CardWithImage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  _CardWithImageState createState() => _CardWithImageState();
}

class _CardWithImageState extends State<CardWithImage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.imagePath,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [

                      const SizedBox(width: 4),
                      Text(
                        widget.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _counter == 0
                            ? null
                            : () {
                          setState(() {
                            _counter--;
                          });
                        },
                        child: const Icon(Icons.remove),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(36, 36),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '$_counter',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        },
                        child: const Icon(Icons.add),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(36, 36),
                          padding: EdgeInsets.zero,
                        ),
                      ),

                      const Spacer(),

                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Add'),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffCC7D00),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
