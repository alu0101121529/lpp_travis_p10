# Clase alimento, contiene toda la información para describir un alimento
# @author Guillermo Hernández González
# @attr_reader nombre devuelve el nombre del alimento
# @attr_reader gases devuelve las emisiones de gases diarias de un alimento
# @attr_reader terreno devuelve el terreno necesario para cultivar el alimento
# @attr_reader carbohidratos devuelve la cantidad de carbohidratos del alimento
# @attr_reader proteinas devuelve la cantidad de proteinas contenidos del alimento
# @attr_reader lipidos devuelve la cantidad de  lipidos contenidos del alimento
class Alimento
    include Comparable
    attr_reader :nombre,:proteinas,:carbohidratos,:lipidos,:gases,:terreno
    # Crea un alimento tras pasarle una serie de parámetros
    def initialize(n , pro , ch , l , g , te) 
        @nombre= n
        @proteinas= pro
        @carbohidratos= ch
        @lipidos= l
        @gases= g
        @terreno = te 
    end

    # Devuelve cada uno de los parámetros de Alimento como una string
    
    def to_string()
        "Nombre: #{@nombre} \n Proteínas: #{@proteinas} \n Carbohidratos: #{@carbohidratos} \n Lípidos: #{@lipidos} \n Gases de efecto invernadero: #{@gases} \n Terreno: #{@terreno} \n"
    end

    # Calcula el valor energético del alimento

    def val_ener
        kcal_ch = @carbohidratos*4
        kcal_lip = @lipidos*9
        kcal_pro = @proteinas*4

        return (kcal_ch + kcal_lip + kcal_pro)
    end

    
    def impac_ambien array
        total = 0
        total = array.sum { |array| array.gases + array.terreno }            
        return total
    end

    def <=>(other)
        val_ener <=> other.val_ener
    end


    

end 
