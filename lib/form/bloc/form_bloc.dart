import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktp_firestore/form/form.dart';
import 'package:ktp_firestore/home/home.dart';
import 'package:ktp_firestore/home/model/region.dart';
import 'package:ktp_firestore/home/repository/home_repository_imp.dart';

class FormCubit extends Cubit<FormInputState> {
  HomeRepositoryImp homeRepositoryImp;

  FormCubit(HomeRepositoryImp homerepo) : super(FormInputState()){
    homeRepositoryImp = homerepo;
  }

  final _imp = FormRepositoryImp(FormService());

  @override
  void onChange(Change<FormInputState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }

  void setName(String name) => emit(state.copyWith(name: name));

  void setPlaceBirth(String place) => emit(state.copyWith(placeBirth: place));

  void setBirthDate(String birthDate) => emit(state.copyWith(birthDate: birthDate));

  void setGender(String gender) => emit(state.copyWith(gender: gender));

  void setAddress(String address) => emit(state.copyWith(address: address));

  void setRT(int rtNo) => emit(state.copyWith(rtNo: rtNo));

  void setRw(int rwNo) => emit(state.copyWith(rwNo: rwNo));

  void setKecamatan(String kecamatan) => emit(state.copyWith(kecamatan: kecamatan));

  void setKelurahan(String kelurahan) => emit(state.copyWith(kelurahan: kelurahan));

  void setReligion(String religion) => emit(state.copyWith(religion: religion));

  void setStatusKawin(String status) => emit(state.copyWith(statusKawin: status));

  void setJob(String job) => emit(state.copyWith(job: job));

  void setWarganegara(String wargaNegaraName) => emit(state.copyWith(warganegara: wargaNegaraName));

  void setGolonganDarah(String golDarah) => emit(state.copyWith(golDarah: state.golDarah));

  Future<void> submitButton() async {
    emit(state.copyWith(isSubmitUser: true));
    
    final region = Region(
      address: state.address,
      kecamatanName: state.kecamatan,
      kelurahanName: state.kelurahan,
      rtNumber: state.rtNo,
      rwNumber: state.rwNo
    );

    final ktp = KartuTandaPenduduk(
      nama: state.name,
      jenisKelamin: state.gender,
      kewarganegaraan: state.warganegara,
      pekerjaan: state.job,
      region: region,
      statusKawin: state.statusKawin,
      religion: state.religion,
      golonganDarah: state.golDarah,
      tanggalLahir: state.birthDate,
      tempatLahir: state.placeBirth
    );

    try {
      await _imp.addDataKTP(ktp);
      homeRepositoryImp.controller.add(ktp);
      return;
    } catch (e) {
      throw Exception(e);
    }
  }
}
