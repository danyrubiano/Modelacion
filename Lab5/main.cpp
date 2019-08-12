#include <iostream>
#include <fstream>
#include <vector>  //for std::vector
#include <string>  //for std::string
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
using namespace std;

/*
void identificarEstados(std::vector<char> v, int numeroEstados, char estados[]){
	int i = 0;
	int j = 0;

	estados[0] = v[v.size()-1];
	while(i<numeroEstados){
		while(j < v.size() ||)
	}
}
*/
/*
 * Funcion que recorre el vector obtenido a partir de la lectura
 * del archivo que detalla la cadena y crea la matriz de markov, 
 * segun la aparicion de los elementos
 * Parametros: - std::vector<char> v, vector obtenido del archivo
               - double matrizMarkov[4][4], matriz de markov 
 */
void crearMatriz(std::vector<char> v, double matrizMarkov[4][4]){
	int i;
    // Recorrido del vector y comparacion de elementos
	for(i=0; i<v.size(); i++){
		if(i+1<v.size()){
			if(v[i]=='A'){
				if(v[i+1]=='A')
					matrizMarkov[0][0]+=1;
				if(v[i+1]=='C')
					matrizMarkov[0][1]+=1;
				if(v[i+1]=='G')
					matrizMarkov[0][2]+=1;
				if(v[i+1]=='T')
					matrizMarkov[0][3]+=1;
			}
			if(v[i]=='C'){
				if(v[i+1]=='A')
					matrizMarkov[1][0]+=1;
				if(v[i+1]=='C')
					matrizMarkov[1][1]+=1;
				if(v[i+1]=='G')
					matrizMarkov[1][2]+=1;
				if(v[i+1]=='T')
					matrizMarkov[1][3]+=1;
			}
			if(v[i]=='G'){
				if(v[i+1]=='A')
					matrizMarkov[2][0]+=1;
				if(v[i+1]=='C')
					matrizMarkov[2][1]+=1;
				if(v[i+1]=='G')
					matrizMarkov[2][2]+=1;
				if(v[i+1]=='T')
					matrizMarkov[2][3]+=1;
			}
			if(v[i]=='T'){
				if(v[i+1]=='A')
					matrizMarkov[3][0]+=1;
				if(v[i+1]=='C')
					matrizMarkov[3][1]+=1;
				if(v[i+1]=='G')
					matrizMarkov[3][2]+=1;
				if(v[i+1]=='T')
					matrizMarkov[3][3]+=1;
			}
		}
	}
}

/*
 * Funcion que normaliza la matriz de markov construida inicialmente
 * para que la suma de las probabilidades de cada fila sean igual a 1
 * Parametros: - double matrizMarkov[4][4], matriz de markov 
 */
void normalizarMatriz(double matrizMarkov[4][4]){
	int i, j;
	int cont[4] = {0,0,0,0};

	for(i=0; i<4; i++){
		for(j=0; j<4; j++){
			cont[i] += matrizMarkov[i][j];
		}
	}

	for(i=0; i<4; i++){
		for(j=0; j<4; j++){
			matrizMarkov[i][j] = matrizMarkov[i][j]/cont[i];
		}
	}
}

/*
 * Funcion principal
 * Parametros: - double matrizMarkov[4][4], matriz de markov 
 */
int main(int argc, char* argv[]){
    /*
    char *arch_in;
    char *arch_out;
    int numeroEstados, index, opcion;
     
    // Uso de getopt() para los parametros en la linea de comandos 
    index = 0;
    while ((opcion = getopt(argc, argv, "i:I:o:O:n:N:")) != -1) {
        switch (opcion) {
        case 'i':
        case 'I':
            arch_in = (char*) optarg;
            index ++;
            break;
        case 'o':
        case 'O':
            arch_out = (char*) optarg;
            index ++;
            break;
        case 'n':
        case 'N':
            numeroEstados = atoi(optarg);
            index ++;
            break;
        case '?':
            cout << "ERROR: Parámetro no válido " << optarg << endl;
        default:
            abort();
            break;
      }
    }
   
    if(numeroEstados!=4){
        cout << "ERROR: Cantidad de estados en esta ocasión debe ser igual a 4" << endl;
        exit(1);
    }
   
    if(index != 3){
        cout << "ERROR: Faltan parámetros en la línea de comandos" << endl;
        cout << "USO: ./buildmc -i archivodeentrada.txt -N numerodeestados -o cadenademarkov.txt" << endl;
        exit(1);
    }
    */

    int i, j; 
    std::vector<char> temp;
    char letra;
    
    ifstream ficheroEntrada;
    ficheroEntrada.open ("hola.txt", ios::in);
    if (ficheroEntrada.is_open()) {
        while (! ficheroEntrada.eof() ) {
            letra = ficheroEntrada.get();
            //cout << letra;
            if(letra=='A' || letra=='C' || letra=='T' || letra=='G')
                temp.push_back(letra);
        }
        ficheroEntrada.close();
    }
    
    else cout << "Error al intentar abrir el archivo" << endl;
    
    /*
    for(i=0; i<temp.size(); i++){
    	cout << temp[i];
    }
    cout << "\n";
    */

    // Inicializacion de la matriz de Markov
    double matrizMarkov[4][4] = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
	/*
	 *     A C G T
	 *    -       -
	 * A | 0 0 0 0 |
	 * C | 0 0 0 0 |
	 * G | 0 0 0 0 |
	 * T | 0 0 0 0 |
	 *    -       -
	 */

    crearMatriz(temp, matrizMarkov);

    for(i=0; i<4;i++){
    	for(j=0; j<4; j++){
    		cout << matrizMarkov[i][j] << " ";
    	}
    	cout << "\n";
    }

    normalizarMatriz(matrizMarkov);

    for(i=0; i<4;i++){
    	for(j=0; j<4; j++){
    		cout << matrizMarkov[i][j] << " ";
    	}
    	cout << "\n";
    }

    return 0;
}