class Rutina{
    method caloriasQuemadas(tiempo){
        return 100 * (tiempo - self.descanso()) * self.intensidad()
    }

    method descanso(){return}

    method intensidad(){return}
}

class Running inherits Rutina (){
    const intensidad

    override method caloriasQuemadas (tiempo){
        if (tiempo > 20){
            return 100 * (tiempo - 5) * intensidad
        } else {
            return 100 * (tiempo - 2) * intensidad
        }
    }
}

class Maraton inherits Running (){
    override method caloriasQuemadas (tiempo){
        return super(tiempo) * 2
    }
}

class Remo inherits Rutina (){
    override method caloriasQuemadas (tiempo){
        return 100 * (tiempo - tiempo / 5) * 1.3
    }
}

class RemoDeCompeticion inherits Remo (){
    override method caloriasQuemadas (tiempo){
        return 100 * (tiempo - ((tiempo / 5 - 3).max(2))) * 1.7
    }
}