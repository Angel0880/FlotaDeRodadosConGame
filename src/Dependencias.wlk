import Rodados.*
import Pedidos.*

class Dependencia {
	
	var property nombre
	
	var property cantidadEmpleados
	
	const flotaDeRodados = []
	
	const registroPedidos = []
	
	method flotaDeRodados() { return flotaDeRodados }
	
	
	method agregarAFlota(rodado) { flotaDeRodados.add(rodado) }

	
	method quitarDeFlota(rodado) { flotaDeRodados.remove(rodado) }
	
	
	method pesoTotalFlota() {
		
		return flotaDeRodados.sum({ r => r.peso() })
		
	}
	
	method estaBienEquipada() {
		
		return flotaDeRodados.size() >= 3 and flotaDeRodados.all({ r => r.velocidadMaxima() >= 100 })
		
	}
	 
	method capacidadTotalEnColor(color) {
		
		return flotaDeRodados.filter({ r => r.color() == color }).sum({ r => r.capacidad() })
		
	}
	
	method colorDelRodadoMasRapido() {
		
		return flotaDeRodados.max({ r => r.velocidadMaxima() }).color()
		
	} 
	
	method capacidadFaltante() {
		
		return (cantidadEmpleados - flotaDeRodados.sum({ r => r.capacidad() })).abs()
		
	}
	
	method esGrande() {
		
		return cantidadEmpleados >= 40 and flotaDeRodados.size() == 5
		
	}
	
	method registroPedidos() { return registroPedidos }
	
	
	method agregarPedido(pepido) { registroPedidos.add(pepido) }


	method quitarPedido(pepido) { registroPedidos.remove(pepido) }
	
	
	method totalPasajerosEnPedidos() {
		
		return registroPedidos.sum({ p => p.cantidadPasajeros() })
		
	}
	
	method pedidosNoSatisfechos() {
        
       return registroPedidos.filter({pedido => self.pedidoNoSatisfecho(pedido)}).asSet()
        
   	}

    method pedidoNoSatisfecho(unPedido) {
        
        return flotaDeRodados.all({auto => not(unPedido.puedeSatisfacerPedidoDe(auto)) })
    
    }
	
	method esIncompatibleParaTodos(color) {
		
		registroPedidos.all({ p => p.conjuntoColoresIncompatibles().any({ c => c == color }) })
		
	}
	
	method relajarPedidos() {
		
		registroPedidos.forEach({ p => p.relajar() })
		
	}
	
	
}


