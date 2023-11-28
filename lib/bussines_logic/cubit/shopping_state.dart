part of 'shopping_cubit.dart';

@immutable
sealed class ShoppingState {}

final class ShoppingInitial extends ShoppingState {}

class ShoppingErrorCase extends ShoppingState {}

class ProductsLoaded extends ShoppingState {
  final List<Products> product;

  ProductsLoaded(this.product);
}

class CategoriesLoaded extends ShoppingState {
  final List<Categories> category;

  CategoriesLoaded(this.category);
}
