object desarrollador {
  method sueldo(empleado) = 
    1000 + 25 * empleado.aniosAntiguedad()
}

object manager {
  method sueldo(empleado) = 
    1500 + 50 * empleado.aniosAntiguedad()
}

object gerente {
  method sueldo(empleado) = 
    2500 + 100 * empleado.aniosAntiguedad()
}

object administrativo {
  method sueldo(empleado) = 500
}