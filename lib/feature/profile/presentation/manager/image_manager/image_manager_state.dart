import 'package:image_picker/image_picker.dart';

abstract class ImageManagerState {}

class ImageManagerInitState extends ImageManagerState {}

class ImageManagerPickImage extends ImageManagerState {
  XFile image;
  ImageManagerPickImage(this.image);
}
