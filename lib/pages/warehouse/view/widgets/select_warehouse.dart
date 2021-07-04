import 'package:dashboard/pages/warehouse/controller/warehouses_provider.dart';
import 'package:dashboard/pages/warehouse/models/warehouse_model.dart';

import '../../../../pages.dart';

class SelectWarehouse extends StatefulWidget {
  const SelectWarehouse({Key? key}) : super(key: key);

  @override
  _SelectWarehouseState createState() => _SelectWarehouseState();
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  Warehouse? _warehouse;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<List<Warehouse>> warehousesData = watch(warehousesProvider);
      return warehousesData.when(
          data: (warehouses) {
            print(warehouses.map((e) => e.title).toList());
            return DropdownButton<Warehouse>(
              focusColor: Colors.white,
              value: _warehouse ?? warehouses.first,
              elevation: 20,
              iconEnabledColor: Colors.white,
              items: warehouses
                  .map<DropdownMenuItem<Warehouse>>((Warehouse value) {
                return DropdownMenuItem<Warehouse>(
                  value: value,
                  child: Text(
                    value.title,
                  ),
                );
              }).toList(),
              hint: Text(
                "Please choose a langauage",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (Warehouse? value) {
                context.read(warehouseProvider).state = value!;
                setState(() {
                  _warehouse = value;
                });
              },
            );
          },
          loading: () => SizedBox.shrink(),
          error: (_, __) => SizedBox.shrink());
    });
  }
}
