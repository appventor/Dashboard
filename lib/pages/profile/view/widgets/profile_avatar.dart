import '../../../../export.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        minRadius: 50,
        backgroundImage: NetworkImage('https://picsum.photos/200'),
      ),
    );
  }
}
