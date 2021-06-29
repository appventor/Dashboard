import '../../../../pages.dart';
import 'widgets/assign_attributes.dart';
import 'widgets/general_information.dart';
import 'widgets/product_variants.dart';

class ProductDetails extends StatelessWidget {
  final String id;
  const ProductDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Product Information'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(),
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: Text(
                  'DELETE',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.red),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                '      SAVE      ',
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        GeneralInformation(),
                        ProductVariants(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: AssignAttributes(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
