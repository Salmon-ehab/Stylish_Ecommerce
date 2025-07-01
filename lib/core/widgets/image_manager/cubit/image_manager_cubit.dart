import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_ecommerce/core/widgets/image_manager/cubit/image_manager_state.dart';

class ImageManagerCubit extends Cubit<ImageManagerState> {
  ImageManagerCubit() : super(ImageManagerInitState());

  static ImageManagerCubit get(context) => BlocProvider.of(context);

   void  getImage({ ImageSource source =ImageSource.gallery})async{
    final ImagePicker imagePicker =ImagePicker();
    XFile? image =await imagePicker.pickImage(source: source);
    if(image != null){
      emit(ImageManagerPickImage(image));
    }
  }
}
