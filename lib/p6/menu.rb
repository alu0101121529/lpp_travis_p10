require "p6/p6"
require "p6/list"
require "p6/basicplato"


class Menu
    attr_reader :nombre,:descripcion,:platos,:precios
    def initialize(nombre,descripcion,lista_platos,lista_precios)
        @nombre = nombre
        @platos = lista_platos
        @precios = lista_precios
        @descripcion = descripcion
    end

    def insert(plato,precio)
        @platos << plato
        @precios << precio
    end

    def get_plato(indice)
        return @platos[indice]
    end

    def get_precio(indice)
        return @precios[indice]
    end

    def sum_precio
        sum=0
        @precios.each do |i|
            sum+=i
        end
        return sum
    end

    def to_s
        resultado = ""
        resultado +="Nombre: #{@nombre} \n"
        resultado +="Descripción: #{@descripcion} \n"
        resultado +="Precio total: #{sum_precio()} \n"
        @platos.zip(@precios).each do |plato,precio|
            resultado +="Plato: #{plato.nombre}   Precio: #{precio}€  Valor nutricional: #{plato.vct}  gases: #{plato.gei}  terreno: #{plato.terrenos} \n"
        end
        return resultado
    end
end