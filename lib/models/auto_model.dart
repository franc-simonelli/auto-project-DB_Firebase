// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Auto {
  late String? id;
  late String costruttore;
  late String modello;
  late String immagine;
  late String? idCostruttore;

  Auto({
    this.id = "",
    this.costruttore = "",
    this.modello = "",
    this.immagine = "",
    this.idCostruttore,
  });

  Auto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    costruttore = json['costruttore'];
    modello = json['modello'];
    immagine = json['immagine'];
    idCostruttore = json['idCostruttore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['costruttore'] = this.costruttore;
    data['modello'] = this.modello;
    data['immagine'] = this.immagine;
    data['idCostruttore'] = this.idCostruttore;
    return data;
  }
}