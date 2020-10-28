import 'package:equatable/equatable.dart';

class FormInputState extends Equatable {
  const FormInputState(
      {this.name = '',
      this.address,
      this.birthDate,
      this.gender,
      this.job,
      this.kecamatan,
      this.kelurahan,
      this.placeBirth,
      this.religion,
      this.rtNo,
      this.rwNo,
      this.statusKawin,
      this.warganegara,
      this.golDarah,
      this.isSubmit = false
      });

  final String name;
  final String placeBirth;
  final String birthDate;
  final String gender;
  final String address;
  final int rtNo;
  final int rwNo;
  final String kecamatan;
  final String kelurahan;
  final String religion;
  final String statusKawin;
  final String job;
  final String warganegara;
  final String golDarah;
  final bool isSubmit;

  @override
  List<Object> get props => <Object>[
        name,
        placeBirth,
        birthDate,
        gender,
        address,
        rtNo,
        rwNo,
        kecamatan,
        kelurahan,
        religion,
        statusKawin,
        job,
        warganegara,
        golDarah,
        kelurahan,
        isSubmit,
      ];

  FormInputState copyWith({
    String name,
    String placeBirth,
    String birthDate,
    String gender,
    String address,
    int rtNo,
    int rwNo,
    String kecamatan,
    String kelurahan,
    String religion,
    String statusKawin,
    String job,
    String warganegara,
    String golDarah,
    bool isSubmitUser
  }) {
    return FormInputState(
      name: name ?? this.name,
      placeBirth: placeBirth ?? this.placeBirth,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      rtNo: rtNo ?? this.rtNo,
      rwNo: rwNo ?? this.rwNo,
      kecamatan: kecamatan ?? this.kecamatan,
      kelurahan: kelurahan ?? this.kelurahan,
      religion:  religion ?? this.religion,
      statusKawin: statusKawin ?? this.statusKawin,
      address: address ?? this.address,
      job: job ?? this.job,
      warganegara: warganegara ?? this.warganegara,
      golDarah: golDarah ?? this.golDarah,
      isSubmit: isSubmitUser ?? this.isSubmit,
    );
  }
}
