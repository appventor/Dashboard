import 'package:dashboard/pages/dashboard/model/MyFiles.dart';

import '../../../../pages.dart';
import 'calendar_timeline/calendar_timeline.dart';
import 'file_info_card.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    Key? key,
  }) : super(key: key);

  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(Duration(days: 5));
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        // CalendarTimeline(
        //   showYears: false,
        //   initialDate: _selectedDate,
        //   firstDate: DateTime(2021, 6, 1),
        //   lastDate: DateTime.now().add(Duration(days: 365)),
        //   onDateSelected: (date) {
        //     setState(() {
        //       _selectedDate = date!;
        //     });
        //   },
        //   leftMargin: 20,
        //   monthColor: Colors.white70,
        //   dayColor: Colors.teal[200],
        //   dayNameColor: Color(0xFF333A47),
        //   activeDayColor: Colors.white,
        //   activeBackgroundDayColor: Colors.redAccent[100],
        //   dotsColor: Color(0xFF333A47),
        //   selectableDayPredicate: (date) => date.day != 23,
        //   locale: 'en',
        // ),
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
