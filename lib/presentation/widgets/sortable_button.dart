import 'package:flutter/material.dart';

class SortableItem {
  final IconData icon;
  final String label;
  final String sortOrder;

  const SortableItem({
    required this.icon,
    required this.label,
    required this.sortOrder,
  });

  SortableItem copyWith({
    IconData? icon,
    String? label,
    String? sortOrder,
  }) {
    return SortableItem(
      icon: icon ?? this.icon,
      label: label ?? this.label,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
}

class SortableButtonRow extends StatelessWidget {
  final List<SortableItem> items;
  final Function(int index) onItemPressed;

  const SortableButtonRow({
    super.key,
    required this.items,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return _buildSortableButton(
          context: context,
          item: item,
          onPressed: () => onItemPressed(index),
        );
      }),
    );
  }

  Widget _buildSortableButton({
    required BuildContext context,
    required SortableItem item,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFEAF2FF),
                ),
                padding: const EdgeInsets.all(13),
                child: Icon(
                  item.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              if (item.sortOrder != 'null')
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    item.sortOrder == 'asc'
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            item.label,
            style: TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
  }
}
