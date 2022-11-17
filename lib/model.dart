class Model {
  String judul;
  int nominal;
  String selectedValue;
  DateTime waktu;
  Model(this.judul, this.nominal, this.selectedValue, this.waktu);
}

class ModelList {
  static List<Model> list = [];
}
