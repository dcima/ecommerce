// ignore_for_file: deprecated_member_use

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/section_title.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    int n_recommended = Product.products
        .where((product) => product.isRecommended)
        .toList()
        .length;
    int n_popular =
        Product.products.where((product) => product.isPopular).toList().length;

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
          SectionTitle(title: 'RECOMMENDED: $n_recommended'),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
          SectionTitle(title: 'MOST POPULAR : $n_popular'),
          ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          ),
        ],
      ),
    );
  }
}
