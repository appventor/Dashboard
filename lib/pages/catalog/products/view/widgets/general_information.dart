import 'package:dashboard/pages/catalog/products/controller/save_product_provider.dart';
import 'package:dashboard/pages/catalog/widgets/textfield_widget.dart';

import '../../../../../export.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General Information'),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Consumer(builder: (context, watch, child) {
                    return ChooseImage(
                      imageUrl: watch(productProvider).state.image,
                      onSelected: (imagePath) =>
                          context.read(productProvider).state = context
                              .read(productProvider)
                              .state
                              .copyWith(imagePath: imagePath),
                    );
                  })),
              Expanded(
                flex: 3,
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer(builder: (context, watch, child) {
                      return TextFieldWidget(
                        text: watch(productProvider).state.title,
                        label: 'Title',
                        onChanged: (value) =>
                            context.read(productProvider).state = context
                                .read(productProvider)
                                .state
                                .copyWith(title: value),
                      );
                    }),
                    Consumer(builder: (context, watch, child) {
                      return TextFieldWidget(
                        text: watch(productProvider).state.desc,
                        label: 'Description',
                        maxLines: 4,
                        onChanged: (value) =>
                            context.read(productProvider).state = context
                                .read(productProvider)
                                .state
                                .copyWith(desc: value),
                      );
                    }),
                    Consumer(builder: (context, watch, child) {
                      return TextFieldWidget(
                        text: watch(productProvider).state.pricetag,
                        label: 'Price',
                        onChanged: (value) =>
                            context.read(productProvider).state = context
                                .read(productProvider)
                                .state
                                .copyWith(pricetag: value),
                      );
                    }),
                  ],
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
