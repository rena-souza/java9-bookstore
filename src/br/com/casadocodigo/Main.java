package br.com.casadocodigo;

import java.util.*;
import java.util.stream.*;
import java.util.function.*;
import br.com.casadocodigo.data.*;
import br.com.casadocodigo.model.*;
import br.com.casadocodigo.service.*;

public class Main {

	private static void println(Object object){
		System.out.println(String.valueOf(object));
	}

	public static void main(String... args) {

		println("\nLista de livros disponíveis \n");

		List<Book> books = Books.all();

		IntStream.range(0, books.size())
			.forEach(i -> {
				System.out.println(i + " - " + books.get(i).getName());
			});

		println("\nDigite o número do livro que quer comprar: \n");

		try {
			Scanner scanner = new Scanner(System.in);

			int number = scanner.nextInt();

			Book book = books.get(number);

			println("O livro escolhido foi: " + book.getName());
			println("Informe seu nome, para que possamos emitir a nota fiscal")	;

			scanner = new Scanner(System.in);
			String name = scanner.nextLine();

			NFEmissor emissor = new NFEmissor();
			emissor.emit(name, book);

			Books.findSimilar(book)
				.ifPresentOrElse( showSimilar, noSuggestions );

			println("Aperte o enter para sair");
			new Scanner(System.in).nextLine();

			emissor.close();
		} catch(Exception e) {
			System.err.println("Ops, aconteceu um erro: " + e);
		}
	}

	private static Consumer<Book> showSimilar = similar -> {
		println("\nTalvez você também goste do livro: " + similar.getName());
	};

	private static Runnable noSuggestions = () -> {
		println("\nNão temos nenhuma sugestão de livro similar no momento");
	};
}
