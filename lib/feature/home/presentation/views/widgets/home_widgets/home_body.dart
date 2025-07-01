import 'package:flutter/widgets.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/carousel_widget.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/get_best_seller.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/widgets/search_widget.dart/search_widget.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SearchWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 25)),
            SliverToBoxAdapter(child: CarouselWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(child: TextHeadLine(title: "Best Seller")),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
            GetBestSeller(),
            SliverToBoxAdapter(child: SizedBox(height: 18)),
          ],
        ),
      ),
    );
  }
}
