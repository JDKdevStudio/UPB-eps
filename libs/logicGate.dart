import 'dart:io';

import 'SinglyLinkedList/List.dart';
import 'SinglyLinkedList/Node.dart';

import 'interface.dart';
import 'patient.dart';

//AÑADIR PACIENTES--------------------------------------------------------------
//Añadir paciente al inicio-----------------------------------------------------
addpacienteFirst(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");

  print("\n Escriba el documento de identificación del paciente:");
  String id = stdin.readLineSync()!;

  print("\n Escriba los nombres del paciente:");
  String firstName = stdin.readLineSync()!;

  print("\n Escriba los apellidos del paciente:");
  String lastName = stdin.readLineSync()!;

  print("\n Escriba el sexo del paciente:");
  String sex = stdin.readLineSync()!;

  print("\n Escriba la clínica del paciente");
  String clinica = stdin.readLineSync()!;

  print("\n Escriba el status del pacicente:");
  String status = stdin.readLineSync()!;

  Patient addPatient =
      new Patient(id, firstName, lastName, sex, clinica, status);
  list.addFirst(addPatient);

  print("\x1B[2J\x1B[0;0H");
  print("Paciente agregado con éxito.....");
  sleep(const Duration(seconds: 1));
  menu();
}

//Añadir paciente al final------------------------------------------------------
addpacienteLast(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");

  print("\n Escriba el documento de identificación del paciente:");
  String id = stdin.readLineSync()!;

  print("\n Escriba los nombres del paciente:");
  String firstName = stdin.readLineSync()!;

  print("\n Escriba los apellidos del paciente:");
  String lastName = stdin.readLineSync()!;

  print("\n Escriba el sexo del paciente:");
  String sex = stdin.readLineSync()!;

  print("\n Escriba la clínica del paciente");
  String clinica = stdin.readLineSync()!;

  print("\n Escriba el status del pacicente:");
  String status = stdin.readLineSync()!;
  Patient addPatient =
      new Patient(id, firstName, lastName, sex, clinica, status);
  list.add(addPatient);

  print("\x1B[2J\x1B[0;0H");
  print("Paciente agregado con éxito.....");
  sleep(const Duration(seconds: 1));
  menu();
}

//Añadir paciente entre otros---------------------------------------------------
addpacienteBetween(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");

  print(
      "\n Escriba el ID de registro para agregar al paciente después del mismo:");
  String search = stdin.readLineSync()!;

  print("\n Escriba el documento de identificación del paciente:");
  String id = stdin.readLineSync()!;

  print("\n Escriba los nombres del paciente:");
  String firstName = stdin.readLineSync()!;

  print("\n Escriba los apellidos del paciente:");
  String lastName = stdin.readLineSync()!;

  print("\n Escriba el sexo del paciente:");
  String sex = stdin.readLineSync()!;

  print("\n Escriba la clínica del paciente");
  String clinica = stdin.readLineSync()!;

  print("\n Escriba el status del pacicente:");
  String status = stdin.readLineSync()!;

  Node? tempNode = list.head;
  while (tempNode?.object.id.toString() != search && tempNode != null) {
    tempNode = tempNode.next;
  }
  Patient addPatient =
      new Patient(id, firstName, lastName, sex, clinica, status);

  list.add(addPatient, tempNode);

  print("\x1B[2J\x1B[0;0H");
  print("Paciente agregado con éxito.....");
  sleep(const Duration(seconds: 1));
  menu();
}

//BORRAR PACIENTES--------------------------------------------------------------
deletePaciente(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");

  print(
      "\n Escribe el documento de identificación del paciente que deseas borrar:");
  String search = stdin.readLineSync()!;

  Node? tempNode = list.head;
  while (tempNode?.object.id.toString() != search && tempNode != null) {
    tempNode = tempNode.next;
  }
  list.remove(tempNode?.object);

  print("\x1B[2J\x1B[0;0H");
  print("Paciente eliminado con éxito.....");
  sleep(const Duration(seconds: 1));
  menu();
}

//CONSULTAR PACIENTES-----------------------------------------------------------
searchPatient(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");

  print(
      "\n Escribe el documento de identificación, Nombre o apellido del paciente a buscar:");
  String search = stdin.readLineSync()!;
  List<Patient> results = [];
  Node? tempNode = list.head;
  while (tempNode != null) {
    if (tempNode.object.id.toString() == search ||
        tempNode.object.firstName.toString() == search ||
        tempNode.object.lastName.toString() == search) {
      results.add(tempNode.object);
    }
    tempNode = tempNode.next;
  }
  print("\x1B[2J\x1B[0;0H");
  print("""
┌───────────────────────────────────────────────┐
│                                               │
│        Clínica Central -Administración        │
│                                               │
├───────────────────────────────────────────────┤
│0. Atrás                                       │
│                                               │
│                                               │
│                   Resultados:                 │
│                                               │
└───────────────────────────────────────────────┘
""");
  results.forEach((element) {
    print("\n $element");
  });
}

//EDITAR INFORMACION PACIENTE---------------------------------------------------
editPaciente(SinglyLinkedList list) {
  String? vacio = "";
  print("\x1B[2J\x1B[0;0H");

  print(
      "\n Escribe el documento de identificación del paciente que deseas Modificar:");
  String search = stdin.readLineSync()!;

  Node? tempNode = list.head;
  while (tempNode?.object.id.toString() != search && tempNode != null) {
    tempNode = tempNode.next;
  }
  print(
      "\n el paciente que buscas es:\n${tempNode?.object}?\n escribe [0] para devolverte o [1] para continuar");
  if (stdin.readLineSync() == "1") {
    print("\x1B[2J\x1B[0;0H");
    print(
        "Escribe lo que quieras editar, de lo contrario deja el espacio en blanco (enter)");

    print("\nDocumento actual: ${tempNode?.object.id}");
    print("\n Escriba el documento de identificación del paciente:");
    String? id = stdin.readLineSync();
    if (id != null && id != vacio) {
      tempNode?.object.id = id;
    }

    print("\nNombre Actual: ${tempNode?.object.firstName}");
    print("\n Escriba los nombres del paciente:");
    String? firstName = stdin.readLineSync();
    if (firstName != null && firstName != vacio) {
      tempNode?.object.firstName = firstName;
    }

    print("\nApellido Actual: ${tempNode?.object.lastName}");
    print("\n Escriba los apellidos del paciente:");
    String? lastName = stdin.readLineSync();
    if (lastName != null && lastName != vacio) {
      tempNode?.object.lastName = lastName;
    }

    print("\nSexo Actual: ${tempNode?.object.sex}");
    print("\n Escriba el sexo del paciente:");
    String? sex = stdin.readLineSync();
    if (sex != null && sex != vacio) {
      tempNode?.object.sex = sex;
    }

    print("\nClínica Actual: ${tempNode?.object.clinica}");
    print("\n Escriba la clínica del paciente");
    String? clinica = stdin.readLineSync();
    if (clinica != null && clinica != vacio) {
      tempNode?.object.clinica = clinica;
    }

    print("\nStatus Actual: ${tempNode?.object.status}");
    print("\n Escriba el status del pacicente:");
    String? status = stdin.readLineSync();
    if (status != null && status != vacio) {
      tempNode?.object.status = status;
    }

    print("\x1B[2J\x1B[0;0H");
    print("Paciente editado con éxito.....");
    sleep(const Duration(seconds: 1));
    menu();
  } else {
    menu();
  }
}

//VER LISTA GENERAL //1O POR PÁGINA
viewPacientes(SinglyLinkedList list) {
  print("\x1B[2J\x1B[0;0H");
  viewList();
}
