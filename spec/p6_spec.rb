
RSpec.describe P6 do

  describe Alimento do
    before :each do
      @a1 = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
    end

    it "has a version number" do
      expect(P6::VERSION).not_to be nil
    end

    it "Se comprueba que el alimento tiene nombre " do
      expect(@a1.nombre).not_to be nil
    end

    it "Se comprueba que existe la emisión de gases efecto invernadero " do
      expect(@a1.gases).not_to be nil
    end

    it "Se comprueba que existe el dato de terreno utilizado " do
      expect(@a1.terreno).not_to be nil
    end

    it "Se comprueba que existe un método que devuelve el nombre" do
      expect(@a1).to respond_to(:nombre)
    end

    it "Se comprueba que existe un método que devuelve los gases de efecto invernadero" do
      expect(@a1).to respond_to(:gases)
    end

    it "Se comprueba que existe un método que devuelve el el terreno utilizado" do
      expect(@a1).to respond_to(:terreno)
    end

    it "Se comprueba que existe un método que devuelve el alimento formateado" do
      expect(@a1).to respond_to(:to_string)
    end

    it "Se comprueba que existe un método que devuelve el valor energético de un alimento" do
      expect(@a1).to respond_to(:val_ener)
    end

    

    describe "Comparaciones práctica 8 alimentos" do
      before :each do
        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
      end

      it "Funciona el método <=> " do

        expect(@a1 <=> @cerdo).to eq(-1)
        expect(@a1 <=> @vaca).to eq(0)
        expect(@a1 <=> @cerveza).to eq(1)
      end

      context "Módulos mixins" do

        it "Funciona el método <" do

          expect(@a1 < @cerdo).to eq(true)
          expect(@a1 < @cerveza).to eq(false)
        end

        it "Funciona el método >" do

          expect(@a1 > @cerveza).to eq(true)
          expect(@a1 > @cerdo).to eq(false)
        end

        it "Funciona el método ==" do
          expect(@a1 == @vaca).to eq(true)
          expect(@a1 == @cordero).to eq(false)
        end

        it "Funciona el método <=" do
          expect(@a1 <= @vaca).to eq(true)
          expect(@a1 <= @cerveza).to eq(false)
          expect(@a1 <= @cerdo).to eq(true)
        end

        it "Funciona el método >=" do
          expect(@a1 >= @vaca).to eq(true)
          expect(@a1 >= @cerveza).to eq(true)
          expect(@a1 >= @cerdo).to eq(false)
        end

        it "Funciona el método between?" do
          expect(@a1.between?(@cerveza,@cerdo)).to eq(true)
        end

        it "Funciona el método clamp" do
          expect(@a1.clamp(@cerveza,@vaca)).to eq(@a1)
          expect(@a1.clamp(@cerveza,@tofu)).to eq(@tofu)
          expect(@a1.clamp(@cordero,@pollo)).to eq(@cordero)
        end
      end
    end
    context "Enumerables práctica 8 alimentos" do
      before :each do
        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
        @List12 = List.new(nil,nil)
        @List12.insert_head(@vaca)
        @List12.insert_head(@cerdo)
      end
      it "Funciona el método each" do
        sum = 0
        @List12.each do |i|
          sum+=i.val_ener
        end
        expect(sum).to eq((@cerdo.val_ener+@vaca.val_ener))
      end
      it "Funciona el método sort" do
        expect(@List12.sort).to eq([@vaca,@cerdo])
      end
      it "Funciona el método select" do
        expect(@List12.select{ |i| i == @cerdo }).to eq([@cerdo])
      end
      it "Funciona el método collect" do
        expect(@List12.collect{|x| x}).to eq([@cerdo,@vaca])
      end
      it "Funciona el método max" do
        expect(@List12.max).to eq(@cerdo)
      end
      it "Funciona el método min" do
        expect(@List12.min).to eq(@vaca)
      end
    end
    
    context "Pruebas clase BasicPlato" do
      before :each do
        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
        @List3 = List.new(nil,nil)
        @List3.insert_head(@cordero)
        @List3.insert_head(@choco)
        @List3.insert_head(@tofu)
        @plato1 = BasicPlato.new("Ataque al corazón",@List3)
      end
      it "El plato tiene nombre" do
        expect(@plato1.nombre).not_to be(nil)
      end
      it "Existe la List de alimento" do
        expect(@plato1.lista_alimentos.head.value).not_to be(nil)
      end
      it "Existe un método que devuelva el número de gramos del plato" do
        expect(@plato1.gramos).to eq(300)
      end
      it "Se calcula el % de proteínas del conjunto de alimentos" do
        expect(@plato1.proteinas).to eq(18.0+5.3+8.0)
      end
      it "Se calcula el % de lípidos del conjunto de alimentos" do
        expect(@plato1.lipidos).to eq(17.0+30.0+4.8)
      end
      it "Se calcula el % de hidratos de carbono del conjunto de alimentos" do
        expect(@plato1.hidratos_carbono).to eq(0.0+47.0+1.9)
      end
      it "Se calcula el valor calórica total del conjunto de alimentos" do 
        expect(@plato1.vct).to eq(@choco.val_ener+@cordero.val_ener+@tofu.val_ener)  
      end
      it "Se obtiene el plato formateado" do
        expect(@plato1.to_s).to respond_to
      end

      context "Pruebas clase Plato" do
        before :each do
        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
        @List4 = List.new(nil,nil)
        @List4.insert_head(@cordero)
        @List4.insert_head(@choco)
        @List4.insert_head(@tofu)
        @plato2 = Plato.new("Diabetes",@List4)
        end
      it "Valor total de la emisiones diarias de de gases de efecto invernadero del conjunto de alimentos" do
        expect(@plato2.gei).to eq(20.0+2.3+2.0)
      end
      it "Estimación de los metros cuadrados de uso de terreno del conjunto de alimentos" do
        expect(@plato2.terrenos).to eq(185.0+3.4+2.2)
      end
      it "Se obtiene la eficiencia energética formeateada" do
        expect(@plato2.to_s).to respond_to
      end
    end

    context "Comprobar clase plato" do
      before :each do
        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco=Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
        @List4 = List.new(nil,nil)
        @List4.insert_head(@cordero)
        @List4.insert_head(@choco)
        @List4.insert_head(@tofu)
        @plato1 = BasicPlato.new("Ataque al corazón",@List4)
        @plato2 = Plato.new("Diabetes",@List4)
        end
      it "comprobar la clase" do
        expect(@plato2).is_a?(Plato)
        expect(@plato1).is_a?(BasicPlato)
      end
      it "comprobar el tipo de objeto" do
        expect(@plato2).kind_of?(BasicPlato)
        expect(@plato2).kind_of?(Plato)
      end
      it "comprobar la jerarquia de clases " do
        expect(Plato.ancestors.include? BasicPlato).to eq(true)
        expect(Plato.ancestors.include? Alimento).to eq(false)
      end
    end

    context "Pruebas Plato comparable" do
      before :each do

        @cordero = Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0)
        @cerdo = Alimento.new("Cerdo",(9*21.5),(9*0.0),(9*6.3),(9*7.6),(9*11.0))
        @choco = Alimento.new("Chocolate",5.3,47.0,30.0,2.3,3.4)
        @vaca = Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0)
        @cerveza = Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4))
        @pollo = Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5))
        @tofu = Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)
        @cafe = Alimento.new("Cafe",0.1,0.0,0.0,0.4,0.3)
        @List4 = List.new(nil,nil)
        @List5 = List.new(nil,nil)
        @List6 = List.new(nil,nil)
        @List4.insert_head(@cordero)
        @List4.insert_head(@choco)
        @List4.insert_head(@tofu)
        @List5.insert_head(@tofu)
        @List6.insert_head(@cafe)
        @plato1 = Plato.new("Ataque al corazón",@List4)
        @plato2 = Plato.new("Diabetes",@List5)
        @plato3 = Plato.new("Cafeina",@List6)
      end
    # it "funciona el método <=>" do
    #   expect(@plato1<=>@plato1).to eq(0)
    #   expect(@plato1<=>@plato2).to eq(1)
    #   expect(@plato3<=>@plato2).to eq(-1)
    # end

    # it "metodo <" do
    #   expect(@plato1<@plato2).to eq(false)
    #   expect(@plato2<@plato1).to eq(true)
    # end
    # it "metodo >" do
    #   expect(@plato1>@plato2).to eq(true)
    #   expect(@plato2>@plato1).to eq(false)
    # end

    # it "metodo ==" do
    #   expect(@plato1==@plato1).to eq(true)
    #   expect(@plato2==@plato1).to eq(false)
    # end

    # it "metodos >= y <=" do
    #   expect(@plato1<=@plato2).to eq(false)
    #   expect(@plato2<=@plato1).to eq(true)
    #   expect(@plato1>=@plato2).to eq(true)
    #   expect(@plato2>=@plato1).to eq(false)
    #   expect(@plato1<=@plato1).to eq(true)
    #   expect(@plato1>=@plato1).to eq(true)
    # end

    # it "metodo between?" do
    #   expect(@plato1.between?(@plato2,@plato2)).to eq(false)
    # end
    # it "metodo clamp" do
    #   expect(@plato1.clamp(@plato2,@plato2).vct).to eq(@plato2.vct)
    # end
  end
  end

  context "Comparacion y enumeracion de los platos de cada dieta" do
    before :each do

      #espanola 20p40c40g


      @alimentosE1=List.new(nil,nil)
      @alimentosE1.insert_head(Alimento.new("Café", 0.05, 0.0, 0.0, 0.2, 0.15))
      @alimentosE1.insert_head(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
      @platoE1=Plato.new("Cortado",@alimentosE1)

      @alimentosE2=List.new(nil,nil)
      @alimentosE2.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0, 328.0))
      @alimentosE2.insert_head(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
      @platoE2=Plato.new("Filete de ternera con salsa de frutos secos",@alimentosE2)

      @alimentosE3=List.new(nil,nil)
      @alimentosE3.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      @alimentosE3.insert_head(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
      @platoE3=Plato.new("Brownie con nueces",@alimentosE3)

      @espanola= List.new(nil,nil)
      @espanola.insert_head(@platoE1)
      @espanola.insert_head(@platoE2)
      @espanola.insert_head(@platoE3)

      #@vasca#15p60c25g
      @alimentosV1=List.new(nil,nil)
      @alimentosV1.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))#huevos
      @alimentosV1.insert_head(Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      @platoV1=Plato.new("Cortado largo",@alimentosV1)

      @alimentosV2=List.new(nil,nil)
      @alimentosV2.insert_head(Alimento.new("Cerveza", 1.0, 7.2, 0.0, 0.48, 0.44))
      @alimentosV2.insert_head(Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
      @platoV2=Plato.new("Filete de ternera con salsa de frutos secos",@alimentosV2)

      @alimentosV3=List.new(nil,nil)
      @alimentosV3.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      @platoV3=Plato.new("Tarta de chocolate",@alimentosV3)

      @vasca= List.new(nil,nil)
      @vasca.insert_head(@platoV1)
      @vasca.insert_head(@platoV2)
      @vasca.insert_head(@platoV3)


      #vegetariana#española 85%carne=leche 15%=huevos

      @alimentosVEG1=List.new(nil,nil)
      @alimentosVEG1.insert_head(Alimento.new("Café", 0.05, 0.0, 0.0, 0.2, 0.15))
      @alimentosVEG1.insert_head(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
      @platoVEG1=Plato.new("Cafe frutoso",@alimentosVEG1)

      @alimentosVEG2=List.new(nil,nil)
      @alimentosVEG2.insert_head(Alimento.new("Leche de vaca", 3.3*1.7, 4.8*1.7, 3.2*1.7, 3.2*1.7, 8.9*1.7))
      @alimentosVEG2.insert_head(Alimento.new("Huevos", 13.0*0.3, 1.1*0.3, 11.0*0.3, 4.2*0.3, 5.7*0.3))
      @alimentosVEG2.insert_head(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
      @platoVEG2=Plato.new("Medley vegetariano",@alimentosVEG2)

      @alimentosVEG3=List.new(nil,nil)
      @alimentosVEG3.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      @alimentosVEG3.insert_head(Alimento.new("Nuez", 10.0, 10.5, 27.0, 0.15, 3.95))
      @platoVEG3=Plato.new("Brownie con nueces",@alimentosVEG3)

      @vegetariana= List.new(nil,nil)
      @vegetariana.insert_head(@platoVEG1)
      @vegetariana.insert_head(@platoVEG2)
      @vegetariana.insert_head(@platoVEG3)



      #vegetaliana#50c 50g
      @alimentosVEL1=List.new(nil,nil)
      @alimentosVEL1.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
      @alimentosVEL1.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
      @platoVEL1=Plato.new("Cafe frutoso largo",@alimentosVEL1)

      @alimentosVEL2=List.new(nil,nil)
      @alimentosVEL2.insert_head(Alimento.new("Lentejas", 23.5*1.5, 52.0*1.5, 1.4*1.5, 0.4*1.5, 3.4*1.5))
      @alimentosVEL2.insert_head(Alimento.new("Cerveza", 1.0, 7.2, 0.0, 0.48, 0.44))
      @alimentosVEL2.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
      @platoVEL2=Plato.new("Lentejas con tofu",@alimentosVEL2)

      @alimentosVEL3=List.new(nil,nil)
      @alimentosVEL3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
      @platoVEL3=Plato.new("Sopa de tofu",@alimentosVEL3)

      @vegetaliana= List.new(nil,nil)
      @vegetaliana.insert_head(@platoVEL1)
      @vegetaliana.insert_head(@platoVEL2)
      @vegetaliana.insert_head(@platoVEL3)



      #Carnivora:50% carne
      @alimentosC1=List.new(nil,nil)
      @alimentosC1.insert_head(Alimento.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7))
      @alimentosC1.insert_head(Alimento.new("Cerdo", 21.5*1.5, 0.0, 6.3*1.5, 7.6*1.5, 11.0*1.5))
      @platoC1=Plato.new("Desayuno americano",@alimentosC1)

      @alimentosC2=List.new(nil,nil)
      @alimentosC2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))
      @alimentosC2.insert_head(Alimento.new("Leche de vaca", 3.3*0.5, 4.8*0.5, 3.2*0.5, 3.2*0.5, 8.9*0.5))
      @alimentosC2.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0, 328.0))
      @platoC2=Plato.new("Steak + café con leche",@alimentosC2)

      @alimentosC3=List.new(nil,nil)
      @alimentosC3.insert_head(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
      @alimentosC3.insert_head(Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
      @platoC3=Plato.new("Lentejas compuestas",@alimentosC3)

      @carnivora= List.new(nil,nil)
      @carnivora.insert_head(@platoC1)
      @carnivora.insert_head(@platoC2)
      @carnivora.insert_head(@platoC3)

    end
    context "comparacion" do

    #   it "Funciona el método <" do
    #     expect(@platoE1<@platoE2).to eq(true)
    #     expect(@platoE3<@platoE2).to eq(false)

    #     expect(@platoV1<@platoV2).to eq(true)
    #     expect(@platoV3<@platoV2).to eq(false)

    #     expect(@platoVEG1<@platoVEG2).to eq(true)
    #     expect(@platoVEG3<@platoVEG2).to eq(false)

    #     expect(@platoVEL1<@platoVEL2).to eq(false)
    #     expect(@platoVEL3<@platoVEL2).to eq(true)

    #     expect(@platoC1<@platoC2).to eq(false)
    #     expect(@platoC3<@platoC2).to eq(false)
    #   end
    #   it "Funciona el método >" do
    #     #el not to es para que fuese mas facil de copiar lo de arriba y modificarlo
    #     expect(@platoE1>@platoE2).not_to eq(true)
    #     expect(@platoE3>@platoE2).not_to eq(false)

    #     expect(@platoV1>@platoV2).not_to eq(true)
    #     expect(@platoV3>@platoV2).not_to eq(false)

    #     expect(@platoVEG1>@platoVEG2).not_to eq(true)
    #     expect(@platoVEG3>@platoVEG2).not_to eq(false)

    #     expect(@platoVEL1>@platoVEL2).not_to eq(false)
    #     expect(@platoVEL3>@platoVEL2).not_to eq(true)

    #     expect(@platoC1>@platoC2).not_to eq(false)
    #     expect(@platoC3>@platoC2).not_to eq(false)
    #   end

    #   it "Funciona el método ==" do
    #     expect(@platoE1==@platoE1).to eq(true)
    #     expect(@platoV1==@platoV1).to eq(true)
    #     expect(@platoVEG1==@platoVEG1).to eq(true)
    #     expect(@platoVEL1==@platoVEL1).to eq(true)
    #     expect(@platoC1==@platoC1).to eq(true)

    #     expect(@platoE2==@platoE2).to eq(true)
    #     expect(@platoV2==@platoV2).to eq(true)
    #     expect(@platoVEG2==@platoVEG2).to eq(true)
    #     expect(@platoVEL2==@platoVEL2).to eq(true)
    #     expect(@platoC2==@platoC2).to eq(true)

    #     expect(@platoE3==@platoE3).to eq(true)
    #     expect(@platoV3==@platoV3).to eq(true)
    #     expect(@platoVEG3==@platoVEG3).to eq(true)
    #     expect(@platoVEL3==@platoVEL3).to eq(true)
    #     expect(@platoC3==@platoC3).to eq(true)
    #   end

    #   it "Funciona el métodos >= y <=" do
    #     expect(@platoE1<=@platoE2).to eq(true)
    #     expect(@platoE3<=@platoE2).to eq(false)
    #     expect(@platoE1<=@platoE1).to eq(true)

    #     expect(@platoV1<=@platoV2).to eq(true)
    #     expect(@platoV3<=@platoV2).to eq(false)
    #     expect(@platoV1<=@platoV1).to eq(true)

    #     expect(@platoVEG1<=@platoVEG2).to eq(true)
    #     expect(@platoVEG3<=@platoVEG2).to eq(false)
    #     expect(@platoVEG1<=@platoVEG1).to eq(true)

    #     expect(@platoVEL1<=@platoVEL2).to eq(false)
    #     expect(@platoVEL3<=@platoVEL2).to eq(true)
    #     expect(@platoVEL1<=@platoVEL1).to eq(true)

    #     expect(@platoC1<=@platoC2).to eq(false)
    #     expect(@platoC3<=@platoC2).to eq(false)
    #     expect(@platoC1<=@platoC1).to eq(true)


    #     expect(@platoE1>=@platoE2).not_to eq(true)
    #     expect(@platoE3>=@platoE2).not_to eq(false)
    #     expect(@platoE1>=@platoE1).to eq(true)

    #     expect(@platoV1>=@platoV2).not_to eq(true)
    #     expect(@platoV3>=@platoV2).not_to eq(false)
    #     expect(@platoV1>=@platoV1).to eq(true)

    #     expect(@platoVEG1>=@platoVEG2).not_to eq(true)
    #     expect(@platoVEG3>=@platoVEG2).not_to eq(false)
    #     expect(@platoVEG1>=@platoVEG1).to eq(true)

    #     expect(@platoVEL1>=@platoVEL2).not_to eq(false)
    #     expect(@platoVEL3>=@platoVEL2).not_to eq(true)
    #     expect(@platoVEL1>=@platoVEL1).to eq(true)

    #     expect(@platoC1>=@platoC2).not_to eq(false)
    #     expect(@platoC3>=@platoC2).not_to eq(false)
    #     expect(@platoC1>=@platoC1).to eq(true)
    #   end

    #   it "Funciona el método between?" do
    #     expect(@platoE2.between?(@platoE1,@platoE3)).to eq(true)
    #     expect(@platoE2.between?(@platoE3,@platoE3)).to eq(false)

    #     expect(@platoV2.between?(@platoV1,@platoV3)).to eq(true)
    #     expect(@platoV2.between?(@platoV3,@platoV3)).to eq(false)

    #     expect(@platoVEG2.between?(@platoVEG1,@platoVEG3)).to eq(true)
    #     expect(@platoVEG2.between?(@platoVEG3,@platoVEG3)).to eq(false)

    #     expect(@platoVEL2.between?(@platoVEL3,@platoVEL1)).to eq(true)
    #     expect(@platoVEL2.between?(@platoVEL3,@platoVEL3)).to eq(false)

    #     expect(@platoC1.between?(@platoC2,@platoC3)).to eq(true)
    #     expect(@platoC2.between?(@platoC3,@platoC3)).to eq(false)

    #   end

    #   it "Funciona el método clamp" do
    #     expect(@platoE2.clamp(@platoE1,@platoE3)).to eq(@platoE2)
    #     expect(@platoE2.clamp(@platoE3,@platoE3)).to eq(@platoE3)

    #     expect(@platoV2.clamp(@platoV1,@platoV3)).to eq(@platoV2)
    #     expect(@platoV2.clamp(@platoV3,@platoV3)).to eq(@platoV3)

    #     expect(@platoVEG2.clamp(@platoVEG1,@platoVEG3)).to eq(@platoVEG2)
    #     expect(@platoVEG2.clamp(@platoVEG3,@platoVEG3)).to eq(@platoVEG3)

    #     expect(@platoVEL2.clamp(@platoVEL3,@platoVEL1)).to eq(@platoVEL2)
    #     expect(@platoVEL2.clamp(@platoVEL3,@platoVEL3)).to eq(@platoVEL3)

    #     expect(@platoC1.clamp(@platoC2,@platoC3)).to eq(@platoC1)
    #     expect(@platoC2.clamp(@platoC3,@platoC3)).to eq(@platoC3)
    #   end
    end
      context "enumeracion" do
        it "Funciona el método collect" do
  
            expect(@espanola.collect{|x| x}).to eq([@platoE3,@platoE2,@platoE1])
            expect(@vasca.collect{|x| x}).to eq([@platoV3,@platoV2,@platoV1])
            expect(@vegetariana.collect{|x| x}).to eq([@platoVEG3,@platoVEG2,@platoVEG1])
            expect(@vegetaliana.collect{|x| x}).to eq([@platoVEL3,@platoVEL2,@platoVEL1])
            expect(@carnivora.collect{|x| x}).to eq([@platoC3,@platoC2,@platoC1])
        end
  
        # it "Funciona el método select" do
        #   expect(@espanola.select{|x| x >= @platoE2 }).to eq([@platoE3,@platoE2])
        #   expect(@vasca.select{|x| x >= @platoV2 }).to eq([@platoV3,@platoV2])
        #   expect(@vegetariana.select{|x| x >= @platoVEG2 }).to eq([@platoVEG3,@platoVEG2])
        #   expect(@vegetaliana.select{|x| x >= @platoVEL2 }).to eq([@platoVEL2,@platoVEL1])
        #   expect(@carnivora.select{|x| x >= @platoC3 }).to eq([@platoC3])
  
        #   expect(@espanola.select{|x| x < @platoE2 }).to eq([@platoE1])
        #   expect(@vasca.select{|x| x < @platoV2 }).to eq([@platoV1])
        #   expect(@vegetariana.select{|x| x < @platoVEG2 }).to eq([@platoVEG1])
        #   expect(@vegetaliana.select{|x| x < @platoVEL2 }).to eq([@platoVEL3])
        #   expect(@carnivora.select{|x| x < @platoC3 }).to eq([@platoC2,@platoC1])
        # end
        it "Funciona el método max" do
          expect(@espanola.max).to eq(@platoE3)
          expect(@vasca.max).to eq(@platoV3)
          expect(@vegetariana.max).to eq(@platoVEG3)
          expect(@vegetaliana.max).to eq(@platoVEL1)
          expect(@carnivora.max).to eq(@platoC3)
        end
  
        it "Funciona el método min" do
          expect(@espanola.min).to eq(@platoE1)
          expect(@vasca.min).to eq(@platoV1)
          expect(@vegetariana.min).to eq(@platoVEG1)
          expect(@vegetaliana.min).to eq(@platoVEL3)
          expect(@carnivora.min).to eq(@platoC2)
        end
  
        it "Funciona el método sort" do
          expect(@espanola.sort).to eq([@platoE1,@platoE2,@platoE3])
          expect(@vasca.sort).to eq([@platoV1,@platoV2,@platoV3])
          expect(@vegetariana.sort).to eq([@platoVEG1,@platoVEG2,@platoVEG3])
          expect(@vegetaliana.sort).to eq([@platoVEL3,@platoVEL2,@platoVEL1])
          expect(@carnivora.sort).to eq([@platoC2,@platoC1,@platoC3])
        end
    
    end
      
  end


    context "Huella nutricional" do
      before :each do
        @array1 = Array.new()
        @list1 = List.new(nil,nil)
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Carne de vaca", 42.2, 0.0, 6.2, 100.0*1000, 328.0))
        @list1.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @plato1 =Plato.new("Chuletoncio de vaca", @list1)
        @list2 = List.new(nil,nil)
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @list2.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4*1000, 0.3))
        @plato2 = Plato.new("Cafeina a tope", @list2)
        @list3 = List.new(nil,nil)
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @list3.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0*1000, 2.2))
        @plato3 = Plato.new("Tofu hasta en los pies",@list3)
        @list4 = List.new(nil,nil)
        @list4.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3*1000, 7.9))
        @list4.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3*1000, 7.9))
        @list4.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3*1000, 7.9))
        @list4.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3*1000, 7.9))
        @plato4 = Plato.new("Nuececitas para el amigo",@list4)
        @array1 << @plato1
        @array1 << @plato2
        @array1 << @plato3
        @array1 << @plato4
        @precio_menu = Array.new()
        @precio_menu << 20.0
        @precio_menu << 3.0
        @precio_menu << 9.0
        @precio_menu << 11.0
        @menut = Menu.new("prueba_nombre","prueba_descripcion",@array1,@precio_menu)
      end
      
      it "Comprobar el plato mayor" do
        expect(@array1.max).to eq(@plato1)
      end
      it "Cambiarle el precio al plato mayor" do
        temp_menu = @precio_menu.collect {|precio| precio* @array1.max.huella_ambiental * 0.5  }
        temp_menu.zip(@precio_menu).each do |precionuevo,precioprevio|
          expect(precionuevo).to eq(precioprevio* @array1.max.huella_ambiental * 0.5)
        end
      end
      it "La clase menú funca" do
        puts @menut.to_s
      end
      
        
      #


    end





    hombre = [Alimento.new("Carne de vaca",21.1,0.0,3.1,50.0,164.0),Alimento.new("Carne de cordero",18.0,0.0,17.0,20.0,185.0),Alimento.new("Chocolate",(5.3*4),(47.0*4),(30.0*4),(2.3*4),(3.4*4)),Alimento.new("Pollo",(20.6*5),(0.0*5),(5.6*5),(5.7*5),(7.1*5)),Alimento.new("Tofu",8.0,1.9,4.8,2.0,2.2)]
    mujer = [Alimento.new("Cerveza",(0.5*4),(3.6*4),(0.0*4),(0.24*4),(0.22*4)),Alimento.new("Cerdo",21.5,0.0,6.3,7.6,11.0),Alimento.new("Queso",(25.0*5),(1.3*5),(33.0*5),(11.0*5),(41.0*5)),Alimento.new("Cafe",0.1,0.0,0.0,0.4,0.3),Alimento.new("Tofu",(8.0*0.97),(1.9*0.97),(4.8*0.97),(2.0*0.97),(2.2*0.97))]
    prueba = Alimento.new("e",0,0,0,0,0)
    it "Se comprueba el cálculo del impacto ambiental diario de un hombre" do
      expect(510).to eq(prueba.impac_ambien(hombre).round)
    end

    it "Se comprueba el cálculo del impacto ambiental diario de una mujer" do
      expect(510).to eql(prueba.impac_ambien(hombre).round)
    end

    describe List do
      before :each do
        nodo1 = Node.new(7,nil,nil)
        nodo2 = Node.new(9,nil,nodo1)
        nodo1.next = nodo2
        @List = List.new(nodo1,nodo2)
      end

      it "Existe un nodo de la List con sus datos, su siguiente y su previo" do
        expect(@List.head).not_to be nil
        expect(@List.head.value).not_to be nil
        expect(@List.head.next).not_to be nil
        expect(@List.tail.prev).not_to be nil
      end

      it "Existe una List con su cabeza y su cola" do
        expect(@List.head).not_to be nil
        expect(@List.tail).not_to be nil
      end

      it "Se puede insertar un elemento en la List" do
        expect(@List.insert_head(100)).to respond_to
            end
  
      it "Se pueden insertar varios elementos en la List" do
        expect(@List.insert_head([150,45,97,324])).to respond_to
      end

      it "Se extrae el primer elemento de la List" do
        expect(@List).to respond_to(:extract_head)
      end
  
      it "Se extrae el ultimo elemento de la List" do
        expect(@List).to respond_to(:extract_tail)
      end

      it "Se comprueba las emisiones diarias, anuales y terreno estimado" do
        
        
        espanola=List.new(nil,nil)
        gases = 0
        terrenos = 0.0
        espanola.insert_head(Alimento.new("Camarones",17.6,1.5,0.6,18.0,2.0))
        espanola.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        espanola.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
        espanola.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        espanola.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
        espanola.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
        espanola.insert_head(Alimento.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3))

        while espanola.tail!=nil do
          gases+=espanola&.value_tail&.value&.gases
          terrenos+=espanola&.value_tail&.value&.terreno
          espanola.extract_tail
        end
        expect(gases).to eq(28.5)
        expect(10402.5).to eq(gases*365)
        expect(28.099999999999998).to eq(terrenos)


        vasca=List.new(nil,nil)
        vasca.insert_head(Alimento.new("Camarones",17.6,1.5,0.6,18.0,2))
        vasca.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        vasca.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
        vasca.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        vasca.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
        vasca.insert_head(Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
        vasca.insert_head(Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
        vasca.insert_head(Alimento.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4))
        
        gases=0
        terrenos=0
        while vasca.tail!=nil do
          gases+=vasca&.value_tail&.value&.gases
          terrenos+=vasca&.value_tail&.value&.terreno
          vasca.extract_tail
        end
        expect(gases).to eq( 27.779999999999998)
        expect(10139.699999999999).to eq(gases*365)
        expect(18.240000000000002).to eq(terrenos)


      vegetariana=List.new(nil,nil)
      vegetariana.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      vegetariana.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
      vegetariana.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      vegetariana.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      vegetariana.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      vegetariana.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))
      vegetariana.insert_head(Alimento.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9))

      
      gases=0
      terrenos=0
      while vegetariana.tail!=nil do
        gases+=vegetariana&.value_tail&.value&.gases
        terrenos+=vegetariana&.value_tail&.value&.terreno
        vegetariana.extract_tail
      end
      expect(gases).to eq(18.599999999999998)
      expect(6788.999999999999).to eq(gases*365)
      expect(55.8).to eq(terrenos)

      vegetaliana=List.new(nil,nil)
      vegetaliana.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      vegetaliana.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))
      vegetaliana.insert_head(Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
      vegetaliana.insert_head(Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
      vegetaliana.insert_head(Alimento.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22))
      vegetaliana.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))
      vegetaliana.insert_head(Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2))


      
      gases=0
      terrenos=0
      while vegetaliana.tail!=nil do
        gases+=vegetaliana&.value_tail&.value&.gases
        terrenos+=vegetaliana&.value_tail&.value&.terreno
        vegetaliana.extract_tail
      end
      expect(gases).to eq(7.32)
      expect(2671.8).to eq(gases*365)
      expect(16.360000000000003).to eq(terrenos)


      

    gases = 0
    terrenos= 0

      lococarne=List.new(nil,nil)
      lococarne.insert_head(Alimento.new("Carne de vaca",21.1,0,3.1,50.0,164.0))
      lococarne.insert_head(Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0))
      lococarne.insert_head(Alimento.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0))
      lococarne.insert_head(Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4))
      lococarne.insert_head(Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9))

      while lococarne.tail!=nil do
        gases+=lococarne&.value_tail&.value&.gases
        terrenos+=lococarne&.value_tail&.value&.terreno
        lococarne.extract_tail
      end

      expect(gases).to eq(80.19999999999999)
      expect(29272.999999999996).to eq(gases*365)
      expect(371.29999999999995).to eq(terrenos)
    end
    end
  end

end


