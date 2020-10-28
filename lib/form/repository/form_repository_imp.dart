import 'dart:async';

import 'package:ktp_firestore/form/form.dart';
import 'package:ktp_firestore/form/repository/form_repository.dart';
import 'package:ktp_firestore/home/model/kartu_tanda_penduduk.dart';

class FormRepositoryImp extends FormRepository{
  FormService _service;

  FormRepositoryImp(this._service);

  @override
  Future<void> addDataKTP(KartuTandaPenduduk ktp) async {
    await _service.add(ktp);
    return;
  }

}