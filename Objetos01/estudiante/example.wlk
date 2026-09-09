
// Objeto: representación de un ente computacional
// que exhibe comportamiento

// Cosa que hace cosas!

object profe {
  const termo = termoLumilagro

  method tomarMate(unSorbo) {
    termo.servirAgua(unSorbo)
  }
}

object estudiante {
  var energia = 50
  var termo = termoLumilagro

  method energia() { // getter
    return energia
  }

  method cebarA(unaPersona) {
    unaPersona.tomarMate(20)
  }

  method saludar(alguien) {
    return "Hola " + alguien
  }

  method tomarMate(unSorbo) {
    termo.servirAgua(unSorbo)
    energia = energia + 10
  }

  method pedirTermoAlCeit() {
    self.termo(termoCeit)
  }

  method termo(unTermo) { // setter
    termo = unTermo
  }
}

object termoCeit {
  var agua = 500

  method servirAgua(unaCantidad) {
    agua -= unaCantidad
  }
}

object termoLumilagro {
  var agua = 1000

  method agua() = agua

  method servirAgua(unaCantidad) {
    self.disminuirAgua(unaCantidad)
  }

  method volcarse() {
    self.disminuirAgua(200)
  }

  method disminuirAgua(unaCantidad) {
    if(agua - unaCantidad < 0) {
      agua = 0
    } else {
      agua -= unaCantidad
    }
  }
}


