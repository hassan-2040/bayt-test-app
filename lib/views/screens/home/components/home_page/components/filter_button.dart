import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // splashColor: Colors.grey,
        child: const Padding(
          padding: EdgeInsets.all(7.0),
          child: Text(
            'Filters',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }
}
