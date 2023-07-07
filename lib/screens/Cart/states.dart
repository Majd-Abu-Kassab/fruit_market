abstract class CartStates {}
class CartInitState extends CartStates{}

class CartLoadingState extends CartStates{}

class CartSuccessState extends CartStates{
  final String ? msgSuccess ;

  CartSuccessState({this.msgSuccess});

}

class CartErrorState extends CartStates{
  String ? msgError;
  CartErrorState({this.msgError});
}