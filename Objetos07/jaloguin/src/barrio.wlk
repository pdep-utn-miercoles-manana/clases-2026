class Barrio {
  const habitantes = []
  
  method losQueMasTienen() = habitantes
    .sortedBy { h => h.caramelos() }
    .take(3)
  
  method piezasDeDisfrazMasTerrorificas() = habitantes
  .filter { h => h.caramelos() > 10 }
  .asSet()
}