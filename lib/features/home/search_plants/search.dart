import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_provider.dart';

class SearchWidget extends StatefulWidget {
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  late String queryText = "";

  void searchPlantFunc(String newQuery) {
    if (queryText != newQuery) {
      setState(() {
        Provider.of<HomeProvider>(context, listen: false)
            .searchPlants(newQuery);
        queryText = newQuery;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(
      fontSize: 18,
      color: Color(0xff757575),
    );

    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: style.color,
          ),
          suffixIcon: queryText.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    searchPlantFunc("");
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: searchPlantFunc,
      ),
    );
  }
}
