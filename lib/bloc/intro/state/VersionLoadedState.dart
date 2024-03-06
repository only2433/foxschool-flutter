import 'package:equatable/equatable.dart';
import 'package:foxschool/data/version_data_result/VersionDataResult.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base/BlocState.dart';


class VersionLoadedState extends BlocState{
  final VersionDataResult data;
  const VersionLoadedState({
    required this.data
  });
  @override
  List<Object> get props => [data];
}
