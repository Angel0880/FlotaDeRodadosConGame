import wollok.game.*

class Corsa {
	
	var property color
	var property image = "autitorojo.png"
	var property position = game.at(4,7)
	var property posicionesAnteriores = []
		
	method capacidad() { return 4 }
	method velocidadMaxima() { return 150 } 
	method peso() { return 1300 }
	method color() { return color }
	
	method moverALaDerecha() {
		self.position(self.position().right(1))
		posicionesAnteriores.add(self.position())
	}
	
	method moverALaIzquierda() {
		self.position(self.position().left(1))
		posicionesAnteriores.add(self.position())
	}
	
	method moverAArriba() {
		self.position(self.position().up(1))
		posicionesAnteriores.add(self.position())
	}

	method moverAAbajo() {
		self.position(self.position().down(1))
		posicionesAnteriores.add(self.position())
	}
	
	method pasoPorPosicion(posicion) {
		return posicionesAnteriores.any( { p => p == posicion } )	
	}
	
	method pasoPorFila(numero) {
		return posicionesAnteriores.any( { p => p.x() == numero } )	
	}
	
	method recorrioFilas(listaNumeros) {
		return listaNumeros.all( { n => self.pasoPorFila(n) } )
	} 
	
}

class Kwid {
	
	var property tieneTanqueAdicional
	
	method capacidad() { return if(tieneTanqueAdicional) {3} else {4} }
	method velocidadMaxima() { return if(tieneTanqueAdicional) {120} else {110} } 
	method peso() { return 1200 + if(tieneTanqueAdicional) {150} else {0} }
	method color() { return "Azul" }
	
}

object trafic {
	
	var property interior
	var property motor 
	
	method capacidad() { return interior.capacidad() }
	method velocidadMaxima() { return motor.velocidadMaxima() } 
	method peso() { return  4000 + interior.peso() + motor.peso() }
	method color() { return "Blanco" }
	
}

object comodo {
	
	method capacidad() { return 5 }
	method peso() { return 700 }

}

object popular {
	
	method capacidad() { return 12 }
	method peso() { return 1000 }

}


object pulenta {
	
	method peso() { return 800 }
	method velocidadMaxima() { return 130 } 
	
}

object bataton {
	
	method peso() { return 500 }
	method velocidadMaxima() { return 80 } 
	
}

class AutoEspecial {
	
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
	
	method capacidad() { return capacidad }
	method velocidadMaxima() { return velocidadMaxima } 
	method peso() { return peso }
	method color() { return color }
	
}