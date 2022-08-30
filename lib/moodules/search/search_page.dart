import 'package:flutter/material.dart';

import '../../shared/widgets/footer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    print('oxii');
    return Scaffold(
      body: Row(
        children: [
          Footer(),
          Text(' Searchhhh '),
        ],
      ),
    );
  }
}
