import '../../../../export.dart';
import '../model/models.dart';
import '../controller/products_provider.dart';
import '../controller/save_product_provider.dart';
import 'widgets/assign_attributes.dart';
import 'widgets/general_information.dart';
import 'widgets/product_variants.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  const ProductDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Product Information'),
        centerTitle: false,
        leading: BackButton(
          onPressed: () {
            context.read(productProvider).state = Product.fromMap({});
            context.popRoute();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  _loading = true;
                });
                context.read(saveProduct.notifier).save().then((result) {
                  if (result) {
                    context.read(productProvider).state = Product.fromMap({});
                    context.refresh(productsProvider);
                    scaffoldMessengerKey.currentState!
                        .showSnackBar(const SnackBar(
                      content: Text('Saved'),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.of(context).pop();
                  } else {
                    scaffoldMessengerKey.currentState!
                        .showSnackBar(const SnackBar(
                      content: Text('Error, Please try again'),
                      backgroundColor: Colors.red,
                    ));
                  }
                  setState(() {
                    _loading = false;
                  });
                });
              },
              child: const Text('      SAVE      '),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                          children: const [
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
                          decoration: const BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const AssignAttributes(),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Visibility(
              visible: _loading,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black54,
                child: const Center(child: CircularProgressIndicator()),
              )),
        ],
      ),
    );
  }
}
