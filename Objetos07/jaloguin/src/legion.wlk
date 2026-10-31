// Es posible crear legiones de legiones, pues lo único que necesitan los miembros de la legion es responder a la
// interfaz de "Asustador", la cual es compartida con la clase Ninio
class Legion {
  const miembros
  
  // el método initialize se ejecuta cuando haga new a la clase
  // new Legion(miembros = []) => tira la excepción
  // new Legion(miembros = [feli, fede]) => no pasa nada, porque tengo más de dos
  method initialize() {
    if (miembros.size() < 2) {
      throw new Exception(message = "pará loco, no hay suficientes integrantes!!")
    }
  }
  
  method intentarAsustar(alguien) = alguien.serAsustadoPor(self)
  
  method capacidadDeSusto() = miembros.sum { m => m.capacidadDeSusto() }
  
  method caramelos() = miembros.sum { m => m.caramelos() }
  
  method recibirCaramelos(unosCaramelos) {
    self.lider().recibirCaramelos(unosCaramelos)
  }
  
  method lider() = miembros.max { m => m.capacidadDeSusto() }
}