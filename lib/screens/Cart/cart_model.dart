class CartModel {
  String? itemId;
  String? title;
  String? price;
  String? image;
  DateTime ? date;
  int? qty;
  String? uid;

  CartModel({this.itemId, this.title, this.price, this.image, this.qty, this.uid,this.date});
  CartModel.fromJson(Map<String, dynamic> json,String id) {
    itemId= id;
    title= json['title'];
    date=json['orderDate'];
    price= json['price'];
    image= json['image'];
    qty= json['qty'];
    uid= json['uid'];
  }
  dynamic toJson() => {
    'title': title,
    'price': price,
    'image': image,
    'orderDate':DateTime.now(),
    'qty':qty,
    'uid':uid
  };

}

