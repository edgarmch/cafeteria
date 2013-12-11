SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `cafeteria` DEFAULT CHARACTER SET latin1 ;
CREATE SCHEMA IF NOT EXISTS `cafeteria` DEFAULT CHARACTER SET latin1 ;
USE `cafeteria` ;

-- -----------------------------------------------------
-- Table `cafeteria`.`productotipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`productotipos` (
  `idtipoproducto` INT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoproducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`catalogos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`catalogos` (
  `idproducto` INT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `cantidad` INT NULL,
  `idtipoproducto` INT NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `ktipoproducti_idx` (`idtipoproducto` ASC),
  CONSTRAINT `ktipoproducti`
    FOREIGN KEY (`idtipoproducto`)
    REFERENCES `cafeteria`.`productotipos` (`idtipoproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`puestos` (
  `idpuesto` INT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idpuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`empleados` (
  `idempleados` INT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(45) NULL,
  `contraseña` VARCHAR(15) NULL,
  `idpuesto` INT NULL,
  PRIMARY KEY (`idempleados`),
  INDEX `k_puesto_idx` (`idpuesto` ASC),
  CONSTRAINT `k_puesto`
    FOREIGN KEY (`idpuesto`)
    REFERENCES `cafeteria`.`puestos` (`idpuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`mesas` (
  `idmesas` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NULL,
  `idempleados` INT NULL,
  PRIMARY KEY (`idmesas`),
  INDEX `k_mesas_idx` (`idempleados` ASC),
  CONSTRAINT `k_mesas`
    FOREIGN KEY (`idempleados`)
    REFERENCES `cafeteria`.`empleados` (`idempleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`Clientes` (
  `idclientes` INT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellidopat` VARCHAR(45) NULL,
  `apellidomat` VARCHAR(45) NULL,
  `fechanacimiento` DATE NULL,
  `direccion` VARCHAR(65) NULL,
  `correo` VARCHAR(45) NULL,
  `contraseña` VARCHAR(15) NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`ventas` (
  `idventas` INT NULL AUTO_INCREMENT,
  `fechaventas` DATE NULL,
  `utilidad` INT NULL,
  `idorden` INT NULL,
  PRIMARY KEY (`idventas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`ordenes` (
  `idorden` INT NULL AUTO_INCREMENT,
  `idclientes` INT NULL,
  `idproducto` INT NULL,
  `costototal` INT NULL,
  `fechaorden` DATE NULL,
  `ventas_idventas` INT NULL,
  PRIMARY KEY (`idorden`, `ventas_idventas`),
  INDEX `k_orden_cliente_idx` (`idclientes` ASC),
  INDEX `fk_orden_ventas1_idx` (`ventas_idventas` ASC),
  CONSTRAINT `k_orden_cliente`
    FOREIGN KEY (`idclientes`)
    REFERENCES `cafeteria`.`Clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orden_ventas1`
    FOREIGN KEY (`ventas_idventas`)
    REFERENCES `cafeteria`.`ventas` (`idventas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cafeteria`.`productosvendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`productosvendidos` (
  `catálogoidproducto` INT NULL,
  `ordenidorden` INT NULL,
  PRIMARY KEY (`catálogoidproducto`, `ordenidorden`),
  INDEX `fk_catálogo_has_orden_orden1_idx` (`ordenidorden` ASC),
  INDEX `fk_catálogo_has_orden_catálogo1_idx` (`catálogoidproducto` ASC),
  CONSTRAINT `fk_catálogo_has_orden_catálogo1`
    FOREIGN KEY (`catálogoidproducto`)
    REFERENCES `cafeteria`.`catalogos` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catálogo_has_orden_orden1`
    FOREIGN KEY (`ordenidorden`)
    REFERENCES `cafeteria`.`ordenes` (`idorden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;

USE `cafeteria` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
