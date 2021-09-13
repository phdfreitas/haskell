/* =-=-= Primeira Questão =-=-=*/

// Implementacao da fila que eu vou usar na *implementacao da fila bloqueante*
// Possui apenas os metodos de inserir, remover e mostrar a fila
// A fila aceita apenas String, mas poderia ser uma fila de objetos
class Fila{
	private int comeco, fim, capacidade;
	private String fila[];
	
	Fila(int capacidade){
		this.comeco = this.fim = 0;
		this.capacidade = capacidade;
		this.fila = new String[capacidade]; 
	}
	
	public void insere(String s) {
		if(this.capacidade == this.fim) {
			System.out.println("Deu ruim.");
			return;
		}
		else {
			this.fila[fim] = s;
			fim++;
		}
	}
	
	public String remove() {
		if(this.comeco == this.fim) {
			return "Fila vazia";
		}
		else {
			for (int i = 0; i < this.fim - 1; i++) {
				this.fila[i] = this.fila[i + 1];
			}
			
			if(this.fim < this.capacidade) {
				this.fila[this.fim] = "";
			}
			
			this.fim--;
		}
		
		return this.fila[0];
	}
	
	public int tamanho() {
		return this.fim;
	}
	
	public void printFila() {
		if(this.comeco == this.fim) {
			System.out.println("Fila está vazia");
			return;
		}
		
		for (int i = this.comeco; i < this.fim; i++) {
			System.out.println(this.fila[i]);
		}
		return;
	}
}

// Implementacao da fila bloqueante
class FilaBloqueanteImplementada {
	
	// Chama a fila que eu implementei logo acima
	// A fila suporta no max 10 strings
	private Fila fila = new Fila(10); 
	
	public synchronized void insere(String s) throws InterruptedException{
		while(this.fila.tamanho() == 10) {
			wait();
		}
		if(this.fila.tamanho() == 0) {
			notifyAll();
		}
		this.fila.insere(s);
	}
	
	public synchronized String remove() throws InterruptedException{
		while(this.fila.tamanho() == 0) {
			wait();
		}
		if(this.fila.tamanho() == 10) {
			notifyAll();
		}
		return this.fila.remove();
	}
	
	// Como eu nao posso chamar o metodo printFila() diretamente na execucao 
	// eu criei esse metodo aqui pra poder testar a fila bloqueante
	public void mostraFila() {
		this.fila.printFila();
	}
}

public class FilaBloqueante{
	
	// Testando da fila bloqueante
	public static void main(String[] args) throws InterruptedException{
		
		FilaBloqueanteImplementada filablock = new FilaBloqueanteImplementada();
		
		filablock.insere("P1");
		filablock.insere("P2");
		filablock.insere("P3");
		filablock.mostraFila();
		filablock.remove();
		System.out.println("=-=-=-=-=-=-=");
		filablock.insere("P4");
		filablock.insere("P5");
		filablock.mostraFila();
	}
}