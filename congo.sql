-- Schema Congo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Congo` ;

-- -----------------------------------------------------
-- Schema Congo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Congo` DEFAULT CHARACTER SET utf8 ;
USE `Congo` ;

-- -----------------------------------------------------
-- Table `Congo`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Congo`.`Role` ;

CREATE TABLE IF NOT EXISTS `Congo`.`Role` (
  `ID` INT(1) NOT NULL,
  `Type` VARCHAR(7) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Congo`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Congo`.`User` ;

CREATE TABLE IF NOT EXISTS `Congo`.`User` (
  `ID` INT(7) NOT NULL,
  `Username` VARCHAR(15) NULL,
  `Password` VARCHAR(15) NULL,
  `Role_Role_ID` INT(1) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_User_Role`
    FOREIGN KEY (`Role_Role_ID`)
    REFERENCES `Congo`.`Role` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Congo`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Congo`.`Book` ;

CREATE TABLE IF NOT EXISTS `Congo`.`Book` (
  `Book_ID` INT(7) NOT NULL,
  `Title` VARCHAR(45) NULL,
  `ISBN` BIGINT(13) NULL,
  `Price` DECIMAL(5,2) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Book_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Congo`.`Cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Congo`.`Cart` ;

CREATE TABLE IF NOT EXISTS `Congo`.`Cart` (
  `ID` INT NOT NULL,
  `User_ID` INT(7) NOT NULL,
  `Book_Book_ID` INT(7) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Cart_User1`
    FOREIGN KEY (`User_ID`)
    REFERENCES `Congo`.`User` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cart_Book1`
    FOREIGN KEY (`Book_Book_ID`)
    REFERENCES `Congo`.`Book` (`Book_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Congo`.`Check_Out`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Congo`.`Check_Out` ;

CREATE TABLE IF NOT EXISTS `Congo`.`Check_Out` (
  `ID` INT NOT NULL,
  `Cart_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Check_Out_Cart1`
    FOREIGN KEY (`Cart_ID`)
    REFERENCES `Congo`.`Cart` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
