import src.estado.*

class Ninio {
  const actitud
  const elementos
  var estado = sano
  var caramelos = 0
  
  method capacidadDeSusto() = self.capacidadDeSustoDelDisfraz() * estado.actitud(self)
  
  method actitud() = actitud
  
  method caramelos() = caramelos
  
  method capacidadDeSustoDelDisfraz() = elementos.sum { e => e.nivelDeSusto() }
 
  method intentarAsustar(alguien) = alguien.serAsustadoPor(self)
  
  method recibirCaramelos(unosCaramelos) {
    caramelos += unosCaramelos
  }
  
  method disminuirCaramelos(cantidad) {
    caramelos -= cantidad
  }
  
  method comerCaramelos(cantidad) {
    self.validarCaramelos(cantidad)
    estado.comerCaramelos(self, cantidad)
  }
  
  method validarCaramelos(cantidad) {
    if (cantidad < caramelos) {
      throw new Exception(message = "pará loco, no tiene tantos caramelos!!")
    }
  }
  
  method empacharse() {
    estado = empachado
  }
  
  method caerEnCama() {
    estado = enCama
  }
}

class ElementoDeDisfraz {
  const nivelDeSusto
  
  method nivelDeSusto() = nivelDeSusto
}
// Podríamos modelar los elementos del disfraz también de la siguiente manera. Para lo que nos pide el enunciado, un

// elemento del disfraz solamente lo necesitamos para sumar a la capacidad de asustar; es otra opción válida que la
// lista de elementos en el Ninio sea una lista de números.
// object maquillaje {    
//  method nivelDeSusto() = 3
// }
// object trajeTierno {    
//  method nivelDeSusto() = 2
// }
// object trajeTerrorifico {    
//  method nivelDeSusto() = 5
// }
const maquillaje = new ElementoDeDisfraz(nivelDeSusto = 3)

const trajeTierno = new ElementoDeDisfraz(nivelDeSusto = 2)

const trajeTerrorifico = new ElementoDeDisfraz(nivelDeSusto = 5)