# About

기존의 팍스스쿨 앱을 Flutter 로 변환 하기 위해 진행 하는 프로젝트 입니다. <br>

단순히 Flutter를 배우는게 목적이 아닌, 실제 사용할 수 있는 회사 내에서 사용할 수 있게 MVVM <br> 
Architecture 까지 적용 하였습니다.

RiverPod를 이용한 상태관리 패턴을 적용하였으며, DI 는 getIt을 사용 하였습니다. 


# Architecture
이 앱은 **MVVM** 구조로 개발되어 있으며, **View**는 Screen에서 담당하고 있으며, <br>
**RiverPod**를 사용하여 개발 진행 되었습니다.<br>

**ViewModel**은 **UI Notifier** 와 **API Notifier**으로 나누어져 있습니다.<br>
**UI Notifier**는 Screen 과의 이벤트 처리 , **API Notifier**은 API 와의 이벤트 처리를 담당학고 있습니다.<br>
**Controller**가 **UI Notifier**와 **API Notifier** 사이에서 중개인 역활을 수행합니다.<br>
**Model**은 **Data Class**에서 담당하며 Freezed를 사용하여 구성 하였습니다. 

    Factory 패키지는 Controller 에서 Screen 으로 이벤트를 발행 할 때 사용합니다. 
    Controller는 Screen 에서 Action을 했을 때, 이에 대한 처리를 하고, Cubit으로 이벤트를 발행하여 
    Screen 에서 UI를 갱신하게 합니다. 

    Bloc 패키지는 API 진행에 관련된 처리 이벤트를 Controller에 발행 할 때 사용합니다.
    API 통신은 Retrofit 라이브러리를 사용 하였으며, Controller 는 이에 대한 상황을 Stream 으로 계속 감시를 하고 있으며,
    BlocState 에 따라 처리를 달리 합니다. 

    이러한 구조를 통해 View 와 비즈니스 로직을 분리하고, 코드의 재사용성과 유지보수성을 높일 수 있습니다.
    
~~~ mermaid
flowchart LR
    subgraph View
    A(Screen)
    end
    subgraph ViewModel
    B(Controller)
    C(Bloc)
    D(Factory)
    end

        A(Screen)-- Action --> B(Controller)
        B(Controller)-- Server Request --> C(API Notifier)
        C(API Notifier)-- Get Data --> E(Service)
        E(Service) -. Response .-> C(API Notifier)
        C(API Notifier) -. Watch .-> B(Controller)
        B(Controller)-- UI Update --> D(Factory)
        D(Factory) -. UI Notifier .-> A(Screen)
~~~

# TEST
    테스트 학교 : 리틀팍스 초등학교
    테스트 아이디 : Test5
    비밀번호 : 1234

# Feature
본 프로젝트는 상용화된 제품으로 모든 코드를 공개할 수 없습니다.<br>
그러나, 로그인 과정부터 메인 화면까지의 처리 과정을 간략히 보여드립니다.<br>
이 부분은 프로젝트의 전체적인 흐름을 이해하는 데 도움이 될 수 있습니다.
