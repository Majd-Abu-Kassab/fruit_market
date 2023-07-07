import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

class ProductCard extends StatelessWidget {
  final String ? itemId;
  final String ? title;
  final String ? price;
  final String ? image;
  final String ? des;
  const ProductCard({Key? key, this.title, this.price, this.image, this.des, this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 150,
        height: 150,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:BorderRadius.circular(10),
                  child: Image.network(image!,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Rate(
            //     iconSize: 25,
            //     color: Colors.yellow,
            //     allowHalf: true,
            //     allowClear: true,
            //     initialValue: 3.5,
            //     readOnly: false,
            //     // ignore: avoid_print
            //     onChange: (value) => print(value),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(price!.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ),
                Text('JD/Kg'.tr(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                // Padding(
                //   padding: const EdgeInsets.all(2.0),
                //   child:
                // )
              ],
            ),


          ],
        ),
      ),
    );;
  }
}
