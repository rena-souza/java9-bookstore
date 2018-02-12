package br.com.casadocodigo.logging.impl;

import java.lang.System.Logger;
import java.util.ResourceBundle;
import java.text.MessageFormat;

public class CustomLogger implements Logger {

  private final int severity;

  public CustomLogger(int severity) {
    this.severity = severity;
  }

  @Override
  public String getName() {
    return this.getClass().getSimpleName();
  }

  @Override
  public boolean isLoggable(Level level) {
    return severity <= level.getSeverity();
  }

  @Override
  public void log(Level level, ResourceBundle bundle, String msg, Throwable throwable) {
    if(!isLoggable(level))
      return;

    System.out.printf("CustomLogger [%s] - %s%n", level, msg, throwable);
  }

  @Override
  public void log(Level level, ResourceBundle bundle, String format, Object... params) {
    if(!isLoggable(level))
      return;

    String formattedMsg = MessageFormat.format(format, params);
    System.out.printf("CustomLogger [%s] - %s%n", level, formattedMsg);
  }

}
