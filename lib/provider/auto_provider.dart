// ignore_for_file: unnecessary_new

import 'package:autoproject/models/auto_model.dart';
import 'package:autoproject/models/costruttori_model.dart';
import 'package:autoproject/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class AutoProvider extends ChangeNotifier {

  List<Auto> _listaAuto = [];
  List<Costruttori> _listaCostruttori = [];
  Costruttori _costruttoreScelto = new Costruttori();
  bool _loading = true;
  CollectionReference dbCostruttori = FirebaseFirestore.instance.collection('costruttori');
  // CollectionReference dbAuto = FirebaseFirestore.instance.collection('auto');


  List<Auto> get getlistaAuto => _listaAuto;
  List<Costruttori> get getListaCostruttori => _listaCostruttori;
  Costruttori get costruttoreScelto => _costruttoreScelto;
  bool get loading => _loading;

  setCostruttore(costruttore) {
    _costruttoreScelto = costruttore;
    getAutoByIdCostruttore();
  }

  getAutoByIdCostruttore() async {
    _loading = true;
    _listaAuto = [];
    // _listaAuto = listaAuto.where((element) => element.idCostruttore == _costruttoreScelto.id).toList();
    
    await FirebaseFirestore.instance
      .collection('auto')
      .where('idCostruttore', isEqualTo: _costruttoreScelto.id)
      .get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          Auto auto = new Auto(id: doc.reference.id, modello: doc['modello'], immagine: doc['immagine'], idCostruttore: doc['idCostruttore']);
          _listaAuto.add(auto);
        });
      });
    _loading = false;
    notifyListeners();  
  }

  Future getAllCostruttori() async {
    
    _listaCostruttori = [];
    await FirebaseFirestore.instance
      .collection('costruttori')
      .get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) { 
          Costruttori costruttore = new Costruttori(id: doc.reference.id, nome: doc['nome'], nazione: doc['nazione'], logo: doc['logo'], annoFondazione: doc['annoFondazione'], descrizione: doc['descrizione']);
          
          print(doc.reference.id);
          _listaCostruttori.add(costruttore);
          
        });
      });
    _listaCostruttori.sort(((a, b) => a.nome.compareTo(b.nome)));
    _loading = false;
    notifyListeners();
  }

  Future addCostruttore() async {
    _loading = true;
    notifyListeners();
    await dbCostruttori.add(
      {
        'nome': 'Alfa Romeo',
        'nazione': 'Italia',
        'logo': 'contents/images/alfa_romeo_logo.png',
        'annoFondazione': '1910'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Audi',
        'nazione': 'Germania',
        'logo': 'contents/images/audi_logo.png',
        'annoFondazione': '1909'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'BMW',
        'nazione': 'Germania',
        'logo': 'contents/images/bmw_logo.png',
        'annoFondazione': '1916'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Ferrari',
        'nazione': 'Italia',
        'logo': 'contents/images/ferrari_logo.png',
        'annoFondazione': '1947'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Ford',
        'nazione': 'USA',
        'logo': 'contents/images/ford_logo.png',
        'annoFondazione': '1903'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Lamborghini',
        'nazione': 'Italia',
        'logo': 'contents/images/lamborghini_logo.png',
        'annoFondazione': '1963'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Mercedes',
        'nazione': 'Germania',
        'logo': 'contents/images/mercedes_logo.png',
        'annoFondazione': '1926'
      }
    );
    await dbCostruttori.add(
      {
        'nome': 'Porsche',
        'nazione': 'Germania',
        'logo': 'contents/images/porsche_logo.png',
        'annoFondazione': '1931'
      }
    );

    getAllCostruttori();
  }


}