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
        ChooseAttribute(
          title: "Choose Category",
          onAdd: () {},
        ),
        Divider(),
        ChooseAttribute(
          title: "Choose Sub-Category",
          onAdd: () {},
        ),
        Divider(),
        ChooseAttribute(
          title: "Add to Collection",
          onAdd: () {},
        ),
        Divider(),
        ChooseAttribute(
          title: "Select a Brand",
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
