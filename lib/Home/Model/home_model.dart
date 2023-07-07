class HomeModel{
  String ? title;
  String ? titleAR;
  String ? descriptionAr;
  String ? price;
  String ? image;
  String ? description;
  String ? itemId;


  HomeModel({
    this.title,
    this.price,
    this.image,
    this.description,
    this.titleAR,
    this.descriptionAr,
    this.itemId,
  });

  HomeModel.fromJson(Map<String,dynamic>json,String id){
    title=json['title'];
    price=json['price'];
    image=json['image'];
    description=json['description'];
    titleAR = json['titleAr'];
    descriptionAr=json['descriptionAR'];
    itemId=id;


  }
}