import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../extension/extension.dart';

enum ButtonType { save, newButton, delete, cancel }


class MLabel extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MLabel(
      {Key? key,
        required this.title,
        this.fontSize,
        this.color,
        this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class MButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final Icon? icon;
  final ButtonType? type;
  final Color? color;
  final EdgeInsets? padding;

  const MButton(
      {Key? key,
        this.title,
        required this.onTap,
        this.color,
        this.icon,
        this.padding,
        this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              color ??
                  (type == ButtonType.save
                      ? Colors.green
                      : type == ButtonType.cancel
                      ? Colors.deepOrangeAccent
                      : type == ButtonType.delete
                      ? Colors.redAccent
                      : type == ButtonType.newButton
                      ? Colors.blue
                      : Colors.transparent),
            ),
            padding: MaterialStateProperty.all(
                padding ?? const EdgeInsets.all(22.0))),
        child: type != null
            ? Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                Icon(
                  type == ButtonType.save
                      ? Icons.save
                      : type == ButtonType.cancel
                      ? Icons.cancel
                      : type == ButtonType.delete
                      ? Icons.delete
                      : type == ButtonType.newButton
                      ? Icons.add
                      : Icons.help_center,
                  size: 18.0,
                ),
            const SizedBox(
              width: 5.0,
            ),
            title != null
                ? title!.toLabel()
                : type == ButtonType.save
                ? 'Save'.toLabel()
                : type == ButtonType.cancel
                ? 'Cancel'.toLabel()
                : type == ButtonType.delete
                ? 'Delete'.toLabel()
                : type == ButtonType.newButton
                ? 'New'.toLabel()
                : '$title'.toLabel(),
          ],
        )
            : icon != null
            ? Row(
          children: [
            icon!,
            const SizedBox(
              width: 5.0,
            ),
            '$title'.toLabel()
          ],
        )
            : title?.toLabel());
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notEmpty;
  final TextEditingController? controller;
  const MEdit(
      {Key? key,
        required this.hint,
        this.notEmpty = false,
        this.onChange,
        this.autoFocus = false,
        this.password = false,
        this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            gapPadding: 20.0,
          ),
          labelText: hint,
          labelStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.0)),
      obscureText: password,
      validator: (value) {
        if ((value ?? '').isEmpty && this.notEmpty) {
          return 'cannot be empty';
        }
      },
    );
  }
}

class MTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  const MTextButton({Key? key,required this.title,required this.onPressed,this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: title.toLabel(color: color));
  }
}


class MError extends StatelessWidget {
  final Exception exception;
  const MError({Key? key,required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(25.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12.0)
      ),
      child: exception.toString().toLabel(color: Colors.white,bold: true),
    );
  }
}

class MWaiting extends StatelessWidget {
  const MWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoActivityIndicator().center;
  }
}

class MSideBarItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback onPressed;
  final int value;
  final bool selected;
  const MSideBarItem({Key? key,required this.title,required this.icon,required this.onPressed,this.value = 0,this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      selectedTileColor: Colors.grey.shade100,
      selectedColor: Colors.grey.shade200,
      title: title.toLabel(fontSize: 15.0,color: Colors.grey.shade500),
      trailing: (value > 0) ? CircleAvatar(backgroundColor: Colors.pink,radius: 12.0,child: '$value'.toLabel(fontSize: 10.0),): null,
      leading: icon,
      onTap: onPressed,
    );
  }
}

