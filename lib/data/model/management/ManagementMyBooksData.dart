
import 'package:foxschool/enum/ManagementMyBooksStatus.dart';
import 'package:foxschool/enum/MyBooksColorType.dart';


class ManagementMyBooksData
{
  final ManagementMyBooksStatus status;
  final String id;
  final String name;
  MyBooksColorType colorType;
  ManagementMyBooksData({
    required this.status,
    required this.id,
    required this.name,
    required this.colorType
  });

  ManagementMyBooksData.withStatus(ManagementMyBooksStatus status): this(
    status: status,
    id: "",
    name: "",
    colorType: MyBooksColorType.RED
  );

  void setColorType(type)
  {
    colorType = type;
  }
}