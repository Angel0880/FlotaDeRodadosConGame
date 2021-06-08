class Pedido {
	
	var property distancia
	var property tiempoMaximo
	var property cantidadPasajeros
	const conjuntoColoresIncompatibles = []
	
	method conjuntoColoresIncompatibles() { return conjuntoColoresIncompatibles }
	
	method agregarColorIncompatible(color) { conjuntoColoresIncompatibles.add(color) }
	
	method sacarColorIncompatible(color) { conjuntoColoresIncompatibles.remove(color) }
	
	method velocidadRequerida() { return distancia / tiempoMaximo }
	
	method puedeSatisfacerPedidoDe(auto) {
		
		return (auto.velocidadMaxima() - self.velocidadRequerida()).abs() >= 10  and 
		auto.capacidad() >= cantidadPasajeros and 
		conjuntoColoresIncompatibles.all({ c => c != auto.color() })
		
	}
	
	method acelerar() { tiempoMaximo -= 1 }
	
	method relajar() { tiempoMaximo += 1 }

}