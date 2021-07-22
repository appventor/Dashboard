import 'package:dashboard/pages/catalog/products/controller/save_variant_provider.dart';
import 'package:dashboard/pages/catalog/products/model/models.dart';
import 'package:dashboard/pages/catalog/widgets/textfield_widget.dart';
import 'package:dashboard/pages/warehouse/controller/warehouses_provider.dart';
import 'package:dashboard/pages/warehouse/models/warehouse_model.dart';

import '../../../../../export.dart';

class InventoryDetails extends StatelessWidget {
  const InventoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Inventory', style: Theme.of(context).textTheme.headline6),
        Consumer(builder: (context, watch, child) {
          List<Warehouse> warehouses = watch(warehousesProvider).data!.value;
          return GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: warehouses.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 80),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(warehouses[index].title),
                  SizedBox(
                    width: 300,
                    child: TextFieldWidget(
                      label: "Stock Value",
                      text: '',
                      digit: true,
                      onChanged: (value) {
                        Inventory currentInventory = Inventory(
                            id: warehouses[index].id,
                            stock: value.isNotEmpty ? int.parse(value) : 0);
                        context.read(inventoryProvider).state[index] =
                            currentInventory;
                        context.read(variantProvider).state.inventory =
                            context.read(inventoryProvider).state;
                      },
                    ),
                  )
                ],
              );
            },
          );
        }),
      ],
    );
  }
}
