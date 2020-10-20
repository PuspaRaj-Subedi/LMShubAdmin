import 'package:LMShubAdmin/models/borrow.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BorrowDialog {
  BuildContext context;
  Borrow borrow;
  String book;
  ValueChanged<Borrow> onChanged;
  GlobalKey<FormState> _commentFormKey = new GlobalKey<FormState>();

  BorrowDialog({this.context, this.book, this.borrow, this.onChanged}) {
    borrow.book = book;
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
//            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            titlePadding: EdgeInsets.fromLTRB(16, 25, 16, 0),
            title: Row(
              children: <Widget>[
                Icon(
                  Icons.comment,
                  color: Theme.of(context).hintColor,
                ),
                SizedBox(width: 10),
                Text(
                  "Add Feedback",
                  style: Theme.of(context).textTheme.body2,
                )
              ],
            ),
            children: <Widget>[
              Form(
                key: _commentFormKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: new TextFormField(
                        style: TextStyle(color: Theme.of(context).hintColor),
                        keyboardType: TextInputType.text,
                        decoration: getInputDecoration(
                            hintText: "Add Quantity", labelText: "Quantity"),
                        validator: (input) => input.trim().length > 1
                            ? "Should be less than 9"
                            : null,
                        onSaved: (input) => borrow.quantity = input,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  ),
                  MaterialButton(
                    onPressed: _submit,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              SizedBox(height: 10),
            ],
          );
        });
  }

  InputDecoration getInputDecoration({String hintText, String labelText}) {
    return new InputDecoration(
      hintText: hintText,
      labelText: labelText,
      hintStyle: Theme.of(context).textTheme.bodyText2.merge(
            TextStyle(color: Theme.of(context).focusColor),
          ),
      enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hintColor)),
      labelStyle: Theme.of(context).textTheme.bodyText2.merge(
            TextStyle(color: Theme.of(context).hintColor),
          ),
    );
  }

  void _submit() {
    if (_commentFormKey.currentState.validate()) {
      _commentFormKey.currentState.save();
      onChanged(borrow);
      Navigator.pop(context);
    }
  }
}
