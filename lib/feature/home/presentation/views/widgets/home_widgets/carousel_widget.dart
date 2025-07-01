import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart'; // قم باستيراد مكتبة الشيمر
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_slider_repo/get_slider_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_sliders_cubit/get_slider_State.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_sliders_cubit/get_slider_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/carousel_body.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/carousel_dots.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetSliderCubit(
        GetSliderRepoImple(apiConsumer: DioConsumer(dio: Dio())),
      )..getSliders(),
      child: BlocBuilder<GetSliderCubit, GetSliderState>(
        builder: (context, state) {
          if (state is GetSliderLoadingState) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: MyResponsive.height(context, 189),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          } else if (state is GetSliderErrorState) {
            return SizedBox( // استخدام SizedBox لضمان وجود ارتفاع محدد
              height: MyResponsive.height(context, 189),
              child: Center(child: Text('Error: ${state.error}')),
            );
          } else if (state is GetSliderSuccessState) {
            if (state.sliders.isEmpty) {
              return SizedBox(
                height: MyResponsive.height(context, 189),
                child: const Center(child: Text("No sliders available.")),
              );
            }
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: state.sliders.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: MyResponsive.height(context, 189),
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return CarouselBody(sliderModel: state.sliders[index]);
                  },
                ),
                const SizedBox(height: 12),
                CarouselDots(
                  currentIndex: _current,
                  generateDots: state.sliders,
                  carouselSliderController: _controller,
                ),
              ],
            );
          } else {
            return SizedBox(
              height: MyResponsive.height(context, 189),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}