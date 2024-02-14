import 'package:flutter/material.dart';
import 'package:flutter_demo_task/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDown extends StatelessWidget {
  const DropDown({super.key,required this.items,required this.isValid, required this.initialValue, required this.onChange});

    final List<String?> items;
    final bool isValid;
    final String initialValue;
    final Function (String)? onChange;

    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: isValid ? Border.all(color: TaskColors.dropdownColor) : Border.all(color: TaskColors.statusRedBackground)
        ),
        child: DropdownButton(
          isExpanded: true,
          padding: const EdgeInsets.only(left: 5),
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(
            height: 0,
          ),
          value: initialValue != '' ? initialValue : null,
          items:  items.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item!,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )).toList(),

          onChanged:(value){
              if(onChange != null){
                onChange!(value!);
              }
          },
          borderRadius: BorderRadius.circular(10),

          hint: Text("Select",style: GoogleFonts.lato(fontSize: 14,color: TaskColors.dropdownTextColor,)),
        ),
      );
    }
}
