
class MainObserver{
  static MainObserver? _instance;

  bool _isUpdate = false;

  MainObserver._internal();

  factory MainObserver(){
    _instance ??= MainObserver._internal();
    return _instance!;
  }

  void update()
  {
    _isUpdate = true;
  }

  void clear()
  {
    _isUpdate = false;
  }

  bool isUpdate()
  {
    return _isUpdate;
  }
}