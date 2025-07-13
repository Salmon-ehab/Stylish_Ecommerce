import 'package:flutter/widgets.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/carousel_widget.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/get_best_seller.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/widgets/search_widget.dart/search_widget.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SearchWidget(readOnly: true),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 25)),
                  const SliverToBoxAdapter(child: CarouselWidget()),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                  SliverToBoxAdapter(
                      child: TextHeadLine(title: S.of(context).bestSeller)),
                  const SliverToBoxAdapter(child: SizedBox(height: 18)),
                  const GetBestSeller(),
                  const SliverToBoxAdapter(child: SizedBox(height: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
