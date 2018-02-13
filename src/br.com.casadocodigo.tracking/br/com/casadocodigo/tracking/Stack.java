package br.com.casadocodigo.tracking;

import java.lang.System.Logger;
import java.lang.System.Logger.Level;

import java.util.stream.*;

public class Stack {

  private static final Logger logger = System.getLogger("CustomLogger");

  public static void logDebugTrace() {
    StackWalker.getInstance()
      .walk(stream -> stream.skip(1)
      .peek(element -> logger.log(Level.TRACE,
        "linha " + element.getLineNumber()
        + " do método " + element.getMethodName()
        + " na classe  " + element.getClassName()
      ))
      .collect(Collectors.toList()));
  }

  public static void logDebugTraceLegacy() {
    Logger logger = System.getLogger("CustomLogger");

    StackTraceElement[] stacks = new Throwable().getStackTrace();

    for(StackTraceElement element: stacks) {
      String className = element.getClassName();
      String methodName = element.getMethodName();
      int lineNumber = element.getLineNumber();

      logger.log(Level.TRACE, "linha " + lineNumber
        + " do método " + methodName
        + " na classe " + className
      );
    }
  }

}
