import src.categorias.*
import src.resultados.*
import src.presentismos.*

object pepe {

  var categoria = gerente
  var bonoResultado = resultadoNulo
  var bonoPresentismo = presentismoNoqui
  
  var cantidadFaltas = 0
  var aniosAntiguedad = 0

  method sueldo() {
    return self.sueldoNeto() +
           self.bonoResultado() +
           self.bonoPresentismo() 
  }

  method sueldoNeto() = 
    categoria.sueldo(self)

  method bonoResultado() = 
    bonoResultado.sueldo(self)

  method bonoPresentismo() =
    bonoPresentismo.sueldo(self)

  method cantidadFaltas() = cantidadFaltas
  method aniosAntiguedad() = aniosAntiguedad

  method categoria(algo) {
    categoria = algo
  }

  method bonoResultado(algo) {
    bonoResultado = algo
  }

  method bonoPresentismo(algo) {
    bonoPresentismo = algo
  }
  
  method aniosAntiguedad(algo) {
    aniosAntiguedad = algo
  }
  
  method cantidadFaltas(algo) {
    cantidadFaltas = algo
  }

  method cumplirAnio() {
    aniosAntiguedad += 1
  }
  
}