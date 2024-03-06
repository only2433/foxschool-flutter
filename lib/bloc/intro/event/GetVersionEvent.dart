
import '../../base/BlocEvent.dart';

class GetVersionEvent extends BlocEvent
{
  final String deviceType;
  final String pushAddress;
  final String pushOn;

  GetVersionEvent({
    required this.deviceType,
    required this.pushAddress,
    required this.pushOn
  });

  @override
  List<Object> get props => [this.deviceType, this.pushAddress, this.pushOn];
}