class AdultoComun {
  var vecesQueFueAsustado = 0
  
  method puedeSerAsustado(asustador) = self.tolerancia() < asustador.capacidadDeSusto()
  
  method serAsustadoPor(asustador) {
    if (self.puedeSerAsustado(asustador)) {
      asustador.recibirCaramelos(self.caramelosQueEntrega())
    }

    if (asustador.caramelos() > 15) {
      vecesQueFueAsustado += 1
    }
  }
  
  method caramelosQueEntrega() = self.tolerancia() / 2
  
  method tolerancia() = 10 * vecesQueFueAsustado
}

class Abuelo inherits AdultoComun {
  override method puedeSerAsustado(_asustador) = true
  
  override method caramelosQueEntrega() = super() / 2
}

object adultoNecio {
  method serAsustadoPor(_asustador) {}
}