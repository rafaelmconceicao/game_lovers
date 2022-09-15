import 'package:flutter/material.dart';
import 'package:game_lovers/src/utils/helper/gl_colors.dart';
import 'package:game_lovers/src/utils/helper/gl_text_styles.dart';

class CategoryTabBar extends StatelessWidget with PreferredSizeWidget {
  const CategoryTabBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight - 8.0,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        labelPadding: EdgeInsets.zero,
        labelColor: GLColors.white,
        labelStyle: GLTextStyles.tabSelected,
        unselectedLabelColor: GLColors.darkGray,
        unselectedLabelStyle: GLTextStyles.tabDisabled,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color:  GLColors.royalGreen),
        tabs: const [
          CategoryItem('Nintendo'),
          CategoryItem('Windows'),
          CategoryItem('Xbox'),
          CategoryItem('PlayStation'),
          CategoryItem('Ios'),
          CategoryItem('Android'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(text),
      ),
    );
  }
}
