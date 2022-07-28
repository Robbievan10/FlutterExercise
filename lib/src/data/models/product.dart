import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

import 'hive_type.dart';

part 'product.g.dart';

@HiveType(typeId: HiveTypeId.product)
class Product {
  @HiveField(0)
  String? id = const Uuid().v4();
  @HiveField(1)
  String name;
  @HiveField(2)
  bool? isChecked;

  Product({required this.name, this.isChecked = false});
}
