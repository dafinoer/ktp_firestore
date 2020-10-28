import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ktp_firestore/common/remote/base_remote.dart';
import 'package:ktp_firestore/home/home.dart';

class FormService extends BaseRemote {
  FormService() : super(FirebaseFirestore.instance.collection('citizen'));

  Future<void> add(KartuTandaPenduduk ktp) async {
    final ktpMap = KartuTandaPenduduk.toMap(ktp);
    await create(ktpMap);
    return;
  }
}
