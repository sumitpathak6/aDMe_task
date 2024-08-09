import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categoryList = [
    'Electronics',
    'Fashion',
    'Home Appliances',
    'Books',
    'Beauty & Health',
    'Sports',
    'Toys & Games'
  ];
  final List<String> promotions = [
    'CLEARANCE SALE FROM \n 12th August',
    'INDEPENDENCE DAY SALE ',
    'FLAT 20% OFF \n Home Appliances',
    'Books by Rabindranath Tagore',
    'Beauty & Health by TOP BRANDS',
    'Sports at its PEAK',
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E Commerce App'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), // Adjust the opacity here
                  BlendMode.dstATop,
                ),
                child: Image.asset(
                  'assets/bg_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 80.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false),
                  items: promotions
                      .map((promotion) => Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 109, 240, 52)
                                  .withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                promotion,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 25.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 80.0,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final category = categoryList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ) // Expanded()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
