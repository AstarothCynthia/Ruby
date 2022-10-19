def mostrar(array)
    palabra = "["
    contenido = ""
    i = 1
    array.each do |element|
        contenido = contenido +" #{element}"
        if i != array.length
            contenido = contenido + ", "
        end
        i += 1
    end

    palabra = palabra + contenido + "]"
    
end

puts "------------------------------------------------
|            Impresiones de arreglos            |
------------------------------------------------"

pregunta = 1

while pregunta == 1

    puts "\n"
    puts "Ingrese una opción a realizar

    1) Imprimir todos los datos del arreglo.
    2) Imprimir números impares del 1 al 255.
    3) Imprimir arreglo que cambie de posición.
    "

    opcion = gets.chomp.to_i
    i = 0
    array = []

    case opcion
    when 1

        puts "\n"
        puts "Ingrese el largo del arreglo
        "
        numeroarreglo = gets.chomp.to_i
        
        while numeroarreglo > i
            i += 1
            puts "\n"
            puts "Ingrese el " + i.to_s + "° dato"
            array.push(gets.chomp)
            
        end

        puts "\n"
        puts "El arreglo dictado es:"
        puts mostrar(array)
        puts "\n"

    when 2

        while 255 > i
            i += 1
            if i%2 != 0
                array << i
            end            
        end

        puts "\n"
        puts "El arreglo de impares es:"
        puts mostrar(array)
        puts "\n"

    when 3

        puts "\n"
        puts "Ingrese el largo del arreglo
        "
        numeroarreglo = gets.chomp.to_i
        
        while numeroarreglo > i
            
            i += 1
            puts "\n"
            puts "Ingrese el " + i.to_s + "° dato"
            array.push(gets.chomp)
            
        end

        puts "\n"
        puts "El arreglo original es:"
       

        puts mostrar(array)
        puts "\n"

        puts "El nuevo arreglo es:"
        n = - 1

        ultimo = array[array.length - 1]

        array.each do |element|
            
            if n != array.length - 2
                array[n] = element
            else
                array[n] = ultimo
            end
            
            n += 1

        end

        puts mostrar(array)
        puts "\n"


    else
        puts "Opción no válida"
    end
    
    puts "\n"+"¿Quiere volver a realizar alguna opción?"
    puts "\n"
    puts "1) Si"
    puts "2) No"
    puts "\n"
    pregunta = gets.chomp.to_i
    
end