
import 'package:equatable/equatable.dart';

import '../../core/utils/status.dart';

class AddProductState extends Equatable {
  final status addProductStatus;
  final String errorMessage;
  final String? thumbnail;
  final List<String>? images;

  const AddProductState({ this.addProductStatus = status.init,  this.errorMessage ='',  this.thumbnail,  this.images = const []});

  AddProductState copyWith({status? addProductStatus,String? errorMessage,String? thumbnail,List<String>? images}){
    return AddProductState(
      addProductStatus: addProductStatus ?? this.addProductStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images
    );
}

  @override
  List<Object?>get props => [addProductStatus,errorMessage,thumbnail,images];

}

