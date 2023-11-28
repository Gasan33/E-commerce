import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping/data/Models/categories.dart';
import 'package:shopping/data/Models/products.dart';
import 'package:shopping/data/Repositorys/categories_repository.dart';
import 'package:shopping/data/Repositorys/products_repository.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  final ProductsRepository productsRepository;
  final CategoriesRepository categoriesRepository;
  List<Products> product = [];
  List<Categories> category = [];

  ShoppingCubit(this.productsRepository, this.categoriesRepository)
      : super(ShoppingInitial());

  List<Products> getProduct(int limit, int page) {
    productsRepository.getProduct(limit, page).then((product) {
      emit(ProductsLoaded(product));
      this.product = product;
    });
    return product;
  }

  List<Categories> getCategory() {
    categoriesRepository.getCategory().then((category) {
      emit(CategoriesLoaded(category));
      this.category = category;
    });
    return category;
  }
}
