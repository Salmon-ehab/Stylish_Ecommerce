import 'package:flutter/widgets.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/categories_list_view.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_products/get_products_body.dart';

class TrendingBody extends StatelessWidget {
  const TrendingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(child: TextHeadLine(title: "All Featured")),
            SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(child: SizedBox(height: 42)),
            SliverToBoxAdapter(child: TextHeadLine(title: "Products")),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
            GetProductsBody(),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
          ],
        ),
      ),
    );
  }
}
