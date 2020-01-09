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
    attr_reader :nombre,:descripcion,:platos,:precio
    def initialize(nombre,&block)
        @nombre = nombre
        @platos = []
        @precios = []
        @descripcion
        @lipidos
        @proteinas
        @carbohidratos
        @gases 
        @terrenos

        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end

    def descripcion(desc)
        @descripcion = desc
    end
    
    def partes(options = {})
        @platos << options[:nombre] if options[:nombre]
        @precios << options[:precio] if options[:precio]
    end

    def valores_nutricion(options = {})
        @lipidos = options[:lips] if options[:lips]
        @proteinas = options[:prot] if options[:prot]
        @carbohidratos = options[:carbs] if options[:carbs]
    end

    def valores_ambientales(options = {})
        @gases = options[:gei] if options[:gei]
        @terrenos = options[:terreno] if options[:terreno]
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
        resultado +="Precio total: #{sum_precio()}€"
        @platos.zip(@precios).each do |plato,precio|
            resultado << "\n" << plato.nombre << " " << precio.to_s() << "€"
            resultado << "\n\nValores sobre la nutrición\n\nProteinas: " << plato.proteinas.to_s() << "\nLipidos: " << plato.lipidos.to_s() << "\nCarbo Hidratos: " << plato.hidratos_carbono.to_s()
            resultado << "\n\nValores sobre la contaminación\n\nGases: " << plato.gei.to_s() << "\nTerrenos " << plato.terrenos.to_s() << "\n"
        end
        return resultado
    end
end