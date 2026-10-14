import src.persona.Persona
import src.grupo.*

const cameron = new Medico(dosis = 10, temperatura = 35.9, celulas = 2000, grupo = grupoA, factor = true)
const bilardo = new Medico(dosis = 33.33, temperatura = 36, celulas = 1000, grupo = grupo0, factor = false)

class Medico inherits Persona {
    const dosis = 5

    method atender(unaPersona) {
        unaPersona.recibirDosis(dosis)
    }

    override method contraer(unaEnfermedad) {
        super(unaEnfermedad)
        self.atender(self)
    }
}