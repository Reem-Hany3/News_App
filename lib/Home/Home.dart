import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Home/home_cubit.dart';

import '../Animation/loadingAnimation.dart';
import 'home details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> categories = ['All', 'Politic', 'Sport', 'Education', 'Airpods'];
  int curindex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('News'),
        ),

        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            // Loading
            // Loading
            if (state is HomeLoading) {
              return const LoadingAnimation();
            }

            // Success
            if (state is HomeSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (context, index) {
                          bool isSelected = curindex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                curindex = index;
                              });
                              if (categories[index] == 'All') {
                                context.read<HomeCubit>().getHomeData;
                              } else {
                                context.read<HomeCubit>().getSearchData(
                                  query: categories[index],
                                );
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.amber : Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(child: Text(categories[index])),
                            ),
                          );
                        },
                        itemCount: categories.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 25);
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'News For You',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Show More',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(8.0),

                        itemBuilder: (context, index) {
                          final article = state.data[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeDetails(model: article),
                                ),
                              );
                            },

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),

                              child: Row(
                                spacing: 12,

                                children: [
                                  // Image
                                  Expanded(
                                    child: Image.network(
                                      article.image ?? '',
                                      height: 100,
                                      fit: BoxFit.cover,

                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.error,
                                              color: Colors.red,
                                            );
                                          },
                                    ),
                                  ),

                                  // Article Information
                                  Expanded(
                                    flex: 2,

                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        // Author
                                        Text(
                                          article.author ?? 'Reem Hany',

                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        // Title
                                        Text(
                                          article.title ??
                                              'Reem Hany(no title)',

                                          maxLines: 3,

                                          overflow: TextOverflow.ellipsis,
                                        ),

                                        const SizedBox(height: 5),

                                        // Date
                                        Text(
                                          article.date ?? '',

                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },

                        separatorBuilder: (context, index) {
                          return const Divider();
                        },

                        itemCount: state.data.length,
                      ),
                    ),
                  ],
                ),
              );
            }

            // Failure
            if (state is HomeFailure) {
              return Center(child: Text(state.msg));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
