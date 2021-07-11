import '../../../../../pages.dart';

class ChooseAttribute extends StatefulWidget {
  final String title;
  final Function onAdd;
  const ChooseAttribute({Key? key, required this.title, required this.onAdd})
      : super(key: key);

  @override
  _ChooseAttributeState createState() => _ChooseAttributeState();
}

class _ChooseAttributeState extends State<ChooseAttribute> {
  String _chosenValue = 'Android';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Row(
            children: [
              DropdownButton<String>(
                focusColor: Colors.white,
                value: _chosenValue,
                //elevation: 5,
                elevation: 20,
                iconEnabledColor: Colors.white,
                items: <String>[
                  'Android',
                  'IOS',
                  'Flutter',
                  'Node',
                  'Java',
                  'Python',
                  'PHP',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Please choose a langauage",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _chosenValue = value ?? '';
                  });
                },
              ),
              Spacer(),
              OutlinedButton(
                  onPressed: () => widget.onAdd(), child: Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}
