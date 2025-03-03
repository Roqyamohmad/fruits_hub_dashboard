part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductFailur extends AddProductState {
  final String errMessage;

  AddProductFailur(this.errMessage);
}

class AddProductSuccess extends AddProductState {}
