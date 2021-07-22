import '../../../../../export.dart';

Widget? addCategoryDialog(BuildContext context) {
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
          child: CategoryDetails(
            id: context.read(firestoreIdProvider),
          ),
        );
      });
    },
  );
}
