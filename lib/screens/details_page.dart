import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market/Home/Model/cubit.dart';
import 'package:fruit_market/Home/Model/states.dart';
import 'package:fruit_market/Screens/Cart/cubit.dart';

class DetailsWidget extends StatelessWidget {
  final String? itemId;
  final String? title;
  final String? image;
  final String? description;
  final String? price;

  const DetailsWidget(
      {Key? key,
      this.title,
      this.image,
      this.description,
      this.price,
      this.itemId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDate(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff769E49),
          title: Text("Details"),
        ),
        body: BlocConsumer<HomeCubit, HomeStates>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'product-$itemId',
                    child: Container(
                      height: MediaQuery.of(context).size.height/3.60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${title}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${description}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${price} JD/Kg'.tr(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<HomeCubit>().AddToCart(
                                  itemId: itemId,
                                  title: '${title}',
                                  image: '${image}',
                                  price: '${price}',
                                );
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Add to cart'.tr(),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff8FB763)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is HomeSuccessState) {
              var snackBar = SnackBar(
                content: Text(
                  "Product Added ${state.msgSuccess!}".tr(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is HomeErrorState) {
              //
              var snackBar = SnackBar(
                content: Text(
                  state.msgError!.tr(),
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              //
            }
          },
        ),
      ),
    );
  }
}
