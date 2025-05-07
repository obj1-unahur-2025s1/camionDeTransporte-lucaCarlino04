object cosas {
    
}

object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estaTransformadoEnAuto = false
    method peso() = 800
    method peligrosidad() {
        if (estaTransformadoEnAuto == true) {
            return 15
        } else {
            return 30
        }
    }
    method transformarse() {
        estaTransformadoEnAuto = !estaTransformadoEnAuto
    }
}

object paqueteLadrillos { // cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
    var cantidadLadrillos = 5
    method peso() = cantidadLadrillos * 2
    method peligrosidad() = 2
    method cambiarCantidadLadrillos(unaCantidad) {
        cantidadLadrillos = unaCantidad
    }
}

object arena { //el peso es variable, la peligrosidad es 1.
    var peso = 0
    method peso() = peso
    method peligrosidad() = 1
    method cambiarPeso(unPeso) {
        peso = unPeso
    }
}

object bateriaAntiaerea {
    // el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
    var tieneMisiles = false
    method peso() {
        if (tieneMisiles == true) {
            return 300
        } else {
            return 200
        }
    }
    method peligrosidad() {
        if (tieneMisiles == true) {
            return 100
        } else {
            return 0
        }
    }
    method ponerQuitarMisiles() {
        tieneMisiles = !tieneMisiles
    }
    
}

object contenedorPortuario {
    var contenido = #{knightRider, bumblebee}
    method peso() {
        return 100 + contenido.map{cosa => cosa.peso()}.sum()
    }
    method peligrosidad() {
        if (contenido.isEmpty()) {
            return 0
        } else {
            return contenido.map{cosa => cosa.peligrosidad()}.max()
        }
    }

    method anadirCosa(unaCosa) {
        contenido.add(unaCosa)
    }
    method sacarCosa(unaCosa) {
        contenido.remove(unaCosa)
    }
    method vaciarContenedor() {
        contenido.clear()
    }
}

object residuosRadioactivos {
    var peso = 1
    method peso() = peso
    method peligrosidad() = 200
    method cambiarPeso(unPeso) {
        peso = unPeso
    }
}

object embalajeSeguridad {
    // El peso es el peso de la cosa que tenga adentro. 
    // El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.
    var contenido = paqueteLadrillos
    method peso() = contenido.peso()
    method peligrosidad() = contenido.peligrosidad() / 2
    method cambiarContenido(unaCosa) {
        contenido = unaCosa
    }
}