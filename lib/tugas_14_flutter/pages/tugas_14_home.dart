import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:ppkd_b_2/tugas_14_flutter/api/function.dart';
import 'package:ppkd_b_2/tugas_14_flutter/const/app_color.dart';
import 'package:ppkd_b_2/tugas_14_flutter/models/data_model.dart';
import 'package:ppkd_b_2/tugas_14_flutter/pages/detail_page.dart';

class TugasEmpatBelas extends StatefulWidget {
  const TugasEmpatBelas({super.key});

  @override
  State<TugasEmpatBelas> createState() => _TugasEmpatBelasState();
}

class _TugasEmpatBelasState extends State<TugasEmpatBelas> {
  List<Result> characters = [];
  List<Result> filteredCharacters = [];
  final TextEditingController searchController = TextEditingController();
  String currentFilter = '';
  late Future<List<Result>> _charactersFuture;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
    _charactersFuture = fetchData();
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() {
      _charactersFuture = fetchData();
    });
  }

  void _onSearchChanged() {
    setState(() {
      final searchText = searchController.text.toLowerCase();
      if (searchText.isEmpty) {
        filteredCharacters = characters;
      } else {
        filteredCharacters = characters.where((char) {
          final name = char.name.toLowerCase();
          final status = char.status.toString().split('.').last.toLowerCase();
          final species = char.species.toString().split('.').last.toLowerCase();

          return name.contains(searchText) ||
              status.contains(searchText) ||
              species.contains(searchText);
        }).toList();
      }
    });
  }

  void _applyFilter(String filter) {
    setState(() {
      currentFilter = filter;
      if (filter.isEmpty) {
        filteredCharacters = characters;
      } else {
        filteredCharacters = characters.where((char) {
          if (filter == 'species') {
            return char.species == Species.HUMAN;
          } else if (filter == 'alien') {
            return char.species == Species.ALIEN;
          } else if (filter == 'alive') {
            return char.status == Status.ALIVE;
          } else if (filter == 'dead') {
            return char.status == Status.DEAD;
          } else if (filter == 'unknown') {
            return char.status == Status.UNKNOWN;
          }
          return true;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://wallpapercave.com/wp/wp2450753.jpg',
      'https://wallpapercave.com/wp/wp1822736.jpg',
      'https://wallpapercave.com/wp/wp1822743.png',
      'https://wallpapercave.com/wp/wp14495610.jpg',
    ];

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.primaryColor,
                        ),
                        child: FlutterCarousel(
                          options: CarouselOptions(
                            height: 180,
                            viewportFraction: 1.0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
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
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Characters',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.filter_list,
                              color: AppColor.textColor),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'species',
                              child: Text('Filter by Species'),
                            ),
                            PopupMenuItem(
                              value: 'status',
                              child: Text('Filter by Status'),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'species') {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColor.secondaryColor,
                                  title: Text('Filter by Species',
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.personal_injury,
                                            color: AppColor.textColor),
                                        title: Text('Human',
                                            style: TextStyle(
                                                color: AppColor.textColor)),
                                        onTap: () {
                                          _applyFilter('species');
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.pets,
                                            color: AppColor.textColor),
                                        title: Text(
                                          'Alien',
                                          style: TextStyle(
                                              color: AppColor.textColor),
                                        ),
                                        onTap: () {
                                          _applyFilter('alien');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (value == 'status') {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppColor.secondaryColor,
                                  title: Text('Filter by Status',
                                      style:
                                          TextStyle(color: AppColor.textColor)),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.person,
                                            color: AppColor.textColor),
                                        title: Text('Alive',
                                            style: TextStyle(
                                                color: AppColor.textColor)),
                                        onTap: () {
                                          _applyFilter('alive');
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.person_off,
                                            color: AppColor.textColor),
                                        title: Text('Dead',
                                            style: TextStyle(
                                                color: AppColor.textColor)),
                                        onTap: () {
                                          _applyFilter('dead');
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.question_mark,
                                            color: AppColor.textColor),
                                        title: Text('Unknown',
                                            style: TextStyle(
                                                color: AppColor.textColor)),
                                        onTap: () {
                                          _applyFilter('unknown');
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'Search by name, status, or species...',
                            hintStyle: TextStyle(
                                color: AppColor.textColor.withOpacity(0.7)),
                            filled: true,
                            fillColor: AppColor.secondaryColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            prefixIcon:
                                Icon(Icons.search, color: AppColor.textColor),
                            suffixIcon: currentFilter.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.clear,
                                        color: AppColor.textColor),
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
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Result>>(
                  future: _charactersFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    characters = snapshot.data!;
                    if (filteredCharacters.isEmpty) {
                      filteredCharacters = characters;
                    }

                    return ListView.builder(
                      itemCount: filteredCharacters.length,
                      itemBuilder: (context, index) {
                        final character = filteredCharacters[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Card(
                            color: AppColor.secondaryColor,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailPage(character: character),
                                  ),
                                );
                              },
                              leading: Hero(
                                tag: 'character-${character.id}',
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(character.image),
                                ),
                              ),
                              title: Text(
                                character.name,
                                style: TextStyle(
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${character.status.toString().split('.').last} - ${character.species.toString().split('.').last}',
                                    style: TextStyle(
                                        color: AppColor.accentColor,
                                        fontSize: 12),
                                  ),
                                  Text(
                                    'Tap for more details',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
