  import 'package:flutter/material.dart';
  import 'package:shop_ecommerce/core/utils/app_color.dart';
  import 'package:shop_ecommerce/core/utils/constant.dart';
  import 'package:shop_ecommerce/core/utils/styles.dart';
  import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/active_body.dart';
  import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/cancelled_body.dart';
  import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/completed_body.dart';

  class MyOrderBody extends StatefulWidget {
    const MyOrderBody({super.key});

    @override
    State<MyOrderBody> createState() => _MyOrderBodyState();
  }

  class _MyOrderBodyState extends State<MyOrderBody> {
    int _selectedIndex = 0;
    final PageController _pageController = PageController(initialPage: 0);

    List<String> tabs = ["Active", "Completed", "Cancelled"];

    void _onTabTap(int index) {
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: tabs.asMap().entries.map((entry) {
                int index = entry.key;
                String tabText = entry.value;
                bool isSelected = _selectedIndex == index;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => _onTabTap(index),
                    child: Container(
                      height: 28,
                      margin: const EdgeInsets.symmetric(horizontal: 4,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38),
                        color: isSelected
                            ? AppColor.appNameColor
                            : AppColor.pinkColor2,
                      ),
                      child: Center(
                        child: Text(
                          tabText,
                          style: isSelected
                              ? Styles.text17W500.copyWith(
                                  color: Colors.white,
                                  fontFamily: Constants.leagueSpartan)
                              : Styles.text17W400.copyWith(
                                  color: AppColor.appNameColor,
                                  fontFamily: Constants.leagueSpartan),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: const [ActiveBody(), CompletedBody(), CancelledBody()],
            ),
          ),
        ],
      );
    }
  }
