import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:ppkd_b_2/tugas_14_b_flutter/api/function.dart';
import 'package:ppkd_b_2/tugas_14_b_flutter/models/data_model.dart';
import 'package:ppkd_b_2/tugas_14_flutter/const/app_color.dart';

class TugasEmpatBelasB extends StatefulWidget {
  const TugasEmpatBelasB({super.key});

  @override
  State<TugasEmpatBelasB> createState() => _TugasEmpatBelasBState();
}

class _TugasEmpatBelasBState extends State<TugasEmpatBelasB> {
  final TextEditingController searchController = TextEditingController();
  String currentFilter = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _applyFilter(String filter) {
    setState(() {
      currentFilter = filter;
    });
  }

  String _getFormattedScore(String score) {
    if (score.isEmpty) return 'N/A';
    return score;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://wallpapercave.com/wp/rCou5ca.jpg',
      'https://wallpapercave.com/wp/wp14017859.png',
      'https://wallpapercave.com/wp/oeKvY1R.jpg',
      'https://wallpapercave.com/wp/wp14625216.jpg',
      'https://wallpapercave.com/wp/o0Anjp0.jpg',
    ];
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo_ghibli.png',
                scale: 4,
              ),
              SizedBox(
                height: 10,
              ),
              FlutterCarousel(
                options: CarouselOptions(
                  height: 180,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                ),
                items: imageUrls.map((url) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 36,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search by movie names...',
                    hintStyle:
                        TextStyle(color: AppColor.textColor.withOpacity(0.7)),
                    filled: true,
                    fillColor: AppColor.secondaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: AppColor.textColor),
                    suffixIcon: currentFilter.isNotEmpty
                        ? IconButton(
                            icon: Icon(Icons.clear, color: AppColor.textColor),
                            onPressed: () {
                              searchController.clear();
                              _applyFilter('');
                            },
                          )
                        : null,
                  ),
                  style: TextStyle(color: AppColor.textColor),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<List<Data>>(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColor.accentColor,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: AppColor.textColor,
                              size: 48,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No movies found',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }

                    final movies = snapshot.data!;
                    final filteredMovies = movies.where((movie) {
                      if (searchController.text.isEmpty) return true;
                      return movie.title.toLowerCase().contains(
                            searchController.text.toLowerCase(),
                          );
                    }).toList();

                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.secondaryColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    movie.image,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: AppColor.primaryColor,
                                        child: Icon(
                                          Icons.movie,
                                          color: AppColor.textColor,
                                          size: 48,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        movie.director,
                                        style: TextStyle(
                                          color: AppColor.textColor
                                              .withOpacity(0.7),
                                          fontSize: 12,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            _getFormattedScore(movie.rtScore),
                                            style: TextStyle(
                                              color: AppColor.textColor,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
