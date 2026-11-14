class Exiliado {
  const leGustaElTe
  var diasEnExilio
  
  method aumentarDiasEnExilio() {
    diasEnExilio += 1
  }
  
  method pasearPorLaPlaza(asentamiento) {
    asentamiento.aumentarProsperidad(5)
  }
  
  method tomarTe(asentamiento) {
    if (leGustaElTe) asentamiento.aumentarProsperidad(10)
    else asentamiento.disminuirProsperidad(10)
  }
  
  method visitar(triunvirato, asentamiento)
  
  method visitarMonumento(monumento, asentamiento)
  
  method trabajar(unasHoras, asentamiento) {
    asentamiento.aumentarProsperidad(50)
    self.aumentarDiasEnExilio()
  }
}

class Nomada inherits Exiliado {
  var estado = normal
  
  override method aumentarDiasEnExilio() {
    super()
    if (diasEnExilio >= 1000) {
      estado = demonio
    }
  }
  
  override method visitar(triunvirato, asentamiento) {
    self.trabajar(2.randomUpTo(6), asentamiento)
    const companiero = triunvirato.companieroAlAzar(self)
    if (asentamiento.tienePlaza()) {
      self.pasearPorLaPlaza(asentamiento)
      companiero.visitarPlaza(asentamiento)
    }
    self.tomarTe(asentamiento)
    companiero.tomarTe(asentamiento)
    estado.visitar(self, asentamiento)
  }
  
  override method visitarMonumento(monumento, asentamiento) {
    if (monumento.haceReferenciaASoliamMurr())
      estado.visitarMonumentoASoliamMurr(asentamiento, self)
  }
}

object normal {
  method visitar(exiliado, asentamiento) {
    
  }
  
  method visitarMonumentoASoliamMurr(_asentamiento, _exiliado) {
    
  }
}

object demonio {
  method visitar(exiliado, asentamiento) {
    if (asentamiento.tieneMonumentoASoliamMurr())
      exiliado.visitarMonumentoASoliamMurr(asentamiento)
  }
  
  method visitarMonumentoASoliamMurr(asentamiento, exiliado) {
    asentamiento.aumentarCantidadDeHabitantes(1)
  }
}

class Diablillo inherits Exiliado {
  override method visitar(_triunvirato, asentamiento) {
    asentamiento.cantidadDePlazas().times(
      { self.pasearPorLaPlaza(asentamiento) }
    )
  }
}

class Sabueso inherits Exiliado {
  override method visitar(_triunvirato, _asentamiento) {
    
  }
}