import src.grupo.*

const logan = new Persona(temperatura = 36, celulas = 3000000, grupo = grupoA, factor = true)
const frank = new Persona(temperatura = 36, celulas = 3500000, grupo = grupoAB, factor = false)

class Persona {
    var temperatura
    var celulas
    const enfermedades = #{}
    const grupo
    const factor

    method celulas() = celulas

    method enfermedades() = enfermedades

    method grupo() = grupo

    method factor() = factor

    method transfundir(unaCantidadDeCelulas, unaPersona) {
        if(self.puedeTransfundir(unaCantidadDeCelulas, unaPersona)) {
            self.disminuirCelulas(unaCantidadDeCelulas)
            unaPersona.aumentarCelulas(unaCantidadDeCelulas)
        } else {
            throw new DomainException
              (message = "No puede realizarse la transfusión")
        }
    }

    method puedeTransfundir(unaCantidadDeCelulas, unaPersona) {
        return self.cantidadDeCelulasSuficiente(unaCantidadDeCelulas) &&
        self.soyCompatibleCon(unaPersona)
    }

    method cantidadDeCelulasSuficiente(unaCantidadDeCelulas) {
        return unaCantidadDeCelulas > 500 && unaCantidadDeCelulas <= celulas * 0.25
    }

    method soyCompatibleCon(unaPersona) =
        self.grupoCompatible(unaPersona) && self.factorCompatible(unaPersona)

    method grupoCompatible(unaPersona) =
        grupo.compatibleCon(unaPersona.grupo())

    method factorCompatible(unaPersona) =
        !factor || (unaPersona.factor() && factor)

    method aumentarTemperatura(unaCantidad) {
        temperatura = (temperatura + unaCantidad).min(45)
    }

    method vivirUnDia() {
        enfermedades.forEach { enfermedad =>
            enfermedad.afectarA(self)
        }
    }

    method vivir(dias) {
        dias.times { i => self.vivirUnDia() }
    }

    method contraer(enfermedad) {
        enfermedades.add(enfermedad)
    }

    method estaEnfermoDe(unaEnfermedad) =
        enfermedades.contains(unaEnfermedad)

    method disminuirCelulas(unaCantidad) {
        celulas = (celulas - unaCantidad).max(0)
    }

    // bloques o closures
    method celulasAfectadasPorEnfermedadesAgresivas()
        = enfermedades
            .filter { enfermedad => enfermedad.esAgresivaPara(self) }
            .sum { enfermedad => enfermedad.celulasAmenazadas() }

    method enfermedadMasAfectante() = enfermedades
        .max { enfermedad => enfermedad.celulasAmenazadas() }

    method estaEnComa() = temperatura == 45 || celulas <= 1000000

    method recibirDosis(unaDosis) {
        enfermedades.forEach( { enfermedad =>
          enfermedad.atenuar(unaDosis * 15) })

        enfermedades.removeAllSuchThat({
            enfermedad => enfermedad.estaCurada()
        })
    }
}