import 'package:equatable/equatable.dart';
import 'package:ktp_firestore/value.dart';

class Region with EquatableMixin {
  final String address;
  final int rtNumber;
  final int rwNumber;
  final String kelurahanName;
  final String kecamatanName;

  const Region(
      {this.address,
      this.kecamatanName,
      this.kelurahanName,
      this.rtNumber,
      this.rwNumber});

  @override
  List<Object> get props => <Object>[
        address,
        rtNumber,
        rwNumber,
        kelurahanName,
        kecamatanName,
      ];

  static Region fromJson(Map data) {
    return Region(
        address: data[Value.PARAM_ADDRESS] as String ?? '',
        rtNumber: data[Value.PARAM_RT] as int ?? 0,
        rwNumber: data[Value.PARAM_RW] as int ?? 0,
        kecamatanName: data[Value.PARAM_KECAMATAN] as String ?? '',
        kelurahanName: data[Value.PARAM_KELURAHAN] as String ?? '');
  }

  static Map<String, dynamic> toMap(Region region) {
    return <String, dynamic>{
      Value.PARAM_ADDRESS : region.address,
      Value.PARAM_RT : region.rtNumber,
      Value.PARAM_RW : region.rwNumber,
      Value.PARAM_KELURAHAN : region.kelurahanName,
      Value.PARAM_KECAMATAN : region.kecamatanName
    };
  }
}
