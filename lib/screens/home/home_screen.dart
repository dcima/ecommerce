// ignore_for_file: deprecated_member_use

import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/widgets/section_title.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Zero To Unicorn'),
      bottomNavigationBar: const CustomNavBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: true,
              enlargeCenterPage: false,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              initialPage: 1,
              viewportFraction: 0.7,
            ),
            items: Category.categories
                .map((category) => HeroCarouselCard(
                      category: category,
                    ))
                .toList(),
          ),
          const SectionTitle(title: 'SuperPippo!!!'),
        ],
      ),
    );
  }
}
