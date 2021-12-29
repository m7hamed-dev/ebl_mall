import 'package:ebll_mall/models/category_model.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/category/category_page.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatefulWidget {
  //
  final CategoryModel category;
  final int index;
  //
  const CardCategory({
    required this.category,
    required this.index,
  });

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  //
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.amber,
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        Push.to(
          context,
          CategoriesPage(
            isShowScaffold: true,
            selectCategoryName: widget.category.name,
            selectCategoryID: widget.category.id,
          ),
        );
      },
      child: Container(
        width: 110.0,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.2),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: CustomCachedNetworkImage(
                imageUrl: widget.category.img,
              ),
            ),
            const SizedBox(height: 6.0),
            Expanded(
              child: Txt(
                typesTxt: TypesTxt.small,
                data: widget.category.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
