    require_relative "p6"

    #Clase Node, contiene el valor, el nodo siguiente y el nodo previo
    #@attr value Valor contenido en el nodo
    #@attr next Nodo siguiente al actual
    #@attr prev nodo previo al actual

    Node = Struct.new(:value,:next,:prev)

    #Es una clase que representa una lista doblemente enlazada usando la clase Node
    #@author Guillermo Hernández González
    #@attr_reader head Devuelve el nodo  cabeza de la Lista
    #@attr_reader tail Devuelve el nodo cola de la Lista
    
    class List
        include Enumerable
        attr_reader :head,:tail
        
        # Construye una lista doblemente enlazada tras pasarle dos parámetros, head y tail

        def initialize(head_,tail_)
            @head = head_
            @tail = tail_
        end

        # Inserta un nuevo nodo por la cabeza y la cabeza antigua pasa a ser el next

        def insert_head(value)
            if (head==nil) then
                @head=Node.new(value,nil,nil)
                @tail=@head
            else
                temp=Node.new(value,@head,nil)
                @head.prev=temp
                @head=temp
            end
        end

        # Extrae el nodo de la cabeza, el nodo siguiente pasa a ser la siguiente cabeza y devuelve el valor de la antigua cabeza.

        def extract_head 
            temp = @head
            @head = @head.next
            @head.prev = nil
            return temp
        end
        
        # Devuelve el valor de la cabeza sin extraerla

        def value_head
            temp = @head
            return temp
        end

        # Extrae el nodo de la cola, el anterior pasa a ser la nueva cola y luego devuelve el valor de la cola antigua

        def extract_tail
            if @tail!=nil then
                temp = @tail
                @tail = @tail.prev
                if @tail!=nil then
                    @tail.next = nil
                end
                return temp
            end
        end

        # Devuelve el valor de la cola sin extraerla

        def value_tail
            temp = @tail
            return temp
        end

        # Definición del método each necesario para que la clase sea enumerable

        def each 
            node=@head
            while(node!=nil) do
                yield node.value
                node = node.next
            end
        end

end