/**
 * 
 */
package Examen_Java_06112023;

import java.util.Scanner;

public class examen_java_06112023 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int cont = 0;
		int negative = 0;
		int suma = 0;
		int promedio = 0;
		double promFinal = 0;
		int bucle = 0;
		
		do{
			System.out.print("Escribe un número: ");
			int number = sc.nextInt();
			if(number < 0){
				negative++;
			}
			if(number > 1 && number < 10){
				suma = suma + number;
			}
			promedio = promedio + number;
			cont++;
			System.out.print("Deseas salir (y/n): ");
			char exit = sc.next().charAt(0);
			if(exit == 'y'){
				promFinal = promedio / cont;
				bucle = 1;
			}else if(exit != 'n'){
				System.out.println("Me lo tomare como un no");
			}
		}while(bucle == 0);
		System.out.println(negative);
		System.out.println(suma);
		System.out.println(promFinal);
	}

}
