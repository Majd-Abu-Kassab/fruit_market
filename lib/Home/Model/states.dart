abstract class HomeStates{}

class HomeInitState extends HomeStates{

}

class HomeSuccessState extends HomeStates{
  final String ? msgSuccess ;

  HomeSuccessState({this.msgSuccess});

}
class HomeErrorState extends HomeStates{
  String ? msgError;
  HomeErrorState({this.msgError});
}