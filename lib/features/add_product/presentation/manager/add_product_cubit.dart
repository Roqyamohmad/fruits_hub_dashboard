import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entities.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(AddProductEntitites addProductEntitites) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductEntitites.image);
    result.fold(
      (f) {
        emit(AddProductFailur(f.message));
      },
      (url) async {
        addProductEntitites.imageUrl = url;
        var result = await productRepo.addProduct(addProductEntitites);
        result.fold((f) {
          emit(AddProductFailur(f.message));
        }, (url) {
          emit(AddProductSuccess());
        });
      },
    );
  }
}
