const malaria800 = new EnfermedadInfecciosa(
    celulasAmenazadas = 800
)

const malaria500 = new EnfermedadInfecciosa(
    celulasAmenazadas = 500
)

const otitis800 = new EnfermedadInfecciosa(
    celulasAmenazadas = 800
)

const otitis100 = new EnfermedadInfecciosa(
    celulasAmenazadas = 100
)

const lupus10000 = new EnfermedadAutoinmune(
    celulasAmenazadas = 10000
)

object sumar2 {
    method apply(x) = x + 2
}

class EnfermedadAutoinmune {
    var celulasAmenazadas
    var diasQueAfecto = 0

    method celulasAmenazadas() = celulasAmenazadas

    method afectarA(persona) {
        persona.disminuirCelulas(celulasAmenazadas)
        diasQueAfecto += 1
    }

    method esAgresivaPara(unaPersona) = diasQueAfecto >= 30
}

class EnfermedadInfecciosa {
    var celulasAmenazadas

    method celulasAmenazadas() = celulasAmenazadas
    method reproducite() {
        celulasAmenazadas *= 2
    }

    method afectarA(persona) {
        persona.aumentarTemperatura(celulasAmenazadas / 1000)
    }

    method esAgresivaPara(unaPersona) = celulasAmenazadas > unaPersona.celulas() * 0.1
}

const logan = new Persona(temperatura = 36, celulas = 3000000)

const frank = new Persona(temperatura = 36, celulas = 3500000)

class Persona {
    var temperatura
    var celulas
    const enfermedades = #{}

    method temperatura() = temperatura

    method celulas() = celulas

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
}