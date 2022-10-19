puts "-------------------
|Patrones de Manta|
-------------------"

pregunta = 1

while pregunta == 1

    puts "\n"+"Eligue el patrón a realizar"
    puts "1) RRGGBBYYKK"
    puts "2) ++*~~*++*"
    puts "3) =|/|/|=|/|"
    puts "4) Ingresar patrón propio"

    puts "\n"

    opciones = gets.chomp.to_i

    puts "\n"

    patron = ""

    if opciones == 1
        patron = "RRGGBBYYKK"

    elsif opciones == 2
        patron = "++*~~*++*"

    elsif opciones == 3
        patron = "=|/|/|=|/|"
    elsif opciones == 4
        puts "Ingrese su patrón"
        puts "\n"
        patron = gets.chomp
        puts "\n"
    end
    
    i = 1

    if patron != ""
        while i <= 20
            
            # puts i.to_s + " " + patron
            puts patron
            patron_aux = patron.slice(1,patron.size)
            patron_aux = patron_aux + patron[0]
            patron = patron_aux

            i += 1
        end
    else
        puts "Opción no válida"
    end

    puts "\n"+"¿Quiere volver a realizar el patrón?"
    puts "\n"
    puts "1) Si"
    puts "2) No"
    puts "\n"
    pregunta = gets.chomp.to_i

end