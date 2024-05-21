
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/SeriesEnableInformationViewState.dart';

class SeriesEnableInformationViewCubit extends Cubit<SeriesEnableInformationViewState>
{
  SeriesEnableInformationViewCubit() : super(SeriesEnableInformationViewState(isEnable: false));


  void showInformationIconView()
  {
    emit(SeriesEnableInformationViewState(isEnable: true));
  }

}