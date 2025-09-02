object pepe {
    var diasFaltados = 0
    var  categoria = cadete 
    var  tipoResultados = bonoFijo
    var  tipoPrensentismo = presentismoNormal
    
    method obtenerNeto() = categoria.neto()
    method diasFaltados() = diasFaltados
    
    method agregarFaltas(faltas){
        diasFaltados = diasFaltados + faltas
    }

    method calcularSueldo() {
       return self.obtenerNeto() + tipoResultados.bono(self) + tipoPrensentismo.presentismo(self) 
    }

    method actualizarCategoria(_categoria) {
        categoria = _categoria
    }
    method actualizarBonoPresentismo(_tipoPresentismo) {
        tipoPrensentismo = _tipoPresentismo
    }
    method actualizarBonoResultado(_tipoBono) {
        tipoResultados = _tipoBono
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
        if (empleado.obtenerNeto() < 18000){
            return 500
        } else {
            return 300
        }
    }
}
object presentismoAjuste{
    method presentismo(empleado) {
        if (empleado.diasFaltados() > 0) {
            return 0
        } else {
            return 100
        }
    }
}
object presentismoNormal{
    method presentismo(empleado) {
        if (empleado.diasFaltados() == 0){
            return 2000
        } else if (empleado.diasFaltados() == 1){
            return 1000
        } else {
            return 0
        }
    }
}