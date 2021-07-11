import 'package:dashboard/pages/catalog/products/controller/save_variant_provider.dart';
import 'package:dashboard/pages/catalog/products/model/product_variant_model.dart';
import 'package:dashboard/pages/catalog/products/view/widgets/inventory_details.dart';
import 'package:dashboard/pages/catalog/widgets/textfield_widget.dart';

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
                          context.read(variantProvider).state =
                              Variant.fromMap({});
                          context.refresh(inventoryProvider);
                          context.popRoute();
                        },
                      ),
                      Text('Variant Details',
                          style: Theme.of(context).textTheme.headline6),
                      Spacer(),
                      ElevatedButton(
                          onPressed: () async {
                            await context
                                .read(saveVariant.notifier)
                                .saveVariant();
                            context.read(variantProvider).state =
                                Variant.fromMap({});
                            context.popRoute();
                          },
                          child: Text('SAVE'))
                    ],
                  ),
                  Divider(),
                  Row(children: [
                    Expanded(
                        flex: 2,
                        child: Consumer(builder: (context, watch, child) {
                          return ChooseImages(
                            images: watch(variantProvider).state.images,
                            onSelected: (imagePaths) =>
                                context.read(variantProvider).state = context
                                    .read(variantProvider)
                                    .state
                                    .copyWith(imagePaths: imagePaths),
                          );
                        })),
                    Expanded(
                        flex: 3,
                        child: Column(children: [
                          Consumer(builder: (context, watch, child) {
                            return TextFieldWidget(
                              label: 'Value',
                              text: watch(variantProvider).state.value,
                              onChanged: (value) =>
                                  context.read(variantProvider).state = context
                                      .read(variantProvider)
                                      .state
                                      .copyWith(value: value),
                            );
                          }),
                          Consumer(builder: (context, watch, child) {
                            return TextFieldWidget(
                              label: 'Unit',
                              text: watch(variantProvider).state.unit,
                              onChanged: (value) =>
                                  context.read(variantProvider).state = context
                                      .read(variantProvider)
                                      .state
                                      .copyWith(unit: value),
                            );
                          }),
                          Consumer(builder: (context, watch, child) {
                            return TextFieldWidget(
                              label: 'Price',
                              digit: true,
                              text:
                                  watch(variantProvider).state.price.toString(),
                              onChanged: (value) =>
                                  context.read(variantProvider).state = context
                                      .read(variantProvider)
                                      .state
                                      .copyWith(price: double.parse(value)),
                            );
                          })
                        ]))
                  ]),
                  Divider(),
                  InventoryDetails()
                ])));
  }
}
