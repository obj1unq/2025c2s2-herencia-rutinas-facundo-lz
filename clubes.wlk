import rutinas.*
import personas.*

class Club{
    const predios = #{}

    method mejorPredio(persona){
        return predios.max({predio => predio.rutinas().sum({rutina => persona.caloriasQueGastaria(rutina)})})
    }

    method prediosTranquis(persona){
        return predios.filter({predio => self.alMenosUnaGastaMenosDe(predio.rutinas(), 500, persona)})
    }

    method alMenosUnaGastaMenosDe (rutinas, cantidad, persona){
        return rutinas.any({rutina => persona.caloriasQueGastaria(rutina) < cantidad})
    }

    method rutinasMasExigentes(persona){
        const rutinas = #{}
        return predios.forEach({predio => rutinas.add(predio.rutinas().maxIfEmpty({rutina => persona.caloriasQueGastaria(rutina)}))})
    }

    method rutinasDePredios(){
        const rutinas = #{}
        predios.forEach({predio => rutinas.addAll(predio.rutinas())})
        return rutinas
    }

    method agregarPredio(predio){
        predios.add(predio)
    }
}

object nautico{
    const rutinas = #{}

    method agregarRutina (rutina){
        rutinas.add(rutina)
    }

    method rutinas(){
        return rutinas
    }
}

object recreo{
    const rutinas = #{}

    method agregarRutina (rutina){
        rutinas.add(rutina)
    }

    method rutinas(){
        return rutinas
    }
}