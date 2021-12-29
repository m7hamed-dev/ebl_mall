import 'package:ebll_mall/models/category_model.dart';
import 'package:ebll_mall/ui/category/card_category.dart';
import 'package:flutter/material.dart';

class ListViewCategory extends StatelessWidget {
  final List<CategoryModel> categories;
  const ListViewCategory({required this.categories});
  //
  @override
  Widget build(BuildContext context) {
    //
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        //
        return CardCategory(
          category: categories[index],
          index: index,
        );
      },
    );
  }
}
