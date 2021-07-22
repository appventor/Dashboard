import 'package:dashboard/export.dart';
import 'package:dashboard/pages/warehouse/models/warehouse_model.dart';

final warehousesProvider = FutureProvider<List<Warehouse>>((ref) async {
  return Future.delayed(
      Duration(seconds: 2),
      () => List.from(
          warehouseData.map((warehouse) => Warehouse.fromMap(warehouse))));
});

final warehouseProvider =
    StateProvider<Warehouse>((ref) => Warehouse.fromMap({}));
