
import 'package:image/image.dart' as img;

class ExamplePictureData
{
  final int index;
  final img.Image image;
  bool isAnswer;
  ExamplePictureData({required index, required this.image, this.isAnswer = false})
      : index = index + 1;

  void setAnswer(bool isAnswer)
  {
    this.isAnswer = isAnswer;
  }
}

