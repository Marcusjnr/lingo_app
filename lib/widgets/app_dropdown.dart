import 'package:flutter/material.dart';
import 'package:lingo_app/styles/styles.dart';

class AppDropdownButton<T> extends StatelessWidget {
  // final List<T> items;
  final List<DropdownMenuItem<T>> items;
  final T value;
  final Function(T) onChanged;
  final String labelText;
  final Widget hint;
  final bool isLoading;
  final Widget icon;

  const AppDropdownButton({
    Key key,
    @required this.items,
    @required this.value,
    @required this.onChanged,
    this.labelText,
    this.hint,
    this.icon,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText.isNotEmpty)
            Text(
              labelText,
              style: TextStyle(
                color: appDark.withOpacity(.8),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          DropdownButtonHideUnderline(
            child: Container(
              height: 55,
              padding: EdgeInsets.only(left: 8, right: 6),
              margin: EdgeInsets.only(
                bottom: 13,
                top: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: appDark.withOpacity(.1),
                  width: 2,
                ),
              ),
              child: DropdownButton<T>(
                icon: icon,
                isExpanded: true,
                value: value,
                onChanged: onChanged,
                items: items,
              ),
            ),
          ),
        ],
      ),
    );
  }
}