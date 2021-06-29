import '../../../../pages.dart';

class CategoryDetails extends StatelessWidget {
  final String id;
  const CategoryDetails({Key? key, @PathParam('id') required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text('Create Category',
                style: Theme.of(context).textTheme.headline6),
          ]),
          Divider(),
          Text('General Information'),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://picsum.photos/204'))),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Title'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Description'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text('Link to Category'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(
                    message:
                        'Linking to another category will make this a sub-category',
                    child: Icon(
                      Icons.info,
                      size: 18,
                    )),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    context.popRoute();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
