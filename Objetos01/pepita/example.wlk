object pepita {
  var energia = 1
  var ubicacion = buenosAires

  method energia() = energia

  method volaHasta(unLugar) {
    self.vola(self.distanciaARecorrer(unLugar))
    ubicacion = unLugar
  }

  method podesVolarHasta(unLugar) {
    return self.distanciaARecorrer(unLugar) + 10 <= energia
  }

  method distanciaARecorrer(unLugar) {
    return (ubicacion.kilometro() - unLugar.kilometro()).abs()
  }

  method come(unosGramos) {
    energia = energia + (4 * unosGramos)
  }

  method vola(distanciaEnKm) {
    energia = energia - (10 + distanciaEnKm)
  }
}

object buenosAires {
  const kilometro = 0

  method kilometro() = kilometro
}

object rosario {
  const kilometro = 287

  method kilometro() = kilometro
}

object cordoba {
  const kilometro = 400

  method kilometro() = kilometro
}