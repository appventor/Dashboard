import '../../../../../pages.dart';
import '../../../widgets/textfield_widget.dart';
import '../../controller/save_category_provider.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('General Information'),
        Row(
          children: [
            ChooseImage(),
            Expanded(
              child: Column(
                children: [
                  TextFieldWidget(
                    label: 'Title',
                    onChanged: (String value) =>
                        context.read(categoryProvider).state.title = value,
                  ),
                  TextFieldWidget(
                    label: 'Description',
                    maxLines: 4,
                    onChanged: (String value) =>
                        context.read(categoryProvider).state.desc = value,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
