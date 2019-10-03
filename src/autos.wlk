object rojo{}
object azul{}
object blanco {}
object negro {}
object beige {} 



class Corsa{
	
		var color = azul
		
		
			method capacidad(){return 4}
		
			method velocidadMaxima(){return 150}
				
			method peso(){return 1300}
				
			method color(){return color}
			
	
}

class Kwid {
	
		var property tieneGasAdicional = false
		
			method capacidad(){
				return if(tieneGasAdicional){3}
						else {4} 
			}
			method velocidadMaxima(){
				return if(tieneGasAdicional){120}
					   else{110}
			}
			method peso(){
				return if(tieneGasAdicional){1200+150}
						else {1200}
			}
			method color(){
				return azul
			}
	
}


object trafic{
		
		var property interior = interiorPopular
		var property motor = motorPulenta
		
			method capacidad(){return interior.capacidad()}
			method velocidadMaxima(){return motor.velocidadMaxima()}
			method peso(){return 4000+ interior.peso() + motor.peso()}
			method color()=blanco
		
}
// OBJETOS PARA LA TRAFIC
object interiorComodo{
	
		method capacidad()=5
		method peso()=700
}

object interiorPopular{
	
		method capacidad()= 12
		method peso()= 1000
}

object motorPulenta{
	
		method peso()=800
		method velocidadMaxima()=130
}
object motorBataton{
	
		method peso()=500
		method velocidadMaxima()=80
}

// Autos Especiales

class AutosEspeciales{
		
		//Todas las variables tiene que ser definidas al crear el 
		//nuevo molde de "AutosEspeciales" --->(auto1 = new AutosEspeciales(color=..,peso=..,velocidadMAxima=..capacidad=..)
	


		var property color 
		var property peso
		var property velocidadMaxima
		var property capacidad
}


class Dependencia{
		
		var flota =[]
		var property empleados
		const property pedidos = []
		
		
			//metodos para los registros de pedidos
			method quitarPedido(pedido){pedidos.remove(pedido)}
			method agregarPedido(pedido){pedidos.add(pedido)}
			method totalDePasajeros(){return pedidos.sum{a=>a.pasajeros()}}
			
			method pedidoNoSatisfechos(){return pedidos.filter{a=> not self.algunoPuedeSatisfacer(a)} }
			method algunoPuedeSatisfacer(pedido){return flota.any{a=>pedido.puedeSatisfacerViaje(a)}}
			
			
			method colorIncompatibleConTodos(color){return pedidos.all{a=>a.color() == color}}
			//metodos para la flota
			method agregarAuto(rodado){flota.add(rodado)}
			method quitarDeFlota(rodado){flota.remove(rodado)}
			method pesoTotalFlota(){return flota.sum({a=>a.peso()})}	
			method estaBienEquipada(){return self.tieneAlMenos3() && self.todosRapidos()}
			method capacidadTotalEnColor(color){return self.autosDeColor(color).sum({a=>a.capacidad()})}
			method colorDelRodadoMasRapido(){return self.rodadoMasRapido().color()} 
			method capacidadFaltante(){return 0.max(self.empleados()-self.capacidadTotal())}
			method esGrande(){return self.masEmpleados() && self.masRodados()}
		
		//metodos auxiliares
		method tieneAlMenos3(){
			return flota.size()>2
		}
		method todosRapidos(){
			return flota.all({a=>a.velocidadMaxima()>99})
		}
		method autosDeColor(color){return flota.filter({a=>a.color()==color})}
		
		method rodadoMasRapido(){return flota.max({a=>a.velocidadMaxima()})}
		method capacidadTotal(){return flota.sum({a=>a.capacidad()})}
		method masEmpleados(){return empleados>=40}
		method masRodados(){return flota.size()>=5}
}



// lista.contains("color") = pregunta si la lista contiene ese "color" y retorna true.

class Pedidos{
		
		var property distancia
		var property tiempoMaximo
		var property pasajeros
		var property coloresIncompatibles = #{}
		
		method velocidadRequerida(){
			
			return distancia/tiempoMaximo
		}
		method llegaATiempo(auto){
			
			return auto.velocidadMaxima() >= self.velocidadRequerida() + 10
		}
		method tieneCapacidad(auto){
			
			return pasajeros <= auto.capacidad()
		}
		method colorCompatible(auto){
			
			return not coloresIncompatibles.contains(auto.color())
		}
		method puedeSatisfacerViaje(auto){
			
			return self.llegaATiempo(auto) && self.tieneCapacidad(auto) && self.colorCompatible(auto)
		}
		method acelerar(){
			tiempoMaximo-=1
		}
		method relajar(){
			tiempoMaximo+=1
		}
}

// ETAPA 3



