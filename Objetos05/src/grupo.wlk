object grupoA {
    method compatibleCon(grupo) {
        return #{self, grupoAB}.contains(grupo)
    }
}

object grupoB {
    method compatibleCon(grupo) {
        return #{self, grupoAB}.contains(grupo)
    }
}

object grupoAB {
    method compatibleCon(grupo) {
        return grupo == self
    }
}

object grupo0 {
    method compatibleCon(grupo) = true
}