import 'package:dashboard/pages/catalog/products/controller/save_variant_provider.dart';

import '../../../../../pages.dart';
import '../product_variant_details.dart';

showVariantDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 6,
            vertical: MediaQuery.of(context).size.height / 8,
          ),
          backgroundColor: secondaryColor,
          child: VariantDetails(id: context.read(variantProvider).state.id),
        );
      });
    },
  );
}
