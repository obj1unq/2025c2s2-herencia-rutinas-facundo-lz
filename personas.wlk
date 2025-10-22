import rutinas.*

class Persona{
    var peso
    const kilosPorCaloria
    var tiempo

    method hacerRutina(rutina){
        peso -= rutina.caloriasQuemadas(tiempo) / kilosPorCaloria
    }

    method caloriasQueGastaria (rutina){
        return rutina.caloriasQuemadas(tiempo)
    }

    method peso(){
        return peso
    }

    method tiempo(){
        return tiempo
    }
}

class PersonaSedentaria inherits Persona (kilosPorCaloria = 7000){
    method tiempo (_tiempo){
        tiempo = _tiempo
    }

    override method hacerRutina (rutina){
        if (peso > 50){
            super(rutina)
        }
    }

    override method caloriasQueGastaria (rutina){
        if (peso > 50){
            return rutina.caloriasQuemadas(tiempo)
        } else {
            return 0
        }
    }
}

class PersonaAtleta inherits Persona (kilosPorCaloria = 8000, tiempo = 90){
    override method hacerRutina(rutina){
        if (rutina.caloriasQuemadas(tiempo) > 10000){
            peso -= rutina.caloriasQuemadas(tiempo) / kilosPorCaloria - 1
        }
    }

    override method caloriasQueGastaria (rutina){
        if (rutina.caloriasQuemadas(tiempo) > 10000){
            return rutina.caloriasQuemadas(tiempo)
        } else {
            return 0
        }
    }
}
