import cosas.*

object camion {
    var contenedor = #{paqueteLadrillos, knightRider}
    var pesoBase = 1000
    method peso() {
        return pesoBase + contenedor.map{cosa => cosa.peso()}.sum()
    }
    method cargar(unaCosa) {
        contenedor.add(unaCosa)
    }
    method descargar(unaCosa) {
        contenedor.remove(unaCosa)
    }
    method tieneCosaEntre(pesoMinimo, pesoMaximo) {
        return contenedor.any{cosa => cosa.peso().between(pesoMinimo, pesoMaximo)}
    }
    method masPesado() {
        return contenedor.map{cosa => cosa.peso()}.max()
    }
    method pesosSonPares() {
        return contenedor.all{cosa => cosa.peso().even()}
    }
    method hayAlgoQuePese(unPeso) {
        return contenedor.any{cosa => cosa.peso() == unPeso}
    }
    method primeraCosaPeligrosa(unaPeligrosidad) {
        return contenedor.find{cosa => cosa.peligrosidad() == unaPeligrosidad}
    }
    method cosasMasPeligrosasQue(unaCosa) {
        return contenedor.filter{cosa => cosa.peligrosidad() > unaCosa.peligrosidad()}
    }
    method excedePesoMaximo() {
        return self.peso() > 2500
    }
    method puedeCircular(peligrosidadMaxima) {
        return !self.excedePesoMaximo() and !contenedor.any{cosa => cosa.peligrosidad() > peligrosidadMaxima}
    }
}

