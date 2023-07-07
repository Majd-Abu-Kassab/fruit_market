import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String date;
  final Widget image;
  final Widget? icon;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    required this.date,
    required this.image,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      // border: Border.all(width: 2.0, color: Colors.grey),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: image,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 8.0),
                        Text(subtitle, style: Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 8.0),
                        Text(subtitle2, style: Theme.of(context).textTheme.caption),
                        SizedBox(height: 8.0),
                        Text(date, style: Theme.of(context).textTheme.caption),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: icon ?? Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
