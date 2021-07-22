import '../../../../../export.dart';
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
            Consumer(
                builder: (context, watch, child) => ChooseImage(
                    imageUrl: watch(categoryProvider).state.image,
                    onSelected: (imagePath) =>
                        context.read(categoryProvider).state = context
                            .read(categoryProvider)
                            .state
                            .copyWith(imagePath: imagePath))),
            Expanded(
              child: Column(
                children: [
                  Consumer(
                      builder: (context, watch, child) => TextFieldWidget(
                            label: 'Title',
                            text: watch(categoryProvider).state.title,
                            onChanged: (String value) =>
                                context.read(categoryProvider).state = context
                                    .read(categoryProvider)
                                    .state
                                    .copyWith(title: value),
                          )),
                  Consumer(
                      builder: (context, watch, child) => TextFieldWidget(
                            label: 'Description',
                            text: watch(categoryProvider).state.desc,
                            maxLines: 4,
                            onChanged: (String value) =>
                                context.read(categoryProvider).state = context
                                    .read(categoryProvider)
                                    .state
                                    .copyWith(desc: value),
                          ))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
