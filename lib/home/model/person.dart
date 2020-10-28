import 'package:equatable/equatable.dart';

class Person with EquatableMixin {
  final String nama;
  final String tempatLahir;
  final String tanggalLahir;
  final String golonganDarah;
  final String jenisKelamin;

  const Person(
      this.nama, this.golonganDarah, this.jenisKelamin, this.tanggalLahir, this.tempatLahir);

  @override
  List<Object> get props => <Object>[nama, tanggalLahir, golonganDarah, jenisKelamin, tempatLahir];
}
