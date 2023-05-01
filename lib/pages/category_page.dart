import 'package:flutter/material.dart';

const List<String> list = <String>['조회순', '가격순'];

class AnalogPage extends StatefulWidget {
  AnalogPage({Key? key}) : super(key: key);

  @override
  State<AnalogPage> createState() => _AnalogPageState();
}

class _AnalogPageState extends State<AnalogPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "한번 읽어봐주시라요!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("아날로그는 내책임아니라요!."),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        bottom: _tabMenu(),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _analogView(),
          _digitalView(),
        ],
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return TabBar(
      indicatorColor: const Color(0xffffc909),
      indicatorWeight: 1,
      controller: tabController,
      tabs: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "아날로그",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "디지털",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _analogView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Text(
                  "아날로그",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => _showModalBottomSheet(context),
                  child: const Icon(
                    Icons.help_outline,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 220,
                ),
                DropdownfilterButton(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
        ],
      ),
    );
  }

  Widget _digitalView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                Text(
                  "디지털",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  width: 265,
                ),
                DropdownfilterButton(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
          const TestRowWidget(),
        ],
      ),
    );
  }
}

class TestRowWidget extends StatelessWidget {
  const TestRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: 170,
              height: 170,
              color: Colors.red,
            ),
            const Text("제목등등"),
            const Text("price"),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          children: [
            Container(
              width: 170,
              height: 170,
              color: Colors.blue,
            ),
            const Text("제목등등"),
            const Text("price"),
          ],
        ),
      ],
    );
  }
}

class DropdownfilterButton extends StatefulWidget {
  const DropdownfilterButton({Key? key}) : super(key: key);

  @override
  State<DropdownfilterButton> createState() => _DropdownfilterButtonState();
}

class _DropdownfilterButtonState extends State<DropdownfilterButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 10,
      underline: Container(
        height: 2,
        color: Color(0xffffc909),
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
