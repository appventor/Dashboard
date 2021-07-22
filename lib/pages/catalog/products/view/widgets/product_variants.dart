import '../../controller/delete_product.dart';
import '../../controller/save_product_provider.dart';
import '../../controller/save_variant_provider.dart';
import '../../model/models.dart';
import '../../view/widgets/show_variant.dart';
import '../../../../warehouse/controller/warehouses_provider.dart';
import '../../../../warehouse/models/warehouse_model.dart';

import '../../../../../export.dart';

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
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Product Variants'),
              const Spacer(),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add Variant'),
                onPressed: () {
                  showVariantDialog(context);
                },
              ),
            ],
          ),
          const Divider(),
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
                          const DataColumn(label: Text('Images')),
                          const DataColumn(label: Text('Value')),
                          const DataColumn(label: Text('Unit')),
                          const DataColumn(label: Text('Price')),
                          DataColumn(
                              label: Text('Stock @\n${warehouse.title}')),
                          const DataColumn(label: Text('Options')),
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
                                const DataCell(
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    // child: StackedAvatars(images: images),
                                  ),
                                ),
                                DataCell(Text(variant.value)),
                                DataCell(Text(variant.unit)),
                                DataCell(Text(variant.price.toString())),
                                DataCell(Text(inventory.stock.toString())),
                                DataCell(PopupMenuButton(
                                  icon: const Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    if (value == 0) {
                                      {
                                        context.read(variantProvider).state =
                                            variant;
                                        showVariantDialog(context);
                                      }
                                    } else if (value == 1) {
                                      context.read(deleteVariant(variant.id));
                                    }
                                  },
                                  itemBuilder: (context) => const [
                                    PopupMenuItem(
                                      value: 0,
                                      child: Text('Edit'),
                                    ),
                                    PopupMenuItem(
                                      value: 1,
                                      child: Text('Delete'),
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
