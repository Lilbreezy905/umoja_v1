

import 'package:umoja_v1/features/news/model/category_model.dart';


List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.image = "assets/business.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "assets/entertainment.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.image = "assets/general.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.image = "assets/health.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.image = "assets/sport.jpg";
  category.add(categoryModel);
  categoryModel =  CategoryModel();

  return category;
}
