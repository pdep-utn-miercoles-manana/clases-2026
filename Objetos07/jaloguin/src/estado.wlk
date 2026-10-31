object sano {
  method comerCaramelos(ninio, cantidad) {
    ninio.disminuirCaramelos(cantidad)
    if (cantidad >= 10) {
      ninio.empacharse()
    }
  }
  
  method actitud(ninio) = ninio.actitud()
}

object empachado {
  method comerCaramelos(ninio, cantidad) {
    ninio.disminuirCaramelos(cantidad)
    if (cantidad >= 10) {
      ninio.caerEnCama()
    }
  }
  
  method actitud(ninio) = ninio.actitud() / 2
}

object enCama {
  method comerCaramelos(_ninio, _cantidad) {}
  
  method actitud(_ninio) = 0
}