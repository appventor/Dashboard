import '../../../../pages.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        minRadius: 50,
        backgroundImage: NetworkImage('http://picsum.photos/200'),
      ),
    );
  }
}
