require "p6/p6"
require "p6/list"

#Clase BasicPlato, contiene una lista de alimentos y el nombre del plato
#@author Guillermo Hernández González
#@see Alimento
#@see List
#@attr_reader nombre devuelve el nombre del Plato
#@attr_reader lista_alimentos devuelve la lista de alimentos que forman el Plato



class BasicPlato
    attr_reader :nombre, :lista_alimentos

    # Construye un plato tras pasarle su nombre y la lista de alimentos que lo compondrá

    def initialize (nombre,lista_alimentos)
        @nombre = nombre
        @lista_alimentos = lista_alimentos
    end

    # Devuelve la cantidad de gramos de comida total que hay en el plato

    def gramos
        grams = 0
        @lista_alimentos.each do |i|
            grams += 100
        end
        return grams
    end

    # Devuelve la cantidad de gramos de proteínas total que hay en el plato

    def proteinas
        proteins = 0
        @lista_alimentos.each do |i|
            proteins += i.proteinas
        end
        return proteins
    end

    # Devuelve la cantidad de gramos de lípidos total que hay en el plato

    def lipidos
        lipids = 0.0
        @lista_alimentos.each do |i|
            lipids += i.lipidos
        end
        return lipids
    end

    # Devuelve la cantidad de gramos de hidratos de carbono que hay en el plato

    def hidratos_carbono
        hc = 0
        @lista_alimentos.each do |i|
            hc += i.carbohidratos
        end
        return hc
    end

    # Devuelve el valor energético total del plato

    def vct
        vct = 0
        @lista_alimentos.each do |i|
            vct += i.val_ener
        end
        return vct
    end 

    # Devuelve un string que contiene todos los datos de todos los alimentos que forman el plato

    def to_s
        alimento = ""
        alimento +="Plato : #{@nombre} \n"
        @lista_alimentos.each do |i|
            alimento +=i.to_string
        end
        return alimento
    end

end

#Clase Plato, Hereda de la clase BasicPlato todos sus métodos y contiene un método extra para calcular la huella ambiental
#@see BasicPlato
#@author Guillermo Hernández González

class Plato < BasicPlato
    include Comparable

    # Construye un plato tras pasarle su nombre y la lista de alimentos que lo compondrá un plato

    def initialize(nombre,lista_alimentos)
        super(nombre,lista_alimentos)
    end

    # Devuelve la cantidad de gases generados

    def gei
        geis = 0
        @lista_alimentos.each do |i|
            geis += i.gases
        end
        return geis
    end

    # Devuelve la cantidad de terreno utilizado

    def terrenos
        terreno = 0
        @lista_alimentos.each do |i|
            terreno += i.terreno
        end
        return terreno
    end

    # Devuelve el nombre y la lista de alimentos en un string

    def to_plato_s
        aaa = ""
        aaa +="Plato: #{@nombre} \n"
        @lista_alimentos.each do |i|
            aaa +="Valor energético: #{i.val_ener} \n"
        end
        return aaa
    end

    # Método necesario para que la clase sea comparable

    def <=>(other)
        huella_ambiental <=> other.huella_ambiental
    end

    # Devuelve la huella ambiental del plato
    
    def huella_ambiental
        energia = 0.0
        carbono = 0.0
        huella = 0.0
        if vct < 670 then
            energia = 1.0
        elsif vct <= 830 then
            energia = 2.0
        else
            energia = 3.0
        end
        if gei < 800 then
            carbono = 1.0
        elsif terrenos <= 1200 then
            carbono = 2.0
        else
            carbono = 3.0
        end
        huella = (energia + carbono)/2
        return huella
        
    end
end