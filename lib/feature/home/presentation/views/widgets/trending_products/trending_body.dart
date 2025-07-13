import 'package:flutter/widgets.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_products/categories_list_view.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_products/get_products_body.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class TrendingBody extends StatelessWidget {
  const TrendingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(
                child: TextHeadLine(title: S.of(context).allFeatured)),
            const SliverToBoxAdapter(child: SizedBox(height: 25)),
            const SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(child: SizedBox(height: 42)),
            SliverToBoxAdapter(
                child: TextHeadLine(title: S.of(context).products)),
            const SliverToBoxAdapter(child: SizedBox(height: 18)),
            const GetProductsBody(),
            const SliverToBoxAdapter(child: SizedBox(height: 18)),
          ],
        ),
      ),
    );
  }
}
