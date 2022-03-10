class Patient {
  String id;
  String firstName;
  String lastName;
  String sex;
  String clinica;
  String status;

  Patient(this.id, this.firstName, this.lastName, this.sex, this.clinica,
      this.status);

  @override
  String toString() {
    // ignore: todo
    // TODO: implement toString
    return "{Documento Identificación: $id, Nombres: $firstName, Apellidos: $lastName, Sexo: $sex, Clínica: $clinica, Status: $status}";
  }
}
