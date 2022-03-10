import 'dart:io';
import 'libs/SinglyLinkedList/List.dart';
import 'libs/interface.dart';
import 'libs/logicGate.dart';

// sleep(const Duration(seconds: 1));
void main(List<String> args) {
  SinglyLinkedList listaPacientes = new SinglyLinkedList();
  loading();
  menu();
  mainLoop:
  while (true) {
    String? controller = stdin.readLineSync();
    switch (controller) {
      //Salir del programa------------------------------------------------------
      case "exit":
        break mainLoop;
      //Atrás del programa------------------------------------------------------
      case "0":
        menu();
        break;
      //Añadir pacientes--------------------------------------------------------
      case "1":
        addPaciente();
        break;
      //Añadir paciente al principio de Lista-----------------------------------
      case "1.1":
        addpacienteFirst(listaPacientes);
        break;
      //Añadir paciente al final de Lista---------------------------------------
      case "1.2":
        addpacienteLast(listaPacientes);
        break;
      //Añadir paciente después de otro-----------------------------------------
      case "1.3":
        addpacienteBetween(listaPacientes);
        break;
      //Eliminar paciente-------------------------------------------------------
      case "2":
        deletePaciente(listaPacientes);
        break;
      //Ver la lista de pacientes-----------------------------------------------
      case "3":
        searchPatient(listaPacientes);
        break;
      //Editar información de paciente------------------------------------------
      case "4":
        editPaciente(listaPacientes);
        break;
      //Ver lista total de pacientes--------------------------------------------
      case "5":
        viewList();
        viewPacientes(listaPacientes);
        break;
      //Reiniciar Página de vista-----------------------------------------------
      case "5.1":
        viewList();
        viewPacientes(listaPacientes);
        break;
      //Siguiente pagina de vista-----------------------------------------------
      case "5.2":
        viewList();
        viewNextPacientes();
        break;
    }
  }
}
