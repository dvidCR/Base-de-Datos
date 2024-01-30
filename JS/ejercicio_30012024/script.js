function Ejercicio1() {
    [
        {
          "nombre": "Francisco Ramirez",
          "edad": 29,
          "puesto": "Contable",
          "Emails": [
            "francisco@gmail.com",
            "francisco@hotmail.es",
            "francisco@thebridgeschool.es"
          ]
        },
        {
            "nombre": "Isabel Pérez",
            "edad": 31,
            "puesto": "Profesora",
            "Emails": [
              "isabel@gmail.com",
              "isabel@hotmail.es",
              "isabel@thebridgeschool.es"
            ]
          }
      ]

    console.log(JSON.parse('{"Emails": "isabel@thebridgeschool.es"}'))
}



function Ejercicio2() {
    [
    {
        "localidade 1": {
        "Continente": "África",
        "País": "Angola",
        "Capital": "Luanda"
        },
        "localidade 2": {
        "Continente": "América do Norte",
        "País": "Estados Unidos",
        "Capital": "Washington DC"
        },
        "localidade 3": {
        "Continente": "América Central",
        "País": "México",
        "Capital": "Cidade do México"
        },
        "localidade 4": {
        "Continente": "América do Sul",
        "País": "Brasil",
        "Capital": "Brasília"
        },
        "localidade 5": {
        "Continente": "Europa",
        "País": "Espanha",
        "Capital": "Madri"
        },
        "localidade 6": {
        "Continente": "Europa",
        "País": "Alemanha",
        "Capital": "Berlim"
        },
        "localidade 7": {
        "Continente": "Oceania",
        "País": "Austrália",
        "Capital": "Camberra"
        },
        "localidade 8": {
        "Continente": "Ásia",
        "País": "Japão",
        "Capital": "Tóquio"
        }
    }
    ]

    console.log(JSON.parse('"localidade 8"').pais);

    var contL = 9;
    var continente = prompt("Que contienete es");
    var pais = prompt("Que pais va a ser");
    var capital = prompt("Cual es su capital");
    /*"localidad" + contL {
        "Continente": continente,
        "País": pais,
        "Capital": capital
    }*/

    JSON.parse["localidad 4"] = "Población"
}

function Ejercicio3() {
    [
        {
            "Nombre": "Gofres Belgas",
            "Precio": 5.95,
            "Descripción": "Dos de nuestros gofres belgas con abundante sirope",
            "Calorías": 650
        },
        {
            "Nombre": "Gofres Belgas con Fresas",
            "Precio": 7.95,
            "Descripción": "Ligeros gofres belgas cubiertod de fresas y nata montada",
            "Calorías": 900
        },
        {
            "Nombre": "Gofres Belgas con frutas del bosque",
            "Precio": 8.95,
            "Descripción": "Ligeros gofres belgas cubiertos con frutas del bosque y nata montada",
            "Calorías": 900
        },
        {
            "Nombre": "Tostada Francesa",
            "Precio": 4.50,
            "Descripción": "Dos gruesas rebanadas de nuestro pan francés casero",
            "Calorías": 600
        },
        {
            "Nombre": "Desayuno de la casa",
            "Precio": 6.95,
            "Descripción": "Dos huevos, bacon o salchicha, tostada y patatas fritas",
            "Calorías": 950
        },
    ]
}