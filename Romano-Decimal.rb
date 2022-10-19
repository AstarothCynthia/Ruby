$hash = Hash.new("Dato no existente")

$hash = {1 => "I", 5 => "V", 10 => "X", 50 => "L", 100 => "C", 500 => "D", 1000 => "M", 5000 => "V̄", 10000 => "X̄", 50000 => "L̄", 100000 => "C̄", 500000 => "D̄", 1000000 => "M̄"}

def is_number?(obj)
    obj.to_s == obj.to_i.to_s
end

def entero_a_romano(numero)

    i = 1
    largo = numero.length
    romano = ""

    while i <= largo

        indice = (numero.slice(i-1)).to_i
        unidades = 10 ** (largo - i)

        if indice < 4
            
            romano = romano + $hash[(1 * unidades)].to_s * indice

        elsif indice == 4

            romano = romano + $hash[(1 * unidades)].to_s+$hash[(5 * unidades)].to_s

        elsif indice == 9

            romano = romano + $hash[(1 * unidades)].to_s+$hash[(10 * unidades)].to_s

        else

            romano = romano + $hash[(5 * unidades)].to_s + ($hash[(1 * unidades)].to_s * (indice - 5))

        end

        i += 1

    end

    return romano
end

puts "----------------------------------------------------------
| Convertidor de Sistema Decimal a N° Romano y Viceversa |
----------------------------------------------------------"

pregunta = 1

while pregunta == 1

    puts "\n"
    puts "Ingrese una opción a realizar"
    puts "\n"
    puts "1) De Sistema Decimal a Números Romanos."
    puts "2) De Números Romanos a Sistema Decimal."
    puts "\n"

    opcion = gets.chomp.to_i

    case opcion
    when 1

        respuesta = 0
        while respuesta == 0

            puts "\n"
            puts "Ingrese su número Entero"
            numero = gets.chomp
            puts "\n"

            if is_number?(numero)
                respuesta = 1
            else
                puts "Ingrese entero válido"
                puts "\n"
            end

        end

        romano = "El entero " + numero + " es igual al número "
        puts romano + entero_a_romano(numero) + " en Romano"    
        
    when 2

        suma = 0

        respuesta = 0
        while respuesta == 0

            puts "\n"
            puts "Ingrese su número Romano"
            romano = gets.chomp
            puts "\n"

            hash_invert = $hash.invert()
            
            hash_sub = {"IV" => 4, "IX" => 9, "XL" => 40, "XC" => 90, "CD" => 400, "CM" => 900, "MV̄" => 4000, "MX̄" => 9000, "X̄L̄" => 40000, "X̄C̄" => 90000, "C̄D̄" => 400000, "C̄M̄" => 900000}

            cadena = romano.upcase

            hash_sub.each do |e|
                
                if cadena.include?(e[0])
                    suma += e[1]
                    cadena = cadena.sub e[0], ""
                end
            end

            if cadena != ""

                i = 1

                while i <= cadena.length

                    indice = (cadena.upcase).slice(i-1)

                    hash_invert.each do |e|
                        
                        if e[0] == indice
                            suma += e[1]
                        end
                    end
                    i += 1
                    
                end
            end

            if romano.upcase == entero_a_romano(suma.to_s)
                respuesta = 1
            else
                puts "Ingrese Número Romano Válido"
            end

        end

        puts "El número romano " + romano.upcase + " es igual al entero " + suma.to_s        

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