import 'package:encaixe_app/shared/themes/app_images.dart';
import 'package:encaixe_app/shared/themes/app_text_style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyle.titleHeader,
          ),
          Row(
            children: [
              Text(
                'Priscila Valencia\nHair & Make',
                style: AppTextStyle.nameHeader,
                textAlign: TextAlign.end,
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(25), // Image radius
                  child: Image.asset(AppImages.logo, fit: BoxFit.cover),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
