require "p6/p6"
require "p6/list"
require "p6/basicplato"

class PlatoDSL
    attr_accessor :nombre, :ingredientes, :peso

    def initialize(&block)
        @nombre
        @ingredientes = []
        @peso = []
        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block)
            end
        end
    end

    def to_s
        output = @nombre
        output << "\nIngredients:\n\n"
        @ingredientes.zip(@peso).each do |alimento, peso1|
            output << "\n " << alimento
            output << "\n Peso: " << peso1.to_s
        end
        output
    end

    def alimento(options = {})
        @ingredientes << options[:nombre] if options[:nombre]
        @pesos << options[:peso] if options[:peso]
    end
    
    def nombre(name)
        @name=name
    end
end


class Menu
    attr_reader :nombre,:platos,:precios
    def initialize(nombre,&block,&block)
        @nombre = nombre
        @platos = []
        @precios = []

        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
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
        resultado +="Precio total: #{sum_precio()} \n"
        @platos.zip(@precios).each do |plato,precio|
            resultado +="Plato: #{plato.nombre}   Precio: #{precio}€  Valor nutricional: #{plato.vct}  gases: #{plato.gei}  terreno: #{plato.terrenos} \n"
        end
        return resultado
    end
end