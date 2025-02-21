import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:meta/meta.dart';
import '../../../../../../core/repos/product_repo/products_repo.dart';
import '../../../../domain/entities/add_product_input/add_product_input_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
    : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (failure) {
        emit(AddProductFailure(failure.message));
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (failure) {
            emit(AddProductFailure(failure.message));
          },
          (url) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
