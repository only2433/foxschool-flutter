# About

기존의 팍스스쿨 앱을 Flutter 로 변환 하기 위해 진행 하는 프로젝트 입니다. <br>
단순히 Flutter를 배우는게 목적이 아닌, 실제 사용할 수 있는 회사 내에서 사용할 수 있게 MVVM <br> 
Architecture 까지 적용 하였습니다.
RiverPod를 이용한 상태관리 패턴을 적용하였으며, DI 는 getIt을 사용 하였습니다. 
<br><br>

## 🏗️ Architecture Overview
### Development Pattern
- ***Pattern***: Model-View-Intent (**MVI**)
- ***State Managerment***:  **Riverpod** 
<br><br>

## 🏗️ Package Structure
### 1. Data Package
- Manages data received from API or used by controllers
- Contains data models and DTOs<br>
### 2. Domain Package
- Handles API communication functionality
- Implements **Retrofit** for repository implementation
- Contains business logic interfaces<br>
### 3. Presentation Package
#### `controller` Package Components
1. **UIState**
   - Holds data used in UI Screen
   - Represents the current screen state
   - Drives UI rendering and updates
   
2. **APIState**
   - Holds data received from server responses
   - Represents the current API data state
   
3. **UINotifier**
   - Notifies UI of state changes
   - Acts as a mechanism to modify the current UI state
   - When state changes, UI automatically updates
   
4. **APINotifier**
   - Handles API requests and responses
   - Updates APIState with data from server
   - Transfers APIState to FactoryController
   
5. **FactoryController**
   - Acts as ViewModel
   - Continuously listens to APIState changes
   - Processes incoming APIState events
   - Updates UIState based on APIState changes
   - Orchestrates data flow between API and UI
   - Manages data transformations
<br><br>

## 🚀 Key Features
- **Reactive Programming**: Utilizing MVI architectural pattern
- **Unidirectional Data Flow**: State → UI → Controller → API
- **Clean Architecture**: Separation of Data, Domain, and Presentation layers
<br><br>

## 🔍 Technical Highlights
- Immutable state management with Riverpod
- Reactive UI updates
- Separation of concerns
- Type-safe API communication with Retrofit
<br><br>

## 🔀 Flow
~~~ mermaid
flowchart LR
    subgraph UI/Screen
    A[UI Screen]
    end
    
    subgraph Controller Package
    B[FactoryController]
    C[UINotifier]
    D[APINotifier]
    E[UIState]
    F[APIState]
    end
    
    subgraph Domain
    G[Repository]
    end
    
    subgraph Server
    H[API]
    end
    
    A -->|User Action| B
    A -.->|Watch for changes| E
    B -->|Update| C
    B -->|Request| D
    B -.->|Listen for changes| F
    C -->|Modify| E
    D -->|Update| F
    D -->|Call| G
    G -->|Request| H
    H -->|Response| G
    G -->|Return Data| D
~~~


## 🔀 Sequence
~~~ mermaid
sequenceDiagram
    participant Screen as UI Screen
    participant UINotifier as UINotifier
    participant Controller as FactoryController
    participant APINotifier as APINotifier
    participant Repository as Repository
    participant Server as Server
    
    Note over Controller: Continuously listens to APIState
    
    Screen ->> Controller: User Action
    Controller ->> APINotifier: Request Data
    APINotifier ->> Repository: Call API
    Repository ->> Server: HTTP Request
    Server -->> Repository: HTTP Response
    Repository -->> APINotifier: Return Data
    APINotifier -->> APINotifier: Update APIState
    
    Note right of APINotifier: APIState changes
    Note right of Controller: Detects APIState change
    
    Controller ->> Controller: Process APIState event
    Controller ->> UINotifier: Update UI based on APIState
    UINotifier -->> UINotifier: Update UIState
    UINotifier -->> Screen: Notify State Change
    Screen ->> Screen: UI Re-rendering
    
    alt Error Occurs
        Repository -->> APINotifier: Error Response
        APINotifier -->> APINotifier: Update APIState with error
        Note right of Controller: Detects APIState error
        Controller ->> UINotifier: Error State Update
        UINotifier -->> Screen: Display Error
    end
~~~

# TEST
    테스트 학교 : 리틀팍스 초등학교
    테스트 아이디 : Test5
    비밀번호 : 1234

# Feature
본 프로젝트는 상용화된 제품으로 모든 코드를 공개할 수 없습니다.<br>
이 부분은 프로젝트의 전체적인 흐름을 이해하는 데 도움이 될 수 있습니다.
