import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore/model/student.dart';

class FirestoreService {
  static final FirestoreService _firestoreService =
      FirestoreService._internal();
  Firestore _db = Firestore.instance;

  FirestoreService._internal();

  factory FirestoreService() {
    return _firestoreService;
  }

  Stream<List<Student>> getStudents() {
    var dd = _db.collection('students').snapshots().map(
          (snapshot) => snapshot.documents
              .map((doc) => Student.fromMap(doc.data, doc.documentID))
              .toList(),
        );
    return dd;
  }

  Future<void> addStudent(Student student) {
    return _db.collection('students').add(student.toMap());
  }

  Future<void> deleteStudent(String id) {
    return _db.collection('students').document(id).delete();
  }

  Future<void> updateStudent(Student student) {
    return _db
        .collection('students')
        .document(student.id)
        .updateData(student.toMap());
  }
}
