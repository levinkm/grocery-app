import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerygo/constants.dart';

import '../modules/category/category_cubit.dart';
import '../modules/category/category_state.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is InitCategoryState || state is LoadingCategoryState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessCategoryState) {
          final categories = state.categories;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: 3,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle see all categories
                      },
                      child: const Text(
                        'See All',
                        //style: Theme.of(context).textTheme.titleMedium,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.categories.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          // Handle All category tap
                        },
                        child: const Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text('All'),
                          ),
                        ),
                      );
                    } else {
                      final category = categories.categories[index - 1];
                      return GestureDetector(
                        onTap: () {
                          // Handle category tap
                        },
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text(category.title),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        } else if (state is ErrorCategoryState) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('Unknown error'));
      },
    );
  }
}
