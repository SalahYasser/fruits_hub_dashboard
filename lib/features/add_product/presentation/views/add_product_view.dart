import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manger/cubits/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_consumer.dart';
import '../../../../core/helper_functions/build_app_bar.dart';
import '../../../../core/repos/image_repo/images_repo.dart';
import '../../../../core/repos/product_repo/products_repo.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocProvider(
        create:
            (context) => AddProductCubit(
              getIt.get<ImagesRepo>(),
              getIt.get<ProductsRepo>(),
            ),
        child: AddProductViewBodyBlocConsumer(),
      ),
    );
  }
}