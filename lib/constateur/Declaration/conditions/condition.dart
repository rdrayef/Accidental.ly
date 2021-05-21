class Condition {
  String id;
  String libelle;
  Condition(String id, String libelle) {
    this.id = id;
    this.libelle = libelle;
  }
  @override
  String toString() {
    return id + " " + libelle;
  }
}
