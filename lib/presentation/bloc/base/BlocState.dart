
abstract class BlocState
{
  const BlocState();
}

class InitState extends BlocState {
}

class LoadingState extends BlocState {

}

class ErrorState extends BlocState{
  final String message;

  const ErrorState({
    required this.message
  });
}

class SearchListLoadingState extends BlocState
{

}

class AuthenticationErrorState extends BlocState
{
  final bool isAutoRestart;
  final String message;
  const AuthenticationErrorState({
    required this.isAutoRestart,
    required this.message
  });
}

