import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../logic/inspect_all_products_cubit.dart';
import '../../logic/inspect_all_products_state.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InspectAllProductsCubit , InspectAllProductsState>(
      builder: (context, state) {
        return TextField(
          onTapOutside: (value) {
            FocusScope.of(context).unfocus();
          },
          controller: InspectAllProductsCubit.get(context).searchController,
          decoration: InputDecoration(
            suffixIcon:InspectAllProductsCubit.get(context).searchController.text.isEmpty ? null : IconButton(
                onPressed: () {
                  InspectAllProductsCubit.get(context).clear();
                },
                icon: Icon(Icons.clear,color: Colors.red,)
            ),
            prefixIcon: Icon(Icons.search,color: Colors.blue,),
            hintText: 'Search',
            labelStyle: TextStyle(color: AppColors.darkScaffoldColor),

          ),
          onChanged: (value) => InspectAllProductsCubit.get(context).searchChanged(),
        );
      },
    );
  }
}
