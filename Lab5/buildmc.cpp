#include <iostream>
#include <fstream>
#include <vector>  //for std::vector
#include <string>  //for std::string
#include <unistd.h>
#include <cstdlib>
using namespace std;

void getEstados(std::vector<char> v, int numeroEstados, char estados[]){
	int i = 1;
	int j = 1;
	int encontrado = 0;
	estados[0] = v[0];
	while(i<numeroEstados){
		while(j<v.size() || encontrado==1){
			if(v[j] != estados[i-1]){
				estados[i] = v[j];
				encontrado = 1;
				i++;
			}
			else
				j++;
			encontrado = j;
		}
	}
}
/*
 * Funcion que recorre el vector obtenido a partir de la lectura
 * del archivo que detalla la cadena y crea la matriz de markov, 
 * segun la aparicion de los elementos
 * Parametros: - std::vector<char> v, vector obtenido del archivo
               - double matrizMarkov[4][4], matriz de markov 
 */
void crearMatriz(std::vector<char> v, int numeroEstados, char estados[], double **&matrizMarkov){
	int i;
	int j = 0;
	int findi = 0;
	int findj = 0;
    // Recorrido del vector y comparacion de elementos

	for(i=0; i<v.size(); i++){
		if(i+1 < v.size()){
			for(j=0; j<numeroEstados; j++){
				if(v[i] == estados[j])
					findi = j;
			}

			for(j=0; j<numeroEstados; j++){
				if(v[i+1] == estados[j])
					findj = j;
			}
			matrizMarkov[findi][findj] += 1;
		}
	}
}

/*
 * Funcion que normaliza la matriz de markov construida inicialmente
 * para que la suma de las probabilidades de cada fila sean igual a 1
 * Parametros: - double matrizMarkov[4][4], matriz de markov 
 */
void normalizarMatriz(int numeroEstados, double **&matrizMarkov){
	int i, j;
	int cont[numeroEstados];

	for(i=0; i<numeroEstados; i++){
		cont[i] = 0;
	}

	for(i=0; i<numeroEstados; i++){
		for(j=0; j<numeroEstados; j++){
			cont[i] += matrizMarkov[i][j];
		}
	}

	for(i=0; i<numeroEstados; i++){
		for(j=0; j<numeroEstados; j++){
			matrizMarkov[i][j] = matrizMarkov[i][j]/cont[i];
		}
	}
}

double **arreglo(int numeroEstados){
    double **y=new double*[4];
 
    for(int i=0; i<numeroEstados; i++){
        for(int j=0; j<numeroEstados; j++){
            y[i][j]=0;
        }
    }
    return y;
}

void escribirArchivo(char *arch_out, int numeroEstados, double **matrizMarkov){
	int i, j;
    ofstream fsalida(arch_out, ios::out);
    for(i=0; i<numeroEstados; i++){
    	for (j=0; j<numeroEstados; j++){
    		fsalida << matrizMarkov[i][j] << " ";
    	}
        fsalida << "\n";
    }
    fsalida.close();
}
/*
 * Funcion principal
 */
int main(int argc, char* argv[]){
    
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
   
    if(index != 3){
        cout << "ERROR: Faltan parámetros en la línea de comandos" << endl;
        cout << "USO: ./buildmc -i archivodeentrada.txt -N numerodeestados -o cadenademarkov.txt" << endl;
        exit(1);
    }

    int i, j; 
    std::vector<char> temp;
    char letra;
    
    ifstream ficheroEntrada;
    ficheroEntrada.open (arch_in, ios::in);
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

    // Inicializacion de la matriz de Markov


    double matriz[numeroEstados][numeroEstados];
    
    for(i=0; i<numeroEstados; i++){
		for(j=0; j<numeroEstados; j++){
			matriz[i][j] = 0;
		}
	}
    double *p[numeroEstados];
    
    for(i=0; i<numeroEstados;i++)
    	p[i]=matriz[i];

    double **matrizMarkov;
    
    matrizMarkov = arreglo(numeroEstados);

    char estados[numeroEstados];

    getEstados(temp, numeroEstados, estados);

    crearMatriz(temp, numeroEstados, estados, matrizMarkov);

    normalizarMatriz(numeroEstados,matrizMarkov);

    escribirArchivo(arch_out, numeroEstados, matrizMarkov);

    return 0;
}