import '../../pages.dart';

class StackedAvatars extends StatelessWidget {
  final List<String> images;
  const StackedAvatars({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty
        ? Row(
            children: [
              SizedBox(
                width: images.length > 3 ? 70 : 100,
                child: Stack(
                  children: List.generate(
                      3,
                      (index) => Positioned(
                          left: images.length > 3 ? (index * 12) : (index * 24),
                          child: CircleAvatar(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                              ),
                            ),
                            backgroundImage: NetworkImage(images[index]),
                          ))),
                ),
              ),
              images.length > 3
                  ? Text(
                      "+ ${images.length - 3}\nmore",
                      textAlign: TextAlign.center,
                    )
                  : SizedBox()
            ],
          )
        : SizedBox();
  }
}
