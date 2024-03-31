# About

기존의 팍스스쿨 앱을 Flutter 로 변환 하기 위해 진행 하는 프로젝트 입니다. <br>

단순히 Flutter를 배우는게 목적이 아닌, 실제 사용할 수 있는 회사 내에서 사용할 수 있게 MVVM <br> 
Architecture 까지 적용 하였습니다.

Bloc , Cubit을 이용한 상태관리 패턴을 적용하였으며, DI 는 getIt을 사용 하였습니다. 


# Architecture
이 앱은 **MVVM** 구조로 개발되어 있으며, **View**는 Screen에서 담당하고 있으며, <br>
**ViewModel**은 **Factory** 와 **bloc**으로 나누어져 있습니다.<br>
**Factory**는 Screen 과의 이벤트 처리 , **bloc**은 API 와의 이벤트 처리를 담당학고 있습니다.<br>
**Controller**가 **Factory**와 **bloc** 사이에서 중개인 역활을 수행합니다.<br>
**Model**은 **Data Class**에서 담당하며 Freezed를 사용하여 구성 하였습니다. 

    Factory 패키지는 Controller 에서 Screen 으로 이벤트를 발행 할 때 사용합니다. 
    Controller는 Screen 에서 Action을 했을 때, 이에 대한 처리를 하고, Cubit으로 이벤트를 발행하여 <br>
    Screen 에서 UI를 갱신하게 합니다. 

    Bloc 패키지는 API 진행에 관련된 처리 이벤트를 Controller에 발행 할 때 사용합니다.
