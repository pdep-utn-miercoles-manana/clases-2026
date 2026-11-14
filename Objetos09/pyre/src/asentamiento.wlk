class Asentamiento {
  var prosperidad
  
  // Para no exponer el setter, le armamos el getter a mano únicamente
  method prosperidad() = prosperidad
  
  method pasearPorLaPlaza() {
    prosperidad += 5
  }
  
  method tieneMonumentoASoliamMurr()
  
  method tienePlaza() = self.cantidadDePlazas() > 0
  
  method cantidadDePlazas()
}

class Pueblo inherits Asentamiento {
  override method tieneMonumentoASoliamMurr() = false
  
  override method cantidadDePlazas() = 1
}

class Ciudad inherits Asentamiento {
  var habitantes
  const atracciones
  const monumentos
  
  override method cantidadDePlazas() = (habitantes / 10000) + atracciones.filter(
    { atraccion => atraccion.contains("plaza") }
  )
  
  override method tieneMonumentoASoliamMurr() = monumentos.any(
    { monumento => monumento.haceReferenciaASoliamMurr() }
  )
  
  method aumentarCantidadDeHabitantes() {
    habitantes += 1
  }
}

class Monumento {
  const nombre
  
  method referenciasDeMurr() = [
    "Soliam Murr",
    "El último de su nombre",
    "El primer exiliado"
  ]
  
  method haceReferenciaASoliamMurr() = self.referenciasDeMurr().any(
    { referencia => nombre.contains(referencia) }
  )
}

/*
10. Para pensar, ¿una comunidad puede estar conformada por otras comunidades? Justificar.

Sí, una comunidad puede estar conformada por otras comunidades porque comparte una interfaz con los asentamientos,
por lo tanto es polimórfico con ellas y pueden ser usadas de forma indistinta en la lista de asentamientos.
*/

class Comunidad {
  const asentamientos
  
  method prosperidad() = asentamientos.sum(
    { asentamiento => asentamiento.prosperidad() }
  )
  
  method esVisitadoPor(triunvirato) {
    self.asentamientoMasPropspero().esVisitadoPor(triunvirato)
  }
  
  method asentamientoMasPropspero() = asentamientos.max(
    { asentamiento => asentamiento.prosperidad() }
  )
}