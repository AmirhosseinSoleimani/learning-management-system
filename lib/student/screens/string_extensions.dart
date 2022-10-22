
extension StringExtensions on String{
  bool isValidEmail(){
    return RegExp('').hasMatch(this);
  }
  bool isWhitespace() => trim().isEmpty;

  bool isValidDouble() => double.tryParse(this) != null;

  bool isValidInt() => int.tryParse(this) != null;
}