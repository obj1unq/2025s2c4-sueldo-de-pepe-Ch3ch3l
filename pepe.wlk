object pepe {
    var sueldo = 0
    var property categoria = cadete 
    var property tipoBono = bonoNulo
    var property tipoPrensentismo = presentismoNulo
    var diasFaltados = 0
    
   method agregarFaltas(faltas){
    diasFaltados += faltas
   }
    method obtenerNeto() = categoria.neto()
    method calcularSueldo() {
        sueldo = self.obtenerNeto() + tipoBono.bono(self) + tipoPrensentismo.presentismo(self) 
    }
}
object gerente {
    method neto() = 15000
}
object cadete {
    method neto() = 20000
}

object bonoNulo {
    method bono(empleado) = 0
}
object bonoFijo {
    method bono(empleado) = 800
}
object bonoPorcentaje {
    method bono(empleado) = empleado.obtenerNeto() * 0.1
}
object presentismoNulo {
    method presentismo(empleado) = 0
}
object presentismoDemagogico{
    method presentismo(empleado){
        if (empleado.obtenerNeto() > 18000){}
    }
}
object presentismoAjuste{
    method presentismo(empleado) {
        return 100
    }
}
object presentismoNormal{
    method presentismo(empleado) {
        return 2000
    }
}