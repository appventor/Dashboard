import 'package:dashboard/pages/catalog/products/controller/save_product_provider.dart';
import 'package:dashboard/pages/catalog/widgets/link_categories.dart';

import '../../../../../pages.dart';
import 'choose_attribute.dart';

class AssignAttributes extends StatelessWidget {
  const AssignAttributes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Assign Attributes'),
        Divider(),
        LinkCategories(
            initialValue: context.read(productProvider).state.categories,
            onSelected: (List<Object?> value) =>
                context.read(productProvider).state = context
                    .read(productProvider)
                    .state
                    .copyWith(
                        categories:
                            value.map((items) => items.toString()).toList())),
        Divider(),
        ChooseAttribute(
          title: "Add to Collection",
          onAdd: () {},
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Text('Add Tags'),
              Spacer(),
              OutlinedButton(onPressed: () {}, child: Icon(Icons.add)),
            ],
          ),
        ),
        Wrap(
          runSpacing: 8,
          spacing: 8,
          children: [
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
            Chip(label: Text('Tags')),
          ],
        )
      ],
    );
  }
}
