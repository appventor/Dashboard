import '../../../../pages.dart';

class SelectWarehouse extends StatefulWidget {
  const SelectWarehouse({Key? key}) : super(key: key);

  @override
  _SelectWarehouseState createState() => _SelectWarehouseState();
}

class _SelectWarehouseState extends State<SelectWarehouse> {
  String _warehouse = 'Kavoor';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _warehouse,
      //elevation: 5,
      elevation: 20,
      iconEnabledColor: Colors.white,
      items: <String>[
        'Kavoor',
        'Kulai',
        'Hampankatta',
        'Attavar',
        'Kankanadi',
        'Kadri',
        'Kuntikan',
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
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onChanged: (String? value) {
        setState(() {
          _warehouse = value ?? '';
        });
      },
    );
  }
}
