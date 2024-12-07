import Foundation

// Estructura para representar un artículo
struct Articulo {
    let id: Int
    let nombre: String
    let cantidad: Int
}

// Lista global de artículos
var listaDeArticulos: [Articulo] = []

// Función para registrar un artículo
func registrarArticulo() {
    print("=== Registrar un artículo ===")

    // Solicitar el nombre del artículo
    print("Ingrese el nombre del artículo:")
    guard let nombre = readLine(), !nombre.isEmpty else {
        print("Nombre no válido.")
        return
    }

    // Solicitar la cantidad
    print("Ingrese la cantidad:")
    guard let cantidadInput = readLine(), let cantidad = Int(cantidadInput), cantidad > 0 else {
        print("Cantidad no válida.")
        return
    }

    // Generar un ID único para el artículo
    let id = (listaDeArticulos.last?.id ?? 0) + 1
    let nuevoArticulo = Articulo(id: id, nombre: nombre, cantidad: cantidad)

    // Agregar el artículo a la lista
    listaDeArticulos.append(nuevoArticulo)
    print("Artículo registrado con éxito: \(nuevoArticulo)")
}

// Función para mostrar la lista de artículos
func verListaDeArticulos() {
    print("=== Lista de artículos ===")
    if listaDeArticulos.isEmpty {
        print("No hay artículos registrados.")
    } else {
        for articulo in listaDeArticulos {
            print("ID: \(articulo.id), Nombre: \(articulo.nombre), Cantidad: \(articulo.cantidad)")
        }
    }
}

// Función para consultar artículos en existencia
func consultarArticulos() {
    print("=== Consultar artículos en existencia ===")
    if listaDeArticulos.isEmpty {
        print("No hay artículos registrados.")
    } else {
        let totalArticulos = listaDeArticulos.reduce(0) { $0 + $1.cantidad }
        print("Cantidad total de artículos en existencia: \(totalArticulos)")
    }
}

// Función principal del menú
func mostrarMenu() {
    var continuar = true

    while continuar {
        print("""
        \nMenú de opciones:
        1. Registrar un artículo
        2. Ver la lista de artículos
        3. Consultar los artículos en existencia
        4. Salir
        Selecciona una opción:
        """)

        if let input = readLine(), let opcion = Int(input) {
            switch opcion {
            case 1:
                registrarArticulo()
            case 2:
                verListaDeArticulos()
            case 3:
                consultarArticulos()
            case 4:
                print("Saliendo del programa.")
                continuar = false
            default:
                print("Opción no válida, intenta de nuevo.")
            }
        } else {
            print("Por favor, ingresa un número válido.")
        }
    }
}

// Ejecutar el menú
mostrarMenu()
