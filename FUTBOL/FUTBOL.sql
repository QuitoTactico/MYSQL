-- MySQL Script generated by MySQL Workbench
-- Thu Nov 24 21:42:52 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FUTBOL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FUTBOL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FUTBOL` DEFAULT CHARACTER SET utf8 ;
USE `FUTBOL` ;

-- -----------------------------------------------------
-- Table `FUTBOL`.`Jugadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`Jugadores` (
  `id_jugador` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `posicion` VARCHAR(45) NOT NULL,
  `fecha_nto` DATE NOT NULL,
  PRIMARY KEY (`id_jugador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FUTBOL`.`Estadios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`Estadios` (
  `codigo` VARCHAR(2) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `capacidad` INT NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FUTBOL`.`Equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`Equipos` (
  `id_equipo` VARCHAR(2) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `anno_fundacion` INT NOT NULL,
  `id_estadio` VARCHAR(2) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_equipo`),
  INDEX `equipos_estadio_idx` (`id_estadio` ASC) VISIBLE,
  CONSTRAINT `equipos_estadio`
    FOREIGN KEY (`id_estadio`)
    REFERENCES `FUTBOL`.`Estadios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FUTBOL`.`Partidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`Partidos` (
  `id_partido` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `id_equipo_casa` VARCHAR(2) NOT NULL,
  `id_equipo_vist` VARCHAR(2) NOT NULL,
  `id_estadio` VARCHAR(2) NOT NULL,
  `goles_casa` INT NULL DEFAULT 0,
  `goles_vist` INT NULL DEFAULT 0,
  PRIMARY KEY (`id_partido`),
  INDEX `partidos_equipos_casa_idx` (`id_equipo_casa` ASC) VISIBLE,
  INDEX `partidos_equipos_vist_idx` (`id_equipo_vist` ASC) VISIBLE,
  INDEX `partidos_estadios_idx` (`id_estadio` ASC) VISIBLE,
  CONSTRAINT `partidos_equipos_casa`
    FOREIGN KEY (`id_equipo_casa`)
    REFERENCES `FUTBOL`.`Equipos` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `partidos_equipos_vist`
    FOREIGN KEY (`id_equipo_vist`)
    REFERENCES `FUTBOL`.`Equipos` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `partidos_estadios`
    FOREIGN KEY (`id_estadio`)
    REFERENCES `FUTBOL`.`Estadios` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FUTBOL`.`Goles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`Goles` (
  `minuto` INT NOT NULL,
  `id_partido` INT NOT NULL,
  `id_jugador` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL DEFAULT 'GOLAZO',
  PRIMARY KEY (`minuto`, `id_partido`),
  INDEX `goles_jugador_idx` (`id_jugador` ASC) VISIBLE,
  INDEX `goles_partidos_idx` (`id_partido` ASC) VISIBLE,
  CONSTRAINT `goles_jugador`
    FOREIGN KEY (`id_jugador`)
    REFERENCES `FUTBOL`.`Jugadores` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `goles_partidos`
    FOREIGN KEY (`id_partido`)
    REFERENCES `FUTBOL`.`Partidos` (`id_partido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FUTBOL`.`JugadoresXEquipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FUTBOL`.`JugadoresXEquipos` (
  `id_jugador` INT NOT NULL,
  `id_equipo` VARCHAR(2) NOT NULL,
  `fecha_inicial` DATE NOT NULL,
  `fecha_final` DATE NULL,
  PRIMARY KEY (`id_jugador`, `id_equipo`, `fecha_inicial`),
  INDEX `jugadoresxequipos_equipos_idx` (`id_equipo` ASC) VISIBLE,
  CONSTRAINT `jugadoresxequipos_jugadores`
    FOREIGN KEY (`id_jugador`)
    REFERENCES `FUTBOL`.`Jugadores` (`id_jugador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `jugadoresxequipos_equipos`
    FOREIGN KEY (`id_equipo`)
    REFERENCES `FUTBOL`.`Equipos` (`id_equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;