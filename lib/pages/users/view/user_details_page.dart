import '../../../export.dart';

class UserDetailsPage extends StatelessWidget {
  final String id;

  const UserDetailsPage({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green[900],
      child: Text(id),
    );
  }
}
