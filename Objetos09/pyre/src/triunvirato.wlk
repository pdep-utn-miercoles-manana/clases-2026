class Triunvirato {
  const exiliados
  var lider
  
  method estaActivo() = exiliados.size() >= 3
  
  method agregarExiliado(unExiliado) {
    exiliados.add(unExiliado)
  }
  
  method cambiarLider(nuevoLider) {
    if (!exiliados.contains(nuevoLider)) {
      throw new Exception(
        message = "pará loco, este chabón no pertenece al triunvirato!!"
      )
    }
    lider = nuevoLider
  }
  
  method visitar(asentamiento) {
    lider.visitar(asentamiento, self)
  }
  
  method companieroAlAzar(acompaniado) {
    exiliados.copyWithout(acompaniado).anyOne()
  }
}