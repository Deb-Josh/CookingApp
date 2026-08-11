extension StringExtension on String{

  String capitalize(){
    return (isEmpty) ? this : this[0].toUpperCase() + substring(1);
  }

  String capitalizeAll(){
    List<String> tabString = split(" ");
    return tabString.map((str) => str.capitalize()).toList().join(" ");
  }

}