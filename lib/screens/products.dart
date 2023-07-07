import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Home/Model/cubit.dart';

import '../CustomWidgets/product_card.dart';
import '../Home/Model/states.dart';
import 'details_page.dart';

class Vegs extends StatefulWidget {
  const Vegs({Key? key}) : super(key: key);

  @override
  State<Vegs> createState() => _VegsState();
}

class _VegsState extends State<Vegs> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDate(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: BlocConsumer<HomeCubit, HomeStates>(
            builder: (context, state) {
              print(EasyLocalization.of(context)!.currentLocale.toString()=='en_US');
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Organic Vegetables'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                    itemId:context.read<HomeCubit>().OvData[index].itemId,
                                    title: EasyLocalization.of(context)?.currentLocale.toString() == "en_US"
                                        ? context.read<HomeCubit>().OvData[index].title
                                        : context.read<HomeCubit>().OvData[index].titleAR,
                                    image: context.read<HomeCubit>().OvData[index].image,
                                     price: context.read<HomeCubit>().OvData[index].price,
                                    description:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OvData[index].description: context.read<HomeCubit>().OvData[index].descriptionAr),
                                   // context.read<HomeCubit>().OvData[index].description,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().OvData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OvData[index].title: context.read<HomeCubit>().OvData[index].titleAR,
                            image: context.read<HomeCubit>().OvData[index].image,
                            price: context.read<HomeCubit>().OvData[index].price,
                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().OvData.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Organic Vegetables pack'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Text('20% off',style: TextStyle(fontSize: 16,color: Color(0xff4ca300)),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                  itemId:context.read<HomeCubit>().OvPackData[index].itemId,
                                  title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OvPackData[index].title: context.read<HomeCubit>().OvPackData[index].titleAR,
                                  image: context.read<HomeCubit>().OvPackData[index].image,
                                  price: context.read<HomeCubit>().OvPackData[index].price!,
                                  description: EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OvPackData[index].description: context.read<HomeCubit>().OvPackData[index].descriptionAr,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().OvPackData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OvPackData[index].title: context.read<HomeCubit>().OvPackData[index].titleAR,
                            image: context.read<HomeCubit>().OvPackData[index].image,
                            price: context.read<HomeCubit>().OvPackData[index].price!,
                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().OvPackData.length,
                    ),
                  ),
                ],
              );
            },
            listener: (context, state) {

            },
          ),
        ),
      ),
    );
  }

}

class Fruits extends StatefulWidget {
  const Fruits({Key? key}) : super(key: key);

  @override
  State<Fruits> createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDate(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: BlocConsumer<HomeCubit, HomeStates>(
            builder: (context, state) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Organic Fruits'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                  itemId:context.read<HomeCubit>().OfData[index].itemId,
                                  title: EasyLocalization.of(context)?.currentLocale.toString() == "en_US"
                                      ? context.read<HomeCubit>().OfData[index].title
                                      : context.read<HomeCubit>().OfData[index].titleAR,
                                  image: context.read<HomeCubit>().OfData[index].image,
                                  price: context.read<HomeCubit>().OfData[index].price,
                                  description: EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OfData[index].description: context.read<HomeCubit>().OfData[index].descriptionAr,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().OfData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OfData[index].title: context.read<HomeCubit>().OfData[index].titleAR,
                            image: context.read<HomeCubit>().OfData[index].image,
                            price: context.read<HomeCubit>().OfData[index].price,
                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().OfData.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Organic fruits pack'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Text('20% off',style: TextStyle(fontSize: 16,color: Color(0xff4ca300)),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                  itemId:context.read<HomeCubit>().OfPackData[index].itemId,
                                  title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OfPackData[index].title: context.read<HomeCubit>().OfPackData[index].titleAR,
                                  image: context.read<HomeCubit>().OfPackData[index].image,
                                  price: context.read<HomeCubit>().OfPackData[index].price,
                                  description: EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OfPackData[index].description: context.read<HomeCubit>().OfPackData[index].descriptionAr,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().OfPackData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().OfPackData[index].title: context.read<HomeCubit>().OfPackData[index].titleAR,
                            image:
                            context.read<HomeCubit>().OfPackData[index].image,
                            price:
                            context.read<HomeCubit>().OfPackData[index].price,

                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().OfPackData.length,
                    ),
                  ),
                ],
              );
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }

}

class DryF extends StatefulWidget {
  const DryF({Key? key}) : super(key: key);

  @override
  State<DryF> createState() => _DryFState();
}

class _DryFState extends State<DryF> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDate(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: BlocConsumer<HomeCubit, HomeStates>(
            builder: (context, state) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Dry Fruits'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                  itemId:context.read<HomeCubit>().DfData[index].itemId,
                                  title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfData[index].title: context.read<HomeCubit>().DfData[index].titleAR,
                                  image: context.read<HomeCubit>().DfData[index].image,
                                  price: context.read<HomeCubit>().DfData[index].price,
                                  description: EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfData[index].description: context.read<HomeCubit>().DfData[index].descriptionAr,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().DfData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfData[index].title: context.read<HomeCubit>().DfData[index].titleAR,
                            image: context.read<HomeCubit>().DfData[index].image,
                            price: context.read<HomeCubit>().DfData[index].price,
                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().DfData.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Dry Fruits pack'.tr(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // Text('20% off',style: TextStyle(fontSize: 16,color: Color(0xff4ca300)),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (c, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              c,
                              MaterialPageRoute(
                                builder: (c) =>  DetailsWidget(
                                  itemId:context.read<HomeCubit>().DfPackData[index].itemId,
                                  title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfPackData[index].title: context.read<HomeCubit>().DfPackData[index].titleAR,
                                  image: context.read<HomeCubit>().DfPackData[index].image,
                                  price: context.read<HomeCubit>().DfPackData[index].price,
                                  description: EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfPackData[index].description: context.read<HomeCubit>().DfPackData[index].descriptionAr,),
                              ),
                            );
                          },
                          child: ProductCard(
                            itemId:context.read<HomeCubit>().DfPackData[index].itemId,
                            title:EasyLocalization.of(context)?.currentLocale.toString()=="en_US"? context.read<HomeCubit>().DfPackData[index].title: context.read<HomeCubit>().DfPackData[index].titleAR,
                            image:
                            context.read<HomeCubit>().DfPackData[index].image,
                            price:
                            context.read<HomeCubit>().DfPackData[index].price,
                          ),
                        );
                      },
                      itemCount: context.read<HomeCubit>().DfPackData.length,
                    ),
                  ),
                ],
              );
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }

}
