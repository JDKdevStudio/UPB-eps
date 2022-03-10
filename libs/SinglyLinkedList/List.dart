import '../patient.dart';
import 'Node.dart';

class SinglyLinkedList {
  //Properties
  Node? head;
  Node? tail;

  ///Inicia una lista vacía o con objetos definidos
  SinglyLinkedList([List<Patient>? objects]) {
    if (objects != null) {
      addAll(objects);
    } else {
      this.head = null;
      this.tail = null;
    }
  }

  ///Añade un objeto al final de la lista o después del nodo especificado
  void add(Patient object, [Node? node]) {
    //Add object next to node reference
    if (node != null) {
      node.next = new Node(object, node.next);
      //Actualiza la cola si el nodo de referencia es la cola
      if (node.next?.next == null) {
        this.tail = node.next?.next;
      }
    } else {
      //Add object
      if (isEmpty()) {
        this.head = new Node(object);
        this.tail = this.head;
      } else {
        this.tail?.next = new Node(object);
        this.tail = this.tail?.next;
      }
    }
  }

  ///Añadir una lista de objetos al final de la lista
  void addAll(List<Patient> objects, [Node? node]) {
    if (node != null) {
      objects = objects.reversed.toList();
    }
    objects.forEach((element) {
      add(element, node);
    });
  }

  ///Añadir nodo al principio de la lista
  void addFirst(Patient object) {
    if (isEmpty()) {
      add(object);
    } else {
      this.head = new Node(object, head);
    }
  }

  ///Añadir nodo al final de la lista
  void addLast(Patient object) {
    add(object);
  }

  ///Vaciar lista
  void clear() {
    this.head = null;
    this.tail = null;
  }

  ///Clonar lista en una nueva instancia
  SinglyLinkedList clone() {
    Node? tempNode = this.head;
    SinglyLinkedList clonedList = new SinglyLinkedList();
    while (tempNode != null) {
      clonedList.add(tempNode.object);
      tempNode = tempNode.next;
    }
    return clonedList;
  }

  ///Un objeto está dentro de la lista // true or false
  bool contains(Patient? object) {
    Node? tempNode = this.head;
    do {
      if (tempNode?.object.toString() == object.toString()) {
        return true;
      }
      tempNode = tempNode?.next;
    } while (tempNode != null);
    return false;
  }

  ///Varios objetos están dentro de la lista -> input as list //true or false
  bool containsAll(List<Patient> objects) {
    for (Patient item in objects) {
      if (contains(item) != true) {
        return false;
      }
    }
    return true;
  }

  ///Devuelve el nodo del elemento especificado, o null si no contiene el elemento
  Node? nodeOf(Patient object) {
    Node? tempNode = this.head;
    if (contains(object) == true) {
      while (
          tempNode != null && tempNode.object.toString() != object.toString()) {
        tempNode = tempNode.next;
      }
    }
    return tempNode;
  }

  ///Compara si un objeto es igual a la lista //true or false
  bool isEquals(Object object) {
    if (this.toString() == object.toString()) {
      return true;
    } else {
      return false;
    }
  }

  ///Preguntar si la lista tiene nodos //true or false
  bool isEmpty() {
    return head == null;
  }

  ///Obtiene un objeto de la lista
  Object? get([Node? node]) {
    if (node != null) {
      return node.object;
    }
    return this.tail?.object;
  }

  ///Obtiene el nodo anterior al especificado
  Object? getPrevious(Node? node) {
    Node? tempNode = this.head;
    while (tempNode?.next != node) {
      tempNode = tempNode?.next;
      if (tempNode == null) {
        return null;
      }
    }
    return tempNode;
  }

  ///Obtener elemento siguiente al nodo específico
  Object? getNext(Node? nodo) {
    return nodo?.next?.object;
  }

  ///Devuelve el principio de la lista
  Object? getFirst() {
    return this.head?.object;
  }

  ///Devuelve el final de la lista
  Object? getLast() {
    return this.tail?.object;
  }

  ///Devuelve el número de elementos de esta lista
  int size() {
    Node? tempNode = this.head;
    int tempIndex = 0;
    while (tempNode != null) {
      tempIndex++;
      tempNode = tempNode.next;
    }
    return tempIndex;
  }

  ///Eliminar el nodo por referencia de objeto -> mi mejor creación dou
  void remove(Patient? object) {
    if (contains(object)) {
      //Remover un elemento restante
      if (this.head == this.tail) {
        clear();
        //Remover la cabeza
      } else if (object.toString() == this.head?.object.toString()) {
        this.head = this.head?.next;
        //Remover la cola
      } else if (object.toString() == this.tail?.object.toString()) {
        Node? tempNode = this.head;
        while (tempNode?.next != this.tail) {
          tempNode = tempNode?.next;
        }
        tempNode?.next = null;
        this.tail = tempNode;
        //Remover objetos intermedios
      } else {
        Node? tempNode = this.head;
        while (tempNode?.next?.object.toString() != object.toString()) {
          tempNode = tempNode?.next;
        }
        tempNode?.next = tempNode.next?.next;
      }
    }
  }

  ///Eliminar elementos de una lista -> input as list
  void removeAll(List<Patient> objects) {
    for (Patient item in objects) {
      remove(item);
    }
  }

  ///Conserva solo los elementos de esa lista que están contenidos en la colección especificada
  void retainAll(List<Patient> objects) {
    List<Patient> removeObjects = [];
    Node? tempNode = this.head;
    while (tempNode != null) {
      if (objects.contains(tempNode.object) == false) {
        removeObjects.add(tempNode.object);
      }
      tempNode = tempNode.next;
    }
    removeAll(removeObjects);
  }

  ///Reemplaza el elemento en la posición del nodo especificado
  void set(Node? nodo, Object object) {
    nodo?.object = object;
  }

  ///Devuelve una sublista entre dos nodos
  SinglyLinkedList subList(Node? from, Node? to) {
    Node? tempNode = from;
    SinglyLinkedList subList = new SinglyLinkedList();
    while (tempNode != null && tempNode != to?.next) {
      subList.add(tempNode.object);
      tempNode = tempNode.next;
    }
    return subList;
  }

  ///Devuelve un array de  los elementos
  Object toArray() {
    Node? tempNode = this.head;
    List<Object> arrayList = [];
    while (tempNode != null) {
      arrayList.add(tempNode.object);
      tempNode = tempNode.next;
    }
    return arrayList;
  }

  void sort() {
    if (!isEmpty()) {
      Node? tempNode = this.head;
      List<Patient> sortList = [];
      do {
        sortList.add(tempNode!.object);
        tempNode = tempNode.next;
      } while (tempNode != null);
      clear();
      sortList.sort(
        (a, b) => a.toString().length.compareTo(b.toString().length),
      );
      addAll(sortList);
    }
  }

  @override
  String toString() {
    // ignore: todo
    // TODO: implement toString
    String fixedString = "SinglyLinkedList [ null ]";
    if (isEmpty()) {
      return fixedString;
    } else {
      Node? tempNode = this.head;
      fixedString = "SinglyLinkedList [";
      while (tempNode != null) {
        fixedString = fixedString + " $tempNode";
        tempNode = tempNode.next;
      }
      fixedString = fixedString + " ]";
    }
    return fixedString;
  }
}
