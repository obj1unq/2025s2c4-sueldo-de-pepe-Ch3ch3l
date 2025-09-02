object pepe {
    var diasFaltados = 0
    var categoria = cadete 
    var tipoResultados = bonoNulo
    var tipoPrensentismo = presentismoNulo
    
    method obtenerNeto() = categoria.neto()
    method diasFaltados() = diasFaltados
    
    method agregarFaltas(faltas){
        diasFaltados += faltas
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
//------------------Adicional Sofia------------------
object sofia {
    var categoria = cadete
    var tipoResultados = bonoNulo
    
    method obtenerNeto() = categoria.neto()*1.3

    method calcularSueldo() {
        return self.obtenerNeto() + tipoResultados.bono(self)
    }

    method actualizarCategoria(_categoria) {
        categoria = _categoria
    }
    method actualizarBonoResultado(_tipoBono) {
        tipoResultados = _tipoBono
    }
}
//------------------Adicional Roque------------------
object roque {

    const neto = 28000
    var tipoResultados = bonoNulo

    method obtenerNeto() = neto

    method actualizarBonoResultado(_tipoBono) {
        tipoResultados = _tipoBono
    }    
    method calcularSueldo() {
        return neto + tipoResultados.bono(self) + 9000
    }
}
//------------------Adicional Ernesto------------------
object ernesto {
    
    const diasFaltados = 0
    var compañeroTrabajo = pepe
    var tipoPresentismo = presentismoNulo

    method obtenerNeto() = compañeroTrabajo.obtenerNeto()
    method diasFaltados() = diasFaltados

    method actualizarCompañero(_compañero) {
        compañeroTrabajo = _compañero
    }
    method actualizarBonoPresentismo(_tipoPresentismo) {
        tipoPresentismo = _tipoPresentismo
    }
    method calcularSueldo() {
        return self.obtenerNeto() + tipoPresentismo.presentismo(self)
    }
}

// ------------------Categorias------------------
object gerente {
    method neto() = 15000
}
object cadete {
    method neto() = 20000
}
// ------------Categorias Adicionales------------
object vendedor{
    const netoSinAumento = 16000
    var vendioMucho = false
    
    method neto() {
        if (vendioMucho == true) {
            return netoSinAumento * 1.25
        } else {
            return netoSinAumento
        }
    }
    method activarAumento() {
        vendioMucho = true
    }
    method desactivarAumento() {
        vendioMucho = false
    }
}

object medioTiempo {
    method medioTiempo(categoria) {
        return categoria.neto() * 0.5
    }
}
// ------------------Resultados------------------
object bonoNulo {
    method bono(empleado) = 0
}
object bonoFijo {
    method bono(empleado) = 800
}
object bonoPorcentaje {
    method bono(empleado) = empleado.obtenerNeto() * 0.1
}
// ------------------Presentismos------------------
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