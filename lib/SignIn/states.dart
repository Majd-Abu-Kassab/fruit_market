abstract class  SignInStates{}

class SignInInitState extends SignInStates{}

class SignInErrorState extends SignInStates{
  final String ? msgError ;

  SignInErrorState({this.msgError});

}
class SignInSuccessState extends SignInStates{
  final  String ? msgSuccess ;

  SignInSuccessState({this.msgSuccess});
}

class SignInLoadingState extends SignInStates{}