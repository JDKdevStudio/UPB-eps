import 'dart:io';

loading() {
  print("""
┌───────────────────────────────────────────────┐
│                                               │
│     <--------------loading-------------->     │
│                                               │
└───────────────────────────────────────────────┘
""");
  sleep(const Duration(seconds: 1));
}

menu() {
  print("\x1B[2J\x1B[0;0H");
  print("""
┌───────────────────────────────────────────────┐
│                                               │
│        Clínica Central -Administración        │
│                                               │
├───────────────────────────────────────────────┤
│                                               │
│                                               │
│                                               │
│       1. Añadir Paciente a la lista           │
│                                               │
│       2. Eliminar paciente del registro       │
│                                               │
│       3. Consultar base de datos              │
│                                               │
│       4. Editar información de paciente       │
│                                               │
│       5. Ver lista general                    │
│                                               │
│                                               │
│                                               │
│Escribe "exit" para cerrar                     │
└───────────────────────────────────────────────┘
""");
}

addPaciente() {
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
│                                               │
│                                               │
│  1.1. Añadir paciente al principio de lista   │
│                                               │
│  1.2. Añadir paciente al final de lista       │
│                                               │
│  1.3. Añadir paciente después de otro         │
│                                               │
│                                               │
│                                               │
│                                               │
│                                               │
│                                               │
└───────────────────────────────────────────────┘
""");
}

viewList() {
  print("""
┌───────────────────────────────────────────────┐
│                                               │
│        Clínica Central -Administración        │
│                                               │
├───────────────────────────────────────────────┤
│0. Atrás                                       │
│                                               │
│                   Resultados:                 │
│                                               │
│5.1 retroceder                    5.2 siguiente│
└───────────────────────────────────────────────┘
""");
}
