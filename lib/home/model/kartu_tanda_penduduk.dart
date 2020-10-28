import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ktp_firestore/home/model/person.dart';
import 'package:ktp_firestore/home/model/region.dart';
import 'package:ktp_firestore/value.dart';
import 'package:uuid/uuid.dart';

enum Religion { ISLAM, KRISTEN, HINDU, BUDDHA }

class KartuTandaPenduduk extends Person {
  final String idKtp;

  final Region region;

  final String religion;

  final String statusKawin;

  final String pekerjaan;

  final String kewarganegaraan;

  final DateTime exp;

  KartuTandaPenduduk(
      {String nama,
      String golonganDarah,
      String jenisKelamin,
      String tanggalLahir,
      String tempatLahir,
      this.idKtp,
      this.region,
      this.religion,
      this.statusKawin,
      this.pekerjaan,
      this.kewarganegaraan,
      this.exp})
      : super(nama, golonganDarah, jenisKelamin, tanggalLahir, tempatLahir);

  @override
  List<Object> get props => super.props
    ..addAll(<Object>[
      idKtp,
      region,
      religion,
      statusKawin,
      pekerjaan,
      kewarganegaraan
    ]);

  static KartuTandaPenduduk fromJson(Map<String, dynamic> data) {
    return KartuTandaPenduduk(
        nama: data[Value.PARAMS_NAME] as String ?? '',
        golonganDarah: data[Value.PARAM_BLOOD_GROUP] as String ?? '',
        jenisKelamin: data[Value.PARAM_GENDER] as String ?? '',
        tanggalLahir: data[Value.PARAM_BIRTHDATE] != null && data.containsKey(Value.PARAM_BIRTHDATE) 
          ? DateTime.parse((data[Value.PARAM_BIRTHDATE] as Timestamp).toDate().toLocal().toIso8601String()).toString() : null,
          
        idKtp: data[Value.PARAM_ID_KTP] as String ?? '',
        region: Region.fromJson(data[Value.PARAM_REGION] as Map ?? <String, dynamic>{}),
        kewarganegaraan: data[Value.PARAM_CITIZENSHIP] as String ?? '',
        pekerjaan: data[Value.PARAM_JOB_STATUS] as String ?? '',
        religion: data[Value.PARAM_RELIGION] as String ?? '',
        statusKawin: data[Value.PARAM_STATUS_MARRIAGE] as String ?? '',
        tempatLahir: data[Value.PARAM_PLACE_OF_BIRTH] as String ?? '',
        exp: data[Value.PARAM_EXPIRED_DATE] != null &&
                data.containsKey(Value.PARAM_EXPIRED_DATE)
            ? DateTime.parse((data[Value.PARAM_EXPIRED_DATE] as Timestamp).toDate().toIso8601String())
            : null);
  }

  static Map<String, dynamic> toMap(KartuTandaPenduduk ktp) {
    final id = Uuid();

    return <String, dynamic>{
       Value.PARAMS_NAME: ktp.nama,
       Value.PARAM_BLOOD_GROUP: ktp.golonganDarah,
       Value.PARAM_GENDER: ktp.jenisKelamin,
       Value.PARAM_BIRTHDATE: DateTime.parse(ktp.tanggalLahir).toUtc(),
       Value.PARAM_ID_KTP: id.v1(),
       Value.PARAM_REGION: Region.toMap(ktp.region),
       Value.PARAM_CITIZENSHIP: ktp.kewarganegaraan,
       Value.PARAM_JOB_STATUS: ktp.pekerjaan,
       Value.PARAM_RELIGION: ktp.religion,
       Value.PARAM_STATUS_MARRIAGE: ktp.statusKawin,
       Value.PARAM_EXPIRED_DATE: DateTime.now().add(Duration(days: 365)).toUtc(),
       Value.PARAM_PLACE_OF_BIRTH: ktp.tempatLahir,
       Value.PARAM_CREATED_AT: DateTime.now().toUtc()
    };
  }
}
