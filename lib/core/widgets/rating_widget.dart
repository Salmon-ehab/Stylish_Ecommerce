import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class CustomRatingWidget extends StatefulWidget {
  const CustomRatingWidget({super.key, required this.rating});

  final double rating;

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  late double displayedRating;

  @override
  void initState() {
    super.initState();
    displayedRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: displayedRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 11,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => SvgPicture.asset(
        SvgAssets.starIcon,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          displayedRating = rating;
        });
      },
    );
  }
}
