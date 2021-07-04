import 'package:dashboard/pages/catalog/products/controller/save_product_provider.dart';
import 'package:dashboard/pages/catalog/products/controller/save_variant_provider.dart';
import 'package:dashboard/pages/catalog/products/model/product_variant_model.dart';
import 'package:dashboard/pages/catalog/products/view/widgets/inventory_details.dart';
import 'package:dashboard/pages/catalog/widgets/textfield_widget.dart';
import 'package:dashboard/pages/warehouse/controller/warehouses_provider.dart';

import '../../../../pages.dart';
import 'widgets/choose_images.dart';

class VariantDetails extends StatelessWidget {
  final String id;
  const VariantDetails({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(id);
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () {
                      context.read(variantProvider).state = Variant.fromMap({});
                      context.popRoute();
                    },
                  ),
                  Text('Variant Details',
                      style: Theme.of(context).textTheme.headline6),
                  Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        List<Variant> variants =
                            context.read(productProvider).state.variants;
                        print(variants.map((e) => e.id));
                        print("ID: ${context.read(variantProvider).state.id}");
                        if (variants
                            .contains(context.read(variantProvider).state)) {
                          int index = variants
                              .indexOf(context.read(variantProvider).state);
                          variants.replaceRange(index, index + 1,
                              [context.read(variantProvider).state]);
                        } else
                          variants.add(context.read(variantProvider).state);
                        context.read(productProvider).state = context
                            .read(productProvider)
                            .state
                            .copyWith(variants: variants);
                        context.read(variantProvider).state =
                            Variant.fromMap({});
                        context.popRoute();
                      },
                      child: Text('SAVE'))
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: ChooseImages(
                        onSelected: (imagePaths) {},
                      )),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        TextFieldWidget(
                          label: 'Value',
                          text: '',
                          onChanged: (value) =>
                              context.read(variantProvider).state = context
                                  .read(variantProvider)
                                  .state
                                  .copyWith(value: value),
                        ),
                        TextFieldWidget(
                          label: 'Unit',
                          text: '',
                          onChanged: (value) =>
                              context.read(variantProvider).state = context
                                  .read(variantProvider)
                                  .state
                                  .copyWith(unit: value),
                        ),
                        TextFieldWidget(
                          label: 'Price',
                          text: '',
                          onChanged: (value) =>
                              context.read(variantProvider).state = context
                                  .read(variantProvider)
                                  .state
                                  .copyWith(price: double.parse(value)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(),
              InventoryDetails()
            ],
          )),
    );
  }
}
