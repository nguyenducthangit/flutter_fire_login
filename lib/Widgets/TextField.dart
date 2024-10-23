import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;
  final FocusNode? focusNode;

  const Textfield({
    super.key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.icon,
    this.focusNode,
  });

  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    // Listen for changes in the text field
    widget.textEditingController.addListener(() {
      setState(() {}); // This will trigger a rebuild when text changes
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.textEditingController,
        obscureText: widget.isPass && !_isPasswordVisible,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 20),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black45,
          ),
          filled: true,
          fillColor: Color(0xFFedf0f8),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          suffixIcon:
              widget.isPass && widget.textEditingController.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black45,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    )
                  : null,
        ),
      ),
    );
  }
}
