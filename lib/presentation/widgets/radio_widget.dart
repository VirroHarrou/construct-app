import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    super.key,
    required this.onChanged,
  });
  final ValueSetter<String> onChanged;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late int selected;
  final List<_ButtonData> icons = [
    _ButtonData(Icons.all_inclusive_outlined, "Все"),
    _ButtonData(Icons.remove_circle, "Я заказчик"),
    _ButtonData(Icons.add_box, "Я исполнитель"),
  ];

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowList = [];
    for (int i = 0; i <= 2; i++) {
      final item = icons[i];
      rowList.add(
        CustomRadioButton(
          onPressed: () {
            if (selected == i) return;
            setState(() {
              selected = i;
            });
            widget.onChanged(item.value);
          },
          icon: item.icon,
          label: item.value,
          active: selected == i,
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowList,
    );
  }
}

class CustomRadioButton<String> extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final Color activeColor;
  final bool active;
  final String label;

  const CustomRadioButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.active,
    this.color = const Color(0xFF4285F4),
    this.activeColor = const Color(0xFFEAF2FF),
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: widget.active
                  ? Theme.of(context).colorScheme.primary
                  : Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              widget.icon,
              color: widget.active ? widget.activeColor : widget.color,
            ),
          ),
        ),
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _ButtonData {
  final IconData icon;
  final String value;

  _ButtonData(this.icon, this.value);
}
