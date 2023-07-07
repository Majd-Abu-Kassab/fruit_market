abstract class SignUpStates {}
class SignUpInitState extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{
  final String ? msgSuccess ;

  SignUpSuccessState({this.msgSuccess});

}

class SignUpErrorState extends SignUpStates{
  String ? msgError;
  SignUpErrorState({this.msgError});
}
class SignUpPickDateState extends SignUpStates{}