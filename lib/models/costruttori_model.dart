// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Costruttori {
  late String? id;
  late String nome;
  late String nazione;
  late String logo;
  late String annoFondazione;
  late String descrizione;

  Costruttori({
    this.id = "",
    this.nome = "",
    this.nazione = "",
    this.logo = "",
    this.annoFondazione = "",
    this.descrizione = ""
  });

  Costruttori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    nazione = json['nazione'];
    logo = json['logo'];
    annoFondazione = json['annoFondazione'];
    descrizione = json['descrizione'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['paese'] = this.nazione;
    data['logo'] = this.logo;
    data['annoFondazione'] = this.annoFondazione;
    data['descrizione'] = this.descrizione;
    return data;
  }
}