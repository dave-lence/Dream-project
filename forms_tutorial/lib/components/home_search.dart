import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.grey.shade500,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.grey.shade200)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.grey.shade200)),
                hintStyle: TextStyle(color: Colors.grey.shade500),
                hintText: "Ex. Veggie Bugger",
                filled: true,
                fillColor: Colors.grey.shade200),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          height: 60,
          width: 60,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_input_component,
                color: Colors.grey.shade500,
              )),
        )
      ],
    );
  }
}

