import 'package:ecommerce/features/home/data/models/category_model.dart';

import '../../domain/entities/category.dart';

extension CategoryMapper on CategoryModel {
Category get toEntity => Category(id: id, name: name, image: image);
}
