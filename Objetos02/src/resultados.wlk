object resultadoNulo {
  method sueldo(empleado) = 0
}

object resultadoFijo {
  method sueldo(empleado) = 
    15 + empleado.aniosAntiguedad()
}

object resultadoSTI {   // STI = Short Term Incentive
  method sueldo(empleado) =
    empleado.sueldoNeto() * 0.20
}

