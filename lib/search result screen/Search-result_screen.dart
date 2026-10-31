import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/Home/home_cubit.dart';

import '../Home/home details.dart';

class SearchresultScreen extends StatelessWidget {
  const SearchresultScreen({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchData(query: query),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,

          leading: BackButton(),
          title: Text(
            'Search Results for $query',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            //--------- handle states ------

            ////// ----------  loading ----------
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }

            ////// ----------  failure ----------
            if (state is HomeFailure) {
              return Center(
                child: Text(
                  state.msg,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }

            ////// ----------  Success ----------
            if (state is HomeSuccess) {
              return ListView.separated(
                padding: const EdgeInsets.all(8.0),

                itemBuilder: (context, index) {
                  final item = state.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) =>  HomeDetails(model: item), ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                    
                      child: Row(
                        spacing: 12,
                    
                        children: [
                          // Article Information
                          Expanded(
                            flex: 2,
                    
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                    
                              children: [
                                const SizedBox(height: 5),
                    
                                // description
                                Text(
                                  item.description ?? 'Reem Hany(no description)',
                    
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                    
                                const SizedBox(height: 5),
                    
                                // Date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Author
                                    Expanded(
                                      child: Text(
                                        item.author ?? 'Reem Hany',
                    
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        item.date ?? 'Date',
                    
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    
                          // Image
                          Expanded(
                            child: Image.network(
                              item.image ?? '',
                              height: 100,
                              fit: BoxFit.cover,
                    
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, color: Colors.red);
                              },
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
              );
            }

            ///// ------------  other state --------
            return SizedBox();
          },
        ),
      ),
    );
  }
}
