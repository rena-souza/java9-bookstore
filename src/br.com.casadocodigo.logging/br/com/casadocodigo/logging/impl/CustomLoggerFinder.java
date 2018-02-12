package br.com.casadocodigo.logging.impl;

import java.lang.System.Logger;
import java.lang.System.LoggerFinder;

public class CustomLoggerFinder extends LoggerFinder {

  @Override
  public Logger getLogger(String name, Module module) {

    System.out.printf("\nCustomLoggerFinder: [name=%s], module=%s \n", name, module.getName());

    return new CustomLogger(0);
  }

}
