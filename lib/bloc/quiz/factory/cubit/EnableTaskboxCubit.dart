
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/EnableTaskboxState.dart';

class EnableTaskboxCubit extends Cubit<EnableTaskboxState>
{
  EnableTaskboxCubit(): super(EnableTaskboxState(isEnable: false));

  void setEnable(bool isEnable)
  {
    emit(EnableTaskboxState(isEnable: isEnable));
  }

}