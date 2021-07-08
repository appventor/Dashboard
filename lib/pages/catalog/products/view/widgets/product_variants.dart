import '../../controller/delete_product.dart';
import '../../controller/save_product_provider.dart';
import '../../controller/save_variant_provider.dart';
import '../../model/models.dart';
import '../../view/widgets/show_variant.dart';
import '../../../../warehouse/controller/warehouses_provider.dart';
import '../../../../warehouse/models/warehouse_model.dart';

import '../../../../../pages.dart';

class ProductVariants extends StatefulWidget {
  const ProductVariants({
    Key? key,
  }) : super(key: key);

  @override
  _ProductVariantsState createState() => _ProductVariantsState();
}

class _ProductVariantsState extends State<ProductVariants> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Product Variants'),
              Spacer(),
              OutlinedButton.icon(
                icon: Icon(Icons.add),
                label: Text("Add Variant"),
                onPressed: () {
                  showVariantDialog(context);
                },
              ),
            ],
          ),
          Divider(),
          Consumer(builder: (context, watch, child) {
            Product product = watch(productProvider).state;
            Warehouse warehouse = watch(warehouseProvider).state;
            return SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: DataTable(
                        showCheckboxColumn: true,
                        checkboxHorizontalMargin: 16,
                        onSelectAll: (value) {},
                        columns: [
                          DataColumn(label: Text('Images')),
                          DataColumn(label: Text('Value')),
                          DataColumn(label: Text('Unit')),
                          DataColumn(label: Text('Price')),
                          DataColumn(
                              label: Text('Stock @\n${warehouse.title}')),
                          DataColumn(label: Text('Options')),
                        ],
                        rows: product.variants.map((variant) {
                          Inventory inventory = variant.inventory.firstWhere(
                              ((element) => element.id == warehouse.id),
                              orElse: () => Inventory.fromMap({}));
                          return DataRow(
                              onSelectChanged: (value) {
                                setState(() {
                                  variant.selected = value!;
                                });
                              },
                              selected: variant.selected,
                              cells: [
                                DataCell(
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    // child: StackedAvatars(images: images),
                                  ),
                                ),
                                DataCell(Text(variant.value)),
                                DataCell(Text(variant.unit)),
                                DataCell(Text(variant.price.toString())),
                                DataCell(Text(inventory.stock.toString())),
                                DataCell(PopupMenuButton(
                                  icon: Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    if (value == 0) {
                                      {
                                        context.read(variantProvider).state =
                                            variant;
                                        showVariantDialog(context);
                                      }
                                    } else if (value == 1)
                                      context.read(deleteVariant(variant.id));
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text('Edit'),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text('Delete'),
                                      value: 1,
                                    ),
                                  ],
                                )),
                              ]);
                        }).toList()),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
