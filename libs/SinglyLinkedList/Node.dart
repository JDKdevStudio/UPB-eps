import '../patient.dart';

class Node {
  //Properties
  Patient _object;
  Node? next;

  //Gets & Sets
  Patient get object => _object;
  set object(object) => _object = object;

  //Constructores
  Node(this._object, [this.next]);

  //Métodos
  @override
  String toString() {
    // ignore: todo
    // TODO: implement toString
    return "{Object= $_object, Next= ${next?.object}}";
  }
}
