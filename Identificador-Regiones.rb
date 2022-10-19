require 'net/http'
require 'json'
require 'uri'

def mostrar_nombre(array, tipo)

    i = 1

    array.each do |e| 
        puts "Nombre " + tipo + " N°" + i.to_s + ": " + e["nombre"]
        i += 1
    end

end

def consultar(tipo, limite, descripcion)

    mensaje = tipo

    if  limite != ""
        mensaje += "?limit=" + limite.to_s
    end

    if  descripcion != ""
        mensaje += "&orderBy=codigo&orderDir="+ descripcion
    end

    uri = URI('https://apis.digital.gob.cl/dpa/' + mensaje)#ENDPOINT
    res = Net::HTTP.get_response(uri)
    resultado = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

end

def consultar_por_tipo(nombre, tipo, descripcion)

    tipo.each do |e|

        if sin_tilde(e[descripcion].to_s.downcase) == sin_tilde(nombre.to_s.downcase)
            return e        
        end
    end

end

def sin_tilde(cadena)

    hash_sub = {"á" => "a","é" => "e","í" => "i","ó" => "o","ú" => "u","ü" => "u"} 

    hash_sub.each do |e|
                
        if cadena.include?(e[0])
            cadena = cadena.sub e[0], e[1]
        end
    end

    return cadena

end

puts "------------------------------------------------
| Bienvenidos al Identificador de Regiones y comunas de Chile |
------------------------------------------------"

pregunta = 1

while pregunta == 1

    puts "\n"
    puts "Ingrese una opción a realizar"
    puts "\n"
    puts "1) 10 regiones ordenadas ascendentemente."
    puts "2) 20 comunas ordenadas descendentemente."
    puts "3) Mostrar los datos de la comuna donde vives."
    puts "\n"

    opcion = gets.chomp.to_i
    puts "\n"

    case opcion
    when 1
        mostrar_nombre(consultar("regiones", 10, "asc"), "región")
    when 2
        mostrar_nombre(consultar("comunas",20, "desc"), "comuna")
    when 3

        puts "Ingresa la comuna donde vives."
        nombre_comuna = gets.chomp
        puts "\n"
        
        comuna = consultar("comunas", "", "")
        provincia = consultar("provincias", "", "")
        region = consultar("regiones", "", "")

        dato1 = consultar_por_tipo(nombre_comuna, comuna , "nombre")

        if dato1.count > 7
            puts "Comuna no válida"
        else
            pp "Nombre comuna: " + dato1["nombre"]
            pp "Código comuna: " + dato1["codigo"]
            pp "Latitud comuna: " + dato1["lat"].to_s
            pp "Longitud comuna: " + dato1["lng"].to_s

            dato2 = consultar_por_tipo(dato1["codigo_padre"].to_s, provincia , "codigo")

            pp "Nombre provincia: " + dato2["nombre"].to_s
            
            dato3 = consultar_por_tipo(dato2["codigo_padre"].to_s, region , "codigo")

            pp "Nombre región: " + dato3["nombre"]
        end

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