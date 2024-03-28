
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/EnableInformationIconViewState.dart';

class EnableInformationIconViewCubit extends Cubit<EnableInformationIconViewState>
{
  EnableInformationIconViewCubit() : super(EnableInformationIconViewState(isEnable: false));


  void showInformationIconView()
  {
    emit(EnableInformationIconViewState(isEnable: true));
  }

}