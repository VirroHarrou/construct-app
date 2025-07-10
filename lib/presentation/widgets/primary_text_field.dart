import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTextField extends StatefulWidget {
  final double? height;
  final String? label;
  final bool marked;
  final TextEditingController textEditingController;
  final String? hintText;
  // final TextStyle hintStyle;
  final FocusNode? focusNode;
  final int? maxLength;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType keyboardType;
  final int maxLines;
  final bool obscureText;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;

  const PrimaryTextField({
    super.key,
    this.height,
    this.label,
    this.focusNode,
    required this.textEditingController,
    this.hintText,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    // this.hintStyle = const TextStyle(
    //   fontSize: 16,
    //   fontWeight: FontWeight.w400,
    //   color: AppColors.primaryLight,
    // ),
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.marked = false,
    this.inputFormatters,
    this.textCapitalization,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  int symbolsInput = 0;

  @override
  void initState() {
    super.initState();
    symbolsInput = widget.textEditingController.text.length;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (widget.label != null)
              ? Row(
                  children: [
                    Text(
                      widget.label!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widget.marked
                        ? Text(
                            '*',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : const Center(),
                  ],
                )
              : const SizedBox(),
          (widget.label != null)
              ? const SizedBox(
                  height: 8,
                )
              : const SizedBox(),
          Stack(
            children: [
              TextFormField(
                focusNode: widget.focusNode,
                controller: widget.textEditingController,
                keyboardType: widget.keyboardType,
                cursorColor: Colors.black,
                obscureText: widget.obscureText,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.sentences,
                maxLines: widget.maxLines,
                minLines: (widget.height != null) ? widget.height! ~/ 30 : 1,
                autofocus: widget.autofocus,
                onChanged: (str) {
                  if (widget.onChanged != null) widget.onChanged!(str);
                  setState(() {
                    symbolsInput = str.length;
                  });
                },
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  hintText: widget.hintText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      width: 1,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      width: 1,
                    ),
                  ),
                ),
              ),
              if (widget.maxLength != null) ...[
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Text(
                    '$symbolsInput/${widget.maxLength}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              ],
            ],
          ),
        ],
      ),
    );
  }
}
