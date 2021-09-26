import 'package:bayt_test_app/helpers/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            translate('homeScreen.filterButton'),
            style:  TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.textSizeSmall,
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
