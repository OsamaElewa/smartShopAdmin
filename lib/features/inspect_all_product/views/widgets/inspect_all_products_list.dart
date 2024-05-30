import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop_admin/features/inspect_all_product/logic/inspect_all_products_cubit.dart';
import 'package:smart_shop_admin/features/inspect_all_product/views/widgets/inspect_all_products_item.dart';

import '../../../add_new_product/models/product_model.dart';
import '../../logic/inspect_all_products_state.dart';
import '../../product_model.dart';

class InspectAllProductsList extends StatelessWidget {
   const InspectAllProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InspectAllProductsCubit, InspectAllProductsState>(
      builder: (context, state) {
        return StreamBuilder<List<ProductModel>>(
          stream: InspectAllProductsCubit.get(context).getProducts1(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            else if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No Products'),
              );
            }
            return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 1 / 1.3,
                children: List.generate(InspectAllProductsCubit.get(context).products1.length,
                        (index) =>
                        InspectAllProductsItem(model: InspectAllProductsCubit.get(context).products1[index],))
            );
          },
        );
      }
    );
  }
}
