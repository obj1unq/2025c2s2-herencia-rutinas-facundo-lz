import rutinas.*
import personas.*

class Club{
    const predios = #{}

    method mejorPredio(persona){
        return predios.max({predio => predio.rutinas().sum({rutina => persona.caloriasQueGastaria(rutina)})})
    }

    method prediosTranquis(persona){
        return predios.filter({predio => predio.alMenosUnaGastaMenosDe(500, persona)})
    }

    method rutinasMasExigentes(persona){
        const rutinas = #{}
        return predios.forEach({predio => rutinas.add(predio.rutinaQueMasGasta(persona))})
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

    method alMenosUnaGastaMenosDe (cantidad, persona){
        return rutinas.any({rutina => rutina.caloriasQuemadas(persona.tiempo()) < cantidad})
    }

    method rutinaQueMasGasta(persona){
        return rutinas.max({rutina => persona.caloriasQueGastaria(rutina)})
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

    method alMenosUnaGastaMenosDe (cantidad, persona){
        return rutinas.any({rutina => rutina.caloriasQuemadas(persona.tiempo()) < cantidad})
    }
}
