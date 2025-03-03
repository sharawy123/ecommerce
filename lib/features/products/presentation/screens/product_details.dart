import 'package:ecommerce/core/resources/assets_manager.dart';
import 'package:ecommerce/core/resources/color_manager.dart';
import 'package:ecommerce/core/resources/styles_manager.dart';
import 'package:ecommerce/core/widgets/custom_elevated_button.dart';
import 'package:ecommerce/core/widgets/product_counter.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_state.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_description.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_image.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_label.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_rating.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/service_locator.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final productCubit = getIt.get<ProductsCubit>();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitle)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(IconsAssets.search),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            bottom: 50.h,
          ),
          child: BlocProvider(
            create: (context) => productCubit,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductSlider(
                  items: product.images
                      .map(
                        (imageURL) => ProductImage(imageUrl: imageURL),
                      )
                      .toList(),
                  initialIndex: 0,
                ),
                SizedBox(
                  height: 24.h,
                ),
                ProductLabel(
                  name: product.title,
                  price: '${product.priceAfterDiscount ?? product.price} EGP',
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ProductRating(
                        buyers: '${product.sold}',
                        rating:
                            '${product.ratingsAverage} (${product.ratingsQuantity})',
                      ),
                    ),
                    ProductCounter(
                      initialValue: productCubit.productQuantity,
                      onIncrement: productCubit.onProductQuantityChange,
                      onDecrement: productCubit.onProductQuantityChange,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                ProductDescription(
                  description: product.description,
                ),
                SizedBox(
                  height: 48.h,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total price',
                          style: getMediumStyle(
                            color: ColorManager.primary.withOpacity(.6),
                          ).copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        BlocBuilder<ProductsCubit, ProductState>(
                          builder: (context, state) {
                            return Text(
                              'EGP ${(product.priceAfterDiscount ?? product.price) * productCubit.productQuantity}',
                              style: getMediumStyle(
                                color: ColorManager.appBarTitle,
                              ).copyWith(fontSize: 18.sp),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 33.w,
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        label: 'Add to cart',
                        onTap: () {},
                        prefixIcon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
