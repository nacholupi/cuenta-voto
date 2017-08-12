-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.37


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI_QUOTES,MYSQL323' */;


--
-- Create schema sistemavotacion
--

CREATE DATABASE IF NOT EXISTS sistemavotacion;
USE sistemavotacion;

--
-- Temporary table structure for view "v_consejales_listaint"
--
DROP TABLE IF EXISTS "v_consejales_listaint";
DROP VIEW IF EXISTS "v_consejales_listaint";
CREATE TABLE "v_consejales_listaint" (
  "lista" varchar(93),
  "cantidad" decimal(32,0)
);

--
-- Temporary table structure for view "v_consejales_localidad"
--
DROP TABLE IF EXISTS "v_consejales_localidad";
DROP VIEW IF EXISTS "v_consejales_localidad";
CREATE TABLE "v_consejales_localidad" (
  "localidad" varchar(45),
  "agrupacion" varchar(45),
  "cantidad" decimal(32,0)
);

--
-- Temporary table structure for view "v_consejales_localidad_reduc"
--
DROP TABLE IF EXISTS "v_consejales_localidad_reduc";
DROP VIEW IF EXISTS "v_consejales_localidad_reduc";
CREATE TABLE "v_consejales_localidad_reduc" (
  "localidad" varchar(45),
  "descr_agrup" varchar(45),
  "id_agrup" int(11),
  "cantidad" decimal(32,0)
);

--
-- Temporary table structure for view "v_consejales_partido"
--
DROP TABLE IF EXISTS "v_consejales_partido";
DROP VIEW IF EXISTS "v_consejales_partido";
CREATE TABLE "v_consejales_partido" (
  "agrupacion" varchar(45),
  "cantidad" decimal(40,4)
);

--
-- Temporary table structure for view "v_fpv_por_localidad"
--
DROP TABLE IF EXISTS "v_fpv_por_localidad";
DROP VIEW IF EXISTS "v_fpv_por_localidad";
CREATE TABLE "v_fpv_por_localidad" (
  "localidad" varchar(45),
  "cantidad" decimal(32,0)
);

--
-- Temporary table structure for view "v_porcentaje_escrutado"
--
DROP TABLE IF EXISTS "v_porcentaje_escrutado";
DROP VIEW IF EXISTS "v_porcentaje_escrutado";
CREATE TABLE "v_porcentaje_escrutado" (
  "Name_exp_1" decimal(27,4)
);

--
-- Temporary table structure for view "v_resultado_Con"
--
DROP TABLE IF EXISTS "v_resultado_Con";
DROP VIEW IF EXISTS "v_resultado_Con";
CREATE TABLE "v_resultado_Con" (
  "Agrupacion" varchar(45),
  "Consejal" decimal(32,0)
);

--
-- Temporary table structure for view "v_resultado_Dip"
--
DROP TABLE IF EXISTS "v_resultado_Dip";
DROP VIEW IF EXISTS "v_resultado_Dip";
CREATE TABLE "v_resultado_Dip" (
  "Agrupacion" varchar(45),
  "Diputados" decimal(32,0)
);

--
-- Temporary table structure for view "v_resultado_Leg"
--
DROP TABLE IF EXISTS "v_resultado_Leg";
DROP VIEW IF EXISTS "v_resultado_Leg";
CREATE TABLE "v_resultado_Leg" (
  "Agrupacion" varchar(45),
  "Legislador" decimal(32,0)
);

--
-- Temporary table structure for view "v_resultados"
--
DROP TABLE IF EXISTS "v_resultados";
DROP VIEW IF EXISTS "v_resultados";
CREATE TABLE "v_resultados" (
  "Agrupacion" varchar(45),
  "Diputados" decimal(32,0),
  "Legislador" decimal(32,0),
  "Consejal" decimal(32,0)
);

--
-- Temporary table structure for view "v_top5_listaint"
--
DROP TABLE IF EXISTS "v_top5_listaint";
DROP VIEW IF EXISTS "v_top5_listaint";
CREATE TABLE "v_top5_listaint" (
  "lista" varchar(93),
  "cantidad" decimal(32,0)
);

--
-- Temporary table structure for view "v_votos"
--
DROP TABLE IF EXISTS "v_votos";
DROP VIEW IF EXISTS "v_votos";
CREATE TABLE "v_votos" (
  "sum(`vo`.`cantConsejal`)" decimal(32,0)
);

--
-- Definition of table "circuito"
--

DROP TABLE IF EXISTS "circuito";
CREATE TABLE "circuito" (
  "idCircuito" varchar(10) NOT NULL,
  "idLocalidad" int(11) NOT NULL,
  "cantMesa" int(11) NOT NULL,
  "cantLectores" int(11) NOT NULL,
  PRIMARY KEY ("idCircuito"),
  KEY "FK_Localidad_idx" ("idLocalidad"),
  CONSTRAINT "FK_Localidad" FOREIGN KEY ("idLocalidad") REFERENCES "localidad" ("idLocalidad") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "circuito"
--

/*!40000 ALTER TABLE "circuito" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "circuito" ("idCircuito","idLocalidad","cantMesa","cantLectores") VALUES 
 ('887',5,39,13411),
 ('888',5,50,17347),
 ('889',2,72,25070),
 ('890',2,9,3063),
 ('891',4,140,48789),
 ('892',3,180,62954),
 ('892A',6,96,33378),
 ('893',2,99,34582),
 ('894',1,16,5341),
 ('895',4,55,18966);
COMMIT;
/*!40000 ALTER TABLE "circuito" ENABLE KEYS */;


--
-- Definition of table "eleccion"
--

DROP TABLE IF EXISTS "eleccion";
CREATE TABLE "eleccion" (
  "acronimo" varchar(10) NOT NULL,
  "descripcion" varchar(45) NOT NULL,
  PRIMARY KEY ("acronimo")
) TYPE=InnoDB;

--
-- Dumping data for table "eleccion"
--

/*!40000 ALTER TABLE "eleccion" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "eleccion" ("acronimo","descripcion") VALUES 
 ('2013FEl','Elecciones legislativas paso 2013'),
 ('2013PEL','Elecciones legislativas finales 2013'),
 ('2017FE','Elecciones legislativas paso 2017');
COMMIT;
/*!40000 ALTER TABLE "eleccion" ENABLE KEYS */;


--
-- Definition of table "localidad"
--

DROP TABLE IF EXISTS "localidad";
CREATE TABLE "localidad" (
  "idLocalidad" int(11) NOT NULL,
  "nombre" varchar(45) NOT NULL,
  "cantMesas" int(11) NOT NULL,
  "cantElectores" int(11) NOT NULL,
  PRIMARY KEY ("idLocalidad")
) TYPE=InnoDB;

--
-- Dumping data for table "localidad"
--

/*!40000 ALTER TABLE "localidad" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "localidad" ("idLocalidad","nombre","cantMesas","cantElectores") VALUES 
 (1,'Acassuso',16,5341),
 (2,'Béccar',180,62715),
 (3,'Boulogne',180,62954),
 (4,'Martínez',195,67755),
 (5,'San Isidro',89,30758),
 (6,'Villa Adelina',96,33378);
COMMIT;
/*!40000 ALTER TABLE "localidad" ENABLE KEYS */;


--
-- Definition of table "mesa"
--

DROP TABLE IF EXISTS "mesa";
CREATE TABLE "mesa" (
  "idMesa" int(11) NOT NULL,
  "descripcion" varchar(45) NOT NULL,
  "cantidadVotantes" int(11) NOT NULL,
  "idCircuito" varchar(10) NOT NULL,
  PRIMARY KEY ("idMesa"),
  KEY "FK_Circuito_idx" ("idCircuito"),
  CONSTRAINT "FK_Circuito" FOREIGN KEY ("idCircuito") REFERENCES "circuito" ("idCircuito") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

--
-- Dumping data for table "mesa"
--

/*!40000 ALTER TABLE "mesa" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "mesa" ("idMesa","descripcion","cantidadVotantes","idCircuito") VALUES 
 (1,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (2,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (3,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (4,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (5,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (6,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (7,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (8,'Colegio Ntra. Sra. de La Unidad',350,'887'),
 (9,'Escuela Es N°8',350,'887'),
 (10,'Escuela Es N°8',350,'887'),
 (11,'Escuela Es N°8',350,'887'),
 (12,'Escuela Es N°8',350,'887'),
 (13,'Escuela Es N°8',350,'887'),
 (14,'Escuela Es N°8',350,'887'),
 (15,'Escuela Es N°8',350,'887'),
 (16,'Escuela Es N°8',350,'887'),
 (17,'Escuela Es N°8',350,'887'),
 (18,'Escuela Es N°8',350,'887'),
 (19,'Escuela Es N°8',350,'887'),
 (20,'Escuela Es N°8',350,'887'),
 (21,'Escuela Es N°8',350,'887'),
 (22,'Escuela Es N°8',350,'887'),
 (23,'Colegio Sta. Maria Lujan',350,'887'),
 (24,'Colegio Sta. Maria Lujan',350,'887'),
 (25,'Colegio Sta. Maria Lujan',350,'887'),
 (26,'Colegio Sta. Maria Lujan',350,'887'),
 (27,'Colegio Sta. Maria Lujan',350,'887'),
 (28,'Colegio Sta. Maria Lujan',350,'887'),
 (29,'Colegio Sta. Maria Lujan',350,'887'),
 (30,'Escuela Ep N°1',350,'887'),
 (31,'Escuela Ep N°1',350,'887'),
 (32,'Escuela Ep N°1',350,'887'),
 (33,'Escuela Ep N°1',350,'887'),
 (34,'Escuela Ep N°1',350,'887'),
 (35,'Escuela Ep N°1',350,'887'),
 (36,'Escuela Ep N°1',350,'887'),
 (37,'Escuela Ep N°1',350,'887'),
 (38,'Escuela Ep N°1',350,'887'),
 (39,'Escuela Ep N°1',111,'887'),
 (40,'Escuela Ep N°2',350,'888'),
 (41,'Escuela Ep N°2',350,'888'),
 (42,'Escuela Ep N°2',350,'888'),
 (43,'Escuela Ep N°2',350,'888'),
 (44,'Escuela Ep N°2',350,'888'),
 (45,'Escuela Ep N°2',350,'888'),
 (46,'Escuela Ep N°2',350,'888'),
 (47,'Escuela Ep N°2',350,'888'),
 (48,'Escuela Ep N°2',350,'888'),
 (49,'Escuela Santa Isabel',350,'888'),
 (50,'Escuela Santa Isabel',350,'888'),
 (51,'Escuela Santa Isabel',350,'888'),
 (52,'Escuela Santa Isabel',350,'888'),
 (53,'Escuela Santa Isabel',350,'888'),
 (54,'Escuela Santa Isabel',350,'888'),
 (55,'Escuela Santa Isabel',350,'888'),
 (56,'Escuela Santa Isabel',350,'888'),
 (57,'Colegio Piaget',350,'888'),
 (58,'Colegio Piaget',350,'888'),
 (59,'Colegio Piaget',350,'888'),
 (60,'Colegio Piaget',350,'888'),
 (61,'Inst. Incorporado 20 de Junio',350,'888'),
 (62,'Inst. Incorporado 20 de Junio',350,'888'),
 (63,'Inst. Incorporado 20 de Junio',350,'888'),
 (64,'Inst. Incorporado 20 de Junio',350,'888'),
 (65,'Inst. Incorporado 20 de Junio',350,'888'),
 (66,'Inst. Incorporado 20 de Junio',350,'888'),
 (67,'Inst. Incorporado 20 de Junio',350,'888'),
 (68,'Inst. Incorporado 20 de Junio',350,'888'),
 (69,'Colegio Cardenal Spinola',350,'888'),
 (70,'Colegio Cardenal Spinola',350,'888'),
 (71,'Colegio Cardenal Spinola',350,'888'),
 (72,'Colegio Cardenal Spinola',350,'888'),
 (73,'Colegio Cardenal Spinola',350,'888'),
 (74,'Colegio San Carlos',350,'888'),
 (75,'Colegio San Carlos',350,'888'),
 (76,'Colegio San Carlos',350,'888'),
 (77,'Colegio San Carlos',350,'888'),
 (78,'Colegio San Carlos',350,'888'),
 (79,'Colegio Santa Trinidad',350,'888'),
 (80,'Colegio Santa Trinidad',350,'888'),
 (81,'Colegio Santa Trinidad',350,'888'),
 (82,'Colegio Santa Trinidad',350,'888'),
 (83,'Colegio Santa Trinidad',350,'888'),
 (84,'Colegio Santa Trinidad',350,'888'),
 (85,'Escuela Ep N°34',350,'888'),
 (86,'Escuela Ep N°34',350,'888'),
 (87,'Escuela Ep N°34',350,'888'),
 (88,'Escuela Ep N°34',350,'888'),
 (89,'Escuela Ep N°34',197,'888'),
 (90,'Escuela Ep N°5',350,'889'),
 (91,'Escuela Ep N°5',350,'889'),
 (92,'Escuela Ep N°5',350,'889'),
 (93,'Escuela Ep N°5',350,'889'),
 (94,'Escuela Ep N°5',350,'889'),
 (95,'Escuela Ep N°5',350,'889'),
 (96,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (97,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (98,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (99,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (100,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (101,'Colegio Ntra. Sra. de Lourdes',350,'889'),
 (102,'Colegio Marin',350,'889'),
 (103,'Colegio Marin',350,'889'),
 (104,'Colegio Marin',350,'889'),
 (105,'Colegio Marin',350,'889'),
 (106,'Colegio Marin',350,'889'),
 (107,'Colegio Nuevo San Isidro',350,'889'),
 (108,'Colegio Nuevo San Isidro',350,'889'),
 (109,'Colegio Nuevo San Isidro',350,'889'),
 (110,'Colegio Nuevo San Isidro',350,'889'),
 (111,'Colegio Nuevo San Isidro',350,'889'),
 (112,'Colegio Nuevo San Isidro',350,'889'),
 (113,'Colegio Nuevo San Isidro',350,'889'),
 (114,'Colegio Nuevo San Isidro',350,'889'),
 (115,'Colegio Nuevo San Isidro',350,'889'),
 (116,'Escuela Ep N°3',350,'889'),
 (117,'Escuela Ep N°3',350,'889'),
 (118,'Escuela Ep N°3',350,'889'),
 (119,'Escuela Ep N°3',350,'889'),
 (120,'Escuela Ep N°3',350,'889'),
 (121,'Escuela Ep N°3',350,'889'),
 (122,'Escuela Ep N°3',350,'889'),
 (123,'Escuela Ep N°3',350,'889'),
 (124,'Escuela Ep N°3',350,'889'),
 (125,'Escuela Ep N°3',350,'889'),
 (126,'Escuela Ep N°3',350,'889'),
 (127,'Escuela Ep N°3',350,'889'),
 (128,'Escuela Ep N°3',350,'889'),
 (129,'Escuela Ep N°23',350,'889'),
 (130,'Escuela Ep N°23',350,'889'),
 (131,'Escuela Ep N°23',350,'889'),
 (132,'Escuela Ep N°23',350,'889'),
 (133,'Escuela Ep N°23',350,'889'),
 (134,'Escuela Ep N°23',350,'889'),
 (135,'Escuela Ep N°23',350,'889'),
 (136,'Escuela Ep N°23',350,'889'),
 (137,'Escuela Ep N°23',350,'889'),
 (138,'Escuela Ep N°23',350,'889'),
 (139,'Escuela Ep N°23',350,'889'),
 (140,'Escuela Ep N°23',350,'889'),
 (141,'Escuela Escosesa San Andres',350,'889'),
 (142,'Escuela Escosesa San Andres',350,'889'),
 (143,'Escuela Escosesa San Andres',350,'889'),
 (144,'Escuela Escosesa San Andres',350,'889'),
 (145,'Escuela Escosesa San Andres',350,'889'),
 (146,'Escuela Escosesa San Andres',350,'889'),
 (147,'Escuela Escosesa San Andres',350,'889'),
 (148,'Escuela Escosesa San Andres',350,'889'),
 (149,'Escuela Escosesa San Andres',350,'889'),
 (150,'Escuela Escosesa San Andres',350,'889'),
 (151,'Bienestar Social Municipal',350,'889'),
 (152,'Bienestar Social Municipal',350,'889'),
 (153,'Bienestar Social Municipal',350,'889'),
 (154,'Bienestar Social Municipal',350,'889'),
 (155,'Escuela San Juan',350,'889'),
 (156,'Escuela San Juan',350,'889'),
 (157,'Escuela San Juan',350,'889'),
 (158,'Escuela San Juan',350,'889'),
 (159,'Centro de Alfabetizacion N°29',350,'889'),
 (160,'Centro de Alfabetizacion N°29',350,'889'),
 (161,'Centro de Alfabetizacion N°29',220,'889'),
 (162,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (163,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (164,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (165,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (166,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (167,'Club Sindic. O. I. V. Y Afines',350,'890'),
 (168,'Colegio de La Santa Cruz',350,'890'),
 (169,'Colegio de La Santa Cruz',350,'890'),
 (170,'Colegio de La Santa Cruz',263,'890'),
 (171,'Escuela Ep N°8',350,'891'),
 (172,'Escuela Ep N°8',350,'891'),
 (173,'Escuela Ep N°8',350,'891'),
 (174,'Escuela Ep N°8',350,'891'),
 (175,'Escuela Ep N°8',350,'891'),
 (176,'Escuela Ep N°8',350,'891'),
 (177,'Escuela Ep N°8',350,'891'),
 (178,'Escuela Ep N°8',350,'891'),
 (179,'Escuela Ep N°8',350,'891'),
 (180,'Escuela Ep N°8',350,'891'),
 (181,'Escuela Ep N°8',350,'891'),
 (182,'Escuela Ep N°8',350,'891'),
 (183,'Escuela Ep N°8',350,'891'),
 (184,'Escuela Ep N°8',350,'891'),
 (185,'Escuela Ep N°8',350,'891'),
 (186,'Escuela Ep N°8',350,'891'),
 (187,'Escuela Ep N°9',350,'891'),
 (188,'Escuela Ep N°9',350,'891'),
 (189,'Escuela Ep N°9',350,'891'),
 (190,'Escuela Ep N°9',350,'891'),
 (191,'Escuela Ep N°9',350,'891'),
 (192,'Escuela Ep N°9',350,'891'),
 (193,'Escuela Ep N°9',350,'891'),
 (194,'Escuela Ep N°9',350,'891'),
 (195,'Escuela Ep N°9',350,'891'),
 (196,'Escuela Ep N°9',350,'891'),
 (197,'Escuela Ep N°9',350,'891'),
 (198,'Escuela Ep N°9',350,'891'),
 (199,'Escuela Ep N°14',350,'891'),
 (200,'Escuela Ep N°14',350,'891'),
 (201,'Escuela Ep N°14',350,'891'),
 (202,'Escuela Ep N°14',350,'891'),
 (203,'Escuela Ep N°14',350,'891'),
 (204,'Escuela Ep N°14',350,'891'),
 (205,'Escuela Ep N°14',350,'891'),
 (206,'Escuela Es N°5',350,'891'),
 (207,'Escuela Es N°5',350,'891'),
 (208,'Escuela Es N°5',350,'891'),
 (209,'Escuela Es N°5',350,'891'),
 (210,'Escuela Es N°5',350,'891'),
 (211,'Escuela Es N°5',350,'891'),
 (212,'Escuela Es N°5',350,'891'),
 (213,'Escuela Es N°5',350,'891'),
 (214,'Escuela Es N°5',350,'891'),
 (215,'Col. Crist. de Martinez (Sec',350,'891'),
 (216,'Col. Crist. de Martinez (Sec',350,'891'),
 (217,'Col. Crist. de Martinez (Sec',350,'891'),
 (218,'Col. Crist. de Martinez (Sec',350,'891'),
 (219,'Col. Crist. de Martinez (Sec',350,'891'),
 (220,'Col. Crist. de Martinez (Sec',350,'891'),
 (221,'Col. Crist. de Martinez (Sec',350,'891'),
 (222,'Col. Crist. de Martinez (Sec',350,'891'),
 (223,'Col. Crist. de Martinez (Sec',350,'891'),
 (224,'Instituto Mallinckrodt',350,'891'),
 (225,'Instituto Mallinckrodt',350,'891'),
 (226,'Instituto Mallinckrodt',350,'891'),
 (227,'Instituto Mallinckrodt',350,'891'),
 (228,'Instituto Mallinckrodt',350,'891'),
 (229,'Instituto Mallinckrodt',350,'891'),
 (230,'Instituto Mallinckrodt',350,'891'),
 (231,'Instituto Mallinckrodt',350,'891'),
 (232,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (233,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (234,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (235,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (236,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (237,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (238,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (239,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (240,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),
 (241,'Universidad de Buenos Aires',350,'891'),
 (242,'Universidad de Buenos Aires',350,'891'),
 (243,'Universidad de Buenos Aires',350,'891'),
 (244,'Universidad de Buenos Aires',350,'891'),
 (245,'Universidad de Buenos Aires',350,'891'),
 (246,'Universidad de Buenos Aires',350,'891'),
 (247,'Universidad de Buenos Aires',350,'891'),
 (248,'Universidad de Buenos Aires',350,'891'),
 (249,'Universidad de Buenos Aires',350,'891'),
 (250,'Universidad de Buenos Aires',350,'891'),
 (251,'Universidad de Buenos Aires',350,'891'),
 (252,'Universidad de Buenos Aires',350,'891'),
 (253,'Universidad de Buenos Aires',350,'891'),
 (254,'Universidad de Buenos Aires',350,'891'),
 (255,'Universidad de Buenos Aires',350,'891'),
 (256,'Universidad de Buenos Aires',350,'891'),
 (257,'Escuela Ep N°22',350,'891'),
 (258,'Escuela Ep N°22',350,'891'),
 (259,'Escuela Ep N°22',350,'891'),
 (260,'Escuela Ep N°22',350,'891'),
 (261,'Escuela Ep N°22',350,'891'),
 (262,'Escuela Ep N°22',350,'891'),
 (263,'Escuela Ep N°22',350,'891'),
 (264,'Escuela Ep N°22',350,'891'),
 (265,'Escuela Ep N°22',350,'891'),
 (266,'Escuela Ep N°22',350,'891'),
 (267,'Escuela Ep N°22',350,'891'),
 (268,'Escuela Ep N°22',350,'891'),
 (269,'Colegio Naciones Unidas',350,'891'),
 (270,'Colegio Naciones Unidas',350,'891'),
 (271,'Colegio Naciones Unidas',350,'891'),
 (272,'Colegio Naciones Unidas',350,'891'),
 (273,'Colegio Naciones Unidas',350,'891'),
 (274,'Colegio Naciones Unidas',350,'891'),
 (275,'Instituto Dardo Rocha',350,'891'),
 (276,'Instituto Dardo Rocha',350,'891'),
 (277,'Instituto Dardo Rocha',350,'891'),
 (278,'Instituto Dardo Rocha',350,'891'),
 (279,'Instituto Dardo Rocha',350,'891'),
 (280,'Instituto Dardo Rocha',350,'891'),
 (281,'Instituto Dardo Rocha',350,'891'),
 (282,'Instituto Dardo Rocha',350,'891'),
 (283,'Instituto Dardo Rocha',350,'891'),
 (284,'Escuela Es N°9',350,'891'),
 (285,'Escuela Es N°9',350,'891'),
 (286,'Escuela Es N°9',350,'891'),
 (287,'Escuela Es N°9',350,'891'),
 (288,'Escuela Es N°9',350,'891'),
 (289,'Escuela Es N°9',350,'891'),
 (290,'Escuela Es N°9',350,'891'),
 (291,'Escuela Es N°9',350,'891'),
 (292,'Escuela Es N°9',350,'891'),
 (293,'Inst. San Jose de Martinez',350,'891'),
 (294,'Inst. San Jose de Martinez',350,'891'),
 (295,'Inst. San Jose de Martinez',350,'891'),
 (296,'Inst. San Jose de Martinez',350,'891'),
 (297,'Inst. San Jose de Martinez',350,'891'),
 (298,'Inst. San Jose de Martinez',350,'891'),
 (299,'Inst. San Jose de Martinez',350,'891'),
 (300,'Inst. San Jose de Martinez',350,'891'),
 (301,'Escuela Republica Argentina',350,'891'),
 (302,'Escuela Republica Argentina',350,'891'),
 (303,'Escuela Republica Argentina',350,'891'),
 (304,'Escuela Republica Argentina',350,'891'),
 (305,'Inst. Munic. de Formac. Superior',350,'891'),
 (306,'Inst. Munic. de Formac. Superior',350,'891'),
 (307,'Inst. Munic. de Formac. Superior',350,'891'),
 (308,'Centro Polival. de Arte de S. Isidro',350,'891'),
 (309,'Centro Polival. de Arte de S. Isidro',350,'891'),
 (310,'Centro Polival. de Arte de S. Isidro',139,'891'),
 (311,'Escuela Ep N°18',350,'892'),
 (312,'Escuela Ep N°18',350,'892'),
 (313,'Escuela Ep N°18',350,'892'),
 (314,'Escuela Ep N°18',350,'892'),
 (315,'Escuela Ep N°18',350,'892'),
 (316,'Escuela Ep N°18',350,'892'),
 (317,'Escuela Ep N°18',350,'892'),
 (318,'Escuela Ep N°18',350,'892'),
 (319,'Escuela Ep N°18',350,'892'),
 (320,'Escuela Ep N°18',350,'892'),
 (321,'Escuela Ep N°18',350,'892'),
 (322,'Escuela Ep N°18',350,'892'),
 (323,'Escuela Ep N°17',350,'892'),
 (324,'Escuela Ep N°17',350,'892'),
 (325,'Escuela Ep N°17',350,'892'),
 (326,'Escuela Ep N°17',350,'892'),
 (327,'Escuela Ep N°17',350,'892'),
 (328,'Escuela Ep N°17',350,'892'),
 (329,'Escuela Ep N°17',350,'892'),
 (330,'Escuela Ep N°17',350,'892'),
 (331,'Escuela Ep N°17',350,'892'),
 (332,'Escuela Ep N°17',350,'892'),
 (333,'Instituto 25 de Mayo',350,'892'),
 (334,'Instituto 25 de Mayo',350,'892'),
 (335,'Instituto 25 de Mayo',350,'892'),
 (336,'Instituto 25 de Mayo',350,'892'),
 (337,'Instituto 25 de Mayo',350,'892'),
 (338,'Instituto 25 de Mayo',350,'892'),
 (339,'Instituto 25 de Mayo',350,'892'),
 (340,'Instituto 25 de Mayo',350,'892'),
 (341,'Instituto 25 de Mayo',350,'892'),
 (342,'Instituto 25 de Mayo',350,'892'),
 (343,'Instituto 25 de Mayo',350,'892'),
 (344,'Instituto 25 de Mayo',350,'892'),
 (345,'Instituto 25 de Mayo',350,'892'),
 (346,'Instituto 25 de Mayo',350,'892'),
 (347,'Escuela Gral. Martin Guemes',350,'892'),
 (348,'Escuela Gral. Martin Guemes',350,'892'),
 (349,'Escuela Gral. Martin Guemes',350,'892'),
 (350,'Escuela Gral. Martin Guemes',350,'892'),
 (351,'Escuela Gral. Martin Guemes',350,'892'),
 (352,'Escuela Ep N°13/Es N°8',350,'892'),
 (353,'Escuela Ep N°13/Es N°8',350,'892'),
 (354,'Escuela Ep N°13/Es N°8',350,'892'),
 (355,'Escuela Ep N°13/Es N°8',350,'892'),
 (356,'Escuela Ep N°13/Es N°8',350,'892'),
 (357,'Escuela Ep N°13/Es N°8',350,'892'),
 (358,'Escuela Ep N°13/Es N°8',350,'892'),
 (359,'Escuela Ep N°13/Es N°8',350,'892'),
 (360,'Escuela Ep N°13/Es N°8',350,'892'),
 (361,'Escuela Ep N°13/Es N°8',350,'892'),
 (362,'Escuela Ep N°16',350,'892'),
 (363,'Escuela Ep N°16',350,'892'),
 (364,'Escuela Ep N°16',350,'892'),
 (365,'Escuela Ep N°16',350,'892'),
 (366,'Escuela Ep N°16',350,'892'),
 (367,'Escuela Ep N°16',350,'892'),
 (368,'Escuela Ep N°16',350,'892'),
 (369,'Escuela Ep N°16',350,'892'),
 (370,'Escuela Ep N°16',350,'892'),
 (371,'Escuela Ep N°16',350,'892'),
 (372,'Escuela Ep N°7',350,'892'),
 (373,'Escuela Ep N°7',350,'892'),
 (374,'Escuela Ep N°7',350,'892'),
 (375,'Escuela Ep N°7',350,'892'),
 (376,'Escuela Ep N°7',350,'892'),
 (377,'Escuela Ep N°7',350,'892'),
 (378,'Escuela Ep N°7',350,'892'),
 (379,'Escuela Ep N°7',350,'892'),
 (380,'Escuela Ep N°7',350,'892'),
 (381,'Escuela Es N°4',350,'892'),
 (382,'Escuela Es N°4',350,'892'),
 (383,'Escuela Es N°4',350,'892'),
 (384,'Escuela Es N°4',350,'892'),
 (385,'Escuela Es N°4',350,'892'),
 (386,'Escuela Es N°4',350,'892'),
 (387,'Escuela Es N°4',350,'892'),
 (388,'Colegio Gral. J. de San Martin',350,'892'),
 (389,'Colegio Gral. J. de San Martin',350,'892'),
 (390,'Colegio Gral. J. de San Martin',350,'892'),
 (391,'Colegio Gral. J. de San Martin',350,'892'),
 (392,'Colegio Gral. J. de San Martin',350,'892'),
 (393,'Escuela Es N°14',350,'892'),
 (394,'Escuela Es N°14',350,'892'),
 (395,'Escuela Es N°14',350,'892'),
 (396,'Escuela Es N°14',350,'892'),
 (397,'Escuela Es N°14',350,'892'),
 (398,'Escuela Es N°14',350,'892'),
 (399,'Escuela Es N°14',350,'892'),
 (400,'Escuela Es N°14',350,'892'),
 (401,'Escuela Es N°14',350,'892'),
 (402,'Escuela Es N°14',350,'892'),
 (403,'Escuela Es N°14',350,'892'),
 (404,'Escuela Es N°14',350,'892'),
 (405,'Escuela Ep N°24',350,'892'),
 (406,'Escuela Ep N°24',350,'892'),
 (407,'Escuela Ep N°24',350,'892'),
 (408,'Escuela Ep N°24',350,'892'),
 (409,'Escuela Ep N°24',350,'892'),
 (410,'Escuela Ep N°24',350,'892'),
 (411,'Escuela Ep N°24',350,'892'),
 (412,'Escuela Ep N°24',350,'892'),
 (413,'Escuela Ep N°24',350,'892'),
 (414,'Escuela Ep N°24',350,'892'),
 (415,'Escuela Ep N°24',350,'892'),
 (416,'Escuela Ep N°28',350,'892'),
 (417,'Escuela Ep N°28',350,'892'),
 (418,'Escuela Ep N°28',350,'892'),
 (419,'Escuela Ep N°28',350,'892'),
 (420,'Escuela Ep N°28',350,'892'),
 (421,'Escuela Ep N°28',350,'892'),
 (422,'Escuela Et N°4',350,'892'),
 (423,'Escuela Et N°4',350,'892'),
 (424,'Escuela Et N°4',350,'892'),
 (425,'Escuela Et N°4',350,'892'),
 (426,'Escuela Et N°4',350,'892'),
 (427,'Escuela Et N°4',350,'892'),
 (428,'Escuela Et N°4',350,'892'),
 (429,'Inst. Ceferino Namuncura',350,'892'),
 (430,'Inst. Ceferino Namuncura',350,'892'),
 (431,'Inst. Ceferino Namuncura',350,'892'),
 (432,'Inst. Ceferino Namuncura',350,'892'),
 (433,'Inst. Ceferino Namuncura',350,'892'),
 (434,'Colegio Leonardo Da Vinci',350,'892'),
 (435,'Colegio Leonardo Da Vinci',350,'892'),
 (436,'Colegio Leonardo Da Vinci',350,'892'),
 (437,'Colegio Leonardo Da Vinci',350,'892'),
 (438,'Colegio Leonardo Da Vinci',350,'892'),
 (439,'Inst. Secund. Cardenal Newman',350,'892'),
 (440,'Inst. Secund. Cardenal Newman',350,'892'),
 (441,'Inst. Secund. Cardenal Newman',350,'892'),
 (442,'Inst. Secund. Cardenal Newman',350,'892'),
 (443,'Inst. Secund. Cardenal Newman',350,'892'),
 (444,'Inst. Secund. Cardenal Newman',350,'892'),
 (445,'Escuela Ep N°27',350,'892'),
 (446,'Escuela Ep N°27',350,'892'),
 (447,'Escuela Ep N°27',350,'892'),
 (448,'Escuela Ep N°27',350,'892'),
 (449,'Escuela Ep N°27',350,'892'),
 (450,'Escuela Ep N°27',350,'892'),
 (451,'Escuela Ep N°27',350,'892'),
 (452,'Escuela Parroquial Juan Xxiii',350,'892'),
 (453,'Escuela Parroquial Juan Xxiii',350,'892'),
 (454,'Escuela Parroquial Juan Xxiii',350,'892'),
 (455,'Escuela Parroquial Juan Xxiii',350,'892'),
 (456,'Escuela Parroquial Juan Xxiii',350,'892'),
 (457,'Escuela Parroquial Juan Xxiii',350,'892'),
 (458,'Escuela Parroquial Juan Xxiii',350,'892'),
 (459,'Escuela Ep N°15',350,'892'),
 (460,'Escuela Ep N°15',350,'892'),
 (461,'Escuela Ep N°15',350,'892'),
 (462,'Escuela Ep N°15',350,'892'),
 (463,'Escuela Ep N°15',350,'892'),
 (464,'Escuela Ep N°15',350,'892'),
 (465,'Escuela Ep N°15',350,'892'),
 (466,'Escuela Ep N°15',350,'892'),
 (467,'Escuela Ep N°15',350,'892'),
 (468,'Escuela Et N°2',350,'892'),
 (469,'Escuela Et N°2',350,'892'),
 (470,'Escuela Et N°2',350,'892'),
 (471,'Escuela Et N°2',350,'892'),
 (472,'Escuela Et N°2',350,'892'),
 (473,'Escuela Et N°2',350,'892'),
 (474,'Escuela Es N°1',350,'892'),
 (475,'Escuela Es N°1',350,'892'),
 (476,'Escuela Es N°1',350,'892'),
 (477,'Escuela Es N°1',350,'892'),
 (478,'Escuela Es N°1',350,'892'),
 (479,'Escuela Ep N°33',350,'892'),
 (480,'Escuela Ep N°33',350,'892'),
 (481,'Escuela Ep N°33',350,'892'),
 (482,'Escuela Ep N°33',350,'892'),
 (483,'Escuela Ep N°33',350,'892'),
 (484,'Escuela Ep N°33',350,'892'),
 (485,'Instituto Goethe (Media',350,'892'),
 (486,'Instituto Goethe (Media',350,'892'),
 (487,'Instituto Goethe (Media',350,'892'),
 (488,'Instituto Goethe (Media',350,'892'),
 (489,'Instituto Goethe (Media',350,'892'),
 (490,'Instituto Goethe (Media',304,'892'),
 (491,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (492,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (493,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (494,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (495,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (496,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (497,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (498,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (499,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (500,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (501,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (502,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),
 (503,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (504,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (505,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (506,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (507,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (508,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (509,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (510,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),
 (511,'Colegio San Andres Avelino',350,'892A'),
 (512,'Colegio San Andres Avelino',350,'892A'),
 (513,'Colegio San Andres Avelino',350,'892A'),
 (514,'Colegio San Andres Avelino',350,'892A'),
 (515,'Colegio San Cayetano',350,'892A'),
 (516,'Colegio San Cayetano',350,'892A'),
 (517,'Colegio San Cayetano',350,'892A'),
 (518,'Colegio San Cayetano',350,'892A'),
 (519,'Colegio San Cayetano',350,'892A'),
 (520,'Colegio San Cayetano',350,'892A'),
 (521,'Colegio San Cayetano',350,'892A'),
 (522,'Escuela Es N°7',350,'892A'),
 (523,'Escuela Es N°7',350,'892A'),
 (524,'Escuela Es N°7',350,'892A'),
 (525,'Escuela Es N°7',350,'892A'),
 (526,'Escuela Es N°7',350,'892A'),
 (527,'Escuela Es N°7',350,'892A'),
 (528,'Escuela Es N°7',350,'892A'),
 (529,'Escuela Es N°7',350,'892A'),
 (530,'Escuela Es N°7',350,'892A'),
 (531,'Instituto San Juan Bosco',350,'892A'),
 (532,'Instituto San Juan Bosco',350,'892A'),
 (533,'Instituto San Juan Bosco',350,'892A'),
 (534,'Instituto San Juan Bosco',350,'892A'),
 (535,'Escuela Ep N°12/Es N°2',350,'892A'),
 (536,'Escuela Ep N°12/Es N°2',350,'892A'),
 (537,'Escuela Ep N°12/Es N°2',350,'892A'),
 (538,'Escuela Ep N°12/Es N°2',350,'892A'),
 (539,'Escuela Ep N°12/Es N°2',350,'892A'),
 (540,'Escuela Ep N°12/Es N°2',350,'892A'),
 (541,'Escuela Ep N°12/Es N°2',350,'892A'),
 (542,'Escuela Ep N°12/Es N°2',350,'892A'),
 (543,'Escuela Ep N°12/Es N°2',350,'892A'),
 (544,'Escuela Ep N°12/Es N°2',350,'892A'),
 (545,'Escuela Ep N°12/Es N°2',350,'892A'),
 (546,'Escuela Ep N°12/Es N°2',350,'892A'),
 (547,'Escuela Ep N°12/Es N°2',350,'892A'),
 (548,'Escuela Ep N°12/Es N°2',350,'892A'),
 (549,'Escuela Ep N°12/Es N°2',350,'892A'),
 (550,'Escuela Ep N°12/Es N°2',350,'892A'),
 (551,'Escuela Ep N°12/Es N°2',350,'892A'),
 (552,'Escuela Ep N°12/Es N°2',350,'892A'),
 (553,'Escuela Ep N°12/Es N°2',350,'892A'),
 (554,'Escuela Ep N°12/Es N°2',350,'892A'),
 (555,'Escuela Ep N°21',350,'892A'),
 (556,'Escuela Ep N°21',350,'892A'),
 (557,'Escuela Ep N°21',350,'892A'),
 (558,'Escuela Ep N°21',350,'892A'),
 (559,'Escuela Ep N°21',350,'892A'),
 (560,'Escuela Ep N°21',350,'892A'),
 (561,'Escuela Ep N°21',350,'892A'),
 (562,'Escuela Ep N°21',350,'892A'),
 (563,'Escuela Ep N°20',350,'892A'),
 (564,'Escuela Ep N°20',350,'892A'),
 (565,'Escuela Ep N°20',350,'892A'),
 (566,'Escuela Ep N°20',350,'892A'),
 (567,'Escuela Ep N°20',350,'892A'),
 (568,'Escuela Ep N°20',350,'892A'),
 (569,'Escuela Ep N°20',350,'892A'),
 (570,'Escuela Ep N°20',350,'892A'),
 (571,'Escuela Ep N°30/Es N°15',350,'892A'),
 (572,'Escuela Ep N°30/Es N°15',350,'892A'),
 (573,'Escuela Ep N°30/Es N°15',350,'892A'),
 (574,'Escuela Ep N°30/Es N°15',350,'892A'),
 (575,'Escuela Ep N°30/Es N°15',350,'892A'),
 (576,'Escuela Ep N°30/Es N°15',350,'892A'),
 (577,'Escuela Ep N°30/Es N°15',350,'892A'),
 (578,'Escuela Ep N°30/Es N°15',350,'892A'),
 (579,'Escuela Ep N°30/Es N°15',350,'892A'),
 (580,'Escuela Ep N°30/Es N°15',350,'892A'),
 (581,'Escuela Ep N°29',350,'892A'),
 (582,'Escuela Ep N°29',350,'892A'),
 (583,'Escuela Es N°11',350,'892A'),
 (584,'Escuela Es N°11',350,'892A'),
 (585,'Escuela Es N°11',350,'892A'),
 (586,'Escuela Es N°11',128,'892A'),
 (587,'Escuela Ep N°6',350,'893'),
 (588,'Escuela Ep N°6',350,'893'),
 (589,'Escuela Ep N°6',350,'893'),
 (590,'Escuela Ep N°6',350,'893'),
 (591,'Escuela Ep N°6',350,'893'),
 (592,'Escuela Ep N°6',350,'893'),
 (593,'Escuela Ep N°6',350,'893'),
 (594,'Escuela Ep N°6',350,'893'),
 (595,'Escuela Ep N°6',350,'893'),
 (596,'Escuela Ep N°6',350,'893'),
 (597,'Colegio San Marcos',350,'893'),
 (598,'Colegio San Marcos',350,'893'),
 (599,'Colegio San Marcos',350,'893'),
 (600,'Colegio San Marcos',350,'893'),
 (601,'Colegio San Marcos',350,'893'),
 (602,'Colegio San Marcos',350,'893'),
 (603,'Colegio San Marcos',350,'893'),
 (604,'Colegio San Marcos',350,'893'),
 (605,'Colegio San Marcos',350,'893'),
 (606,'Colegio San Marcos',350,'893'),
 (607,'Instituto Juan S. Fernandez',350,'893'),
 (608,'Instituto Juan S. Fernandez',350,'893'),
 (609,'Instituto Juan S. Fernandez',350,'893'),
 (610,'Instituto Juan S. Fernandez',350,'893'),
 (611,'Instituto Juan S. Fernandez',350,'893'),
 (612,'Instituto Juan S. Fernandez',350,'893'),
 (613,'Instituto Juan S. Fernandez',350,'893'),
 (614,'Instituto Juan S. Fernandez',350,'893'),
 (615,'Instituto Juan S. Fernandez',350,'893'),
 (616,'Instituto Juan S. Fernandez',350,'893'),
 (617,'Instituto Juan S. Fernandez',350,'893'),
 (618,'Instituto Juan S. Fernandez',350,'893'),
 (619,'Escuela Ep N°19',350,'893'),
 (620,'Escuela Ep N°19',350,'893'),
 (621,'Escuela Ep N°19',350,'893'),
 (622,'Escuela Ep N°19',350,'893'),
 (623,'Escuela Ep N°19',350,'893'),
 (624,'Escuela Ep N°19',350,'893'),
 (625,'Escuela Ep N°19',350,'893'),
 (626,'Escuela Ep N°19',350,'893'),
 (627,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (628,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (629,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (630,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (631,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (632,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (633,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (634,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (635,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (636,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (637,'Esc. Munic. Malvinas Argentinas',350,'893'),
 (638,'Escuela Ep N°25',350,'893'),
 (639,'Escuela Ep N°25',350,'893'),
 (640,'Escuela Ep N°25',350,'893'),
 (641,'Escuela Ep N°25',350,'893'),
 (642,'Escuela Ep N°25',350,'893'),
 (643,'Escuela Ep N°25',350,'893'),
 (644,'Escuela Ep N°25',350,'893'),
 (645,'Instituto Sto. Domingo Savio',350,'893'),
 (646,'Instituto Sto. Domingo Savio',350,'893'),
 (647,'Instituto Sto. Domingo Savio',350,'893'),
 (648,'Instituto Sto. Domingo Savio',350,'893'),
 (649,'Instituto Sto. Domingo Savio',350,'893'),
 (650,'Instituto Sto. Domingo Savio',350,'893'),
 (651,'Instituto Sto. Domingo Savio',350,'893'),
 (652,'Instituto Sto. Domingo Savio',350,'893'),
 (653,'Instituto Sto. Domingo Savio',350,'893'),
 (654,'Instituto Sto. Domingo Savio',350,'893'),
 (655,'Escuela Ep N°31',350,'893'),
 (656,'Escuela Ep N°31',350,'893'),
 (657,'Escuela Ep N°31',350,'893'),
 (658,'Escuela Ep N°31',350,'893'),
 (659,'Escuela Ep N°31',350,'893'),
 (660,'Escuela Ep N°31',350,'893'),
 (661,'Escuela Ep N°31',350,'893'),
 (662,'Escuela Ep N°31',350,'893'),
 (663,'Escuela Ep N°31',350,'893'),
 (664,'Colegio de Los Peregrinos',350,'893'),
 (665,'Colegio de Los Peregrinos',350,'893'),
 (666,'Colegio de Los Peregrinos',350,'893'),
 (667,'Colegio de Los Peregrinos',350,'893'),
 (668,'Colegio de Los Peregrinos',350,'893'),
 (669,'Colegio de Los Peregrinos',350,'893'),
 (670,'Inst. Privado El Buen Ayre',350,'893'),
 (671,'Inst. Privado El Buen Ayre',350,'893'),
 (672,'Inst. Privado El Buen Ayre',350,'893'),
 (673,'Inst. Privado El Buen Ayre',350,'893'),
 (674,'Colegio Cruz Del Sur',350,'893'),
 (675,'Colegio Cruz Del Sur',350,'893'),
 (676,'Colegio Cruz Del Sur',350,'893'),
 (677,'Centro Educ. Complementario N°1',350,'893'),
 (678,'Centro Educ. Complementario N°1',350,'893'),
 (679,'Centro Educ. Complementario N°1',350,'893'),
 (680,'Centro Educ. Complementario N°1',350,'893'),
 (681,'Centro Educ. Complementario N°1',350,'893'),
 (682,'Jardin de Inf. El Trebol',350,'893'),
 (683,'Jardin de Inf. El Trebol',350,'893'),
 (684,'Jardin de Inf. El Trebol',350,'893'),
 (685,'Jardin de Inf. El Trebol',282,'893'),
 (686,'Club Atletico San Isidro',350,'894'),
 (687,'Club Atletico San Isidro',350,'894'),
 (688,'Club Atletico San Isidro',350,'894'),
 (689,'Instituto Nightingale',350,'894'),
 (690,'Instituto Nightingale',350,'894'),
 (691,'Instituto Nightingale',350,'894'),
 (692,'Instituto Nightingale',350,'894'),
 (693,'Instituto Nightingale',350,'894'),
 (694,'Instituto Nightingale',350,'894'),
 (695,'Esc. Franco-Argentina Martinez',350,'894'),
 (696,'Esc. Franco-Argentina Martinez',350,'894'),
 (697,'Esc. Franco-Argentina Martinez',350,'894'),
 (698,'Esc. Franco-Argentina Martinez',350,'894'),
 (699,'Esc. Franco-Argentina Martinez',350,'894'),
 (700,'Esc. Franco-Argentina Martinez',350,'894'),
 (701,'Esc. Franco-Argentina Martinez',91,'894'),
 (702,'Colegio Ott',350,'895'),
 (703,'Colegio Ott',350,'895'),
 (704,'Colegio Ott',350,'895'),
 (705,'Colegio Ott',350,'895'),
 (706,'Instituto Educativo Fatima',350,'895'),
 (707,'Instituto Educativo Fatima',350,'895'),
 (708,'Instituto Educativo Fatima',350,'895'),
 (709,'Instituto Educativo Fatima',350,'895'),
 (710,'Instituto Educativo Fatima',350,'895'),
 (711,'Instituto Educativo Fatima',350,'895'),
 (712,'Instituto Educativo Fatima',350,'895'),
 (713,'Instituto Educativo Fatima',350,'895'),
 (714,'Instituto Educativo Fatima',350,'895'),
 (715,'Instituto Educativo Fatima',350,'895'),
 (716,'Instituto Educativo Fatima',350,'895'),
 (717,'Instituto Educativo Fatima',350,'895'),
 (718,'Instituto Educativo Fatima',350,'895'),
 (719,'Instituto Educativo Fatima',350,'895'),
 (720,'Escuela Ep N°10',350,'895'),
 (721,'Escuela Ep N°10',350,'895'),
 (722,'Escuela Ep N°10',350,'895'),
 (723,'Escuela Ep N°10',350,'895'),
 (724,'Escuela Ep N°10',350,'895'),
 (725,'Escuela Ep N°10',350,'895'),
 (726,'Escuela Ep N°10',350,'895'),
 (727,'Escuela Ep N°10',350,'895'),
 (728,'Escuela Ep N°10',350,'895'),
 (729,'Escuela Ep N°10',350,'895'),
 (730,'Escuela San Juan',350,'895'),
 (731,'Escuela San Juan',350,'895'),
 (732,'Escuela San Juan',350,'895'),
 (733,'Escuela San Juan',350,'895'),
 (734,'Escuela San Juan',350,'895'),
 (735,'Colegio de La Ribera',350,'895'),
 (736,'Colegio de La Ribera',350,'895'),
 (737,'Colegio de La Ribera',350,'895'),
 (738,'Colegio de La Ribera',350,'895'),
 (739,'Colegio de La Ribera',350,'895'),
 (740,'Colegio de La Ribera',350,'895'),
 (741,'Colegio de La Ribera',350,'895'),
 (742,'Escuela Ep N°4',350,'895'),
 (743,'Escuela Ep N°4',350,'895'),
 (744,'Escuela Ep N°4',350,'895'),
 (745,'Escuela Ep N°4',350,'895'),
 (746,'Escuela Ep N°4',350,'895'),
 (747,'Escuela Ep N°4',350,'895'),
 (748,'Escuela Ep N°4',350,'895'),
 (749,'Escuela Ep N°4',350,'895'),
 (750,'Escuela Ep N°4',350,'895'),
 (751,'Escuela Ep N°4',350,'895'),
 (752,'Jardin Municipal N°902',350,'895'),
 (753,'Jardin Municipal N°902',350,'895'),
 (754,'Jardin Municipal N°902',350,'895'),
 (755,'Jardin Municipal N°902',350,'895'),
 (756,'Jardin Municipal N°902',66,'895'),
 (9001,'Club Atlético Beccar',999,'889'),
 (9002,'Club Atlético Beccar',999,'889'),
 (9003,'Club Atlético Beccar',999,'889'),
 (9004,'Instituto Sagrada Familia (Media)',999,'891'),
 (9005,'Instituto Sagrada Familia (Media)',999,'891'),
 (9006,'Instituto Sagrada Familia (Media)',999,'891'),
 (9007,'Instituto Sagrada Familia (Media)',999,'891'),
 (9008,'Instituto Sagrada Familia (Media)',999,'891'),
 (9009,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9010,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9011,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9012,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9013,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9014,'Colegio Sagrado Corazón de Jesús',999,'892'),
 (9015,'Instituto Sagrada Familia (Media)',999,'891'),
 (9016,'Escuela Esp. Nº 501',999,'891'),
 (9017,'Escuela Esp. Nº 501',999,'891'),
 (9018,'Escuela Esp. Nº 501',999,'891'),
 (9019,'Escuela Esp. Nº 501',999,'891'),
 (9020,'Escuela Esp. Nº 501',999,'891'),
 (9021,'Escuela Esp. Nº 501',999,'891'),
 (9022,'Escuela Esp. Nº 501',999,'891'),
 (9023,'Escuela Esp. Nº 501',999,'891'),
 (9024,'Escuela Esp. Nº 501',999,'891'),
 (9025,'Escuela Esp. Nº 501',999,'891'),
 (9027,'Escuela Franco-Argentina',999,'895');
COMMIT;
/*!40000 ALTER TABLE "mesa" ENABLE KEYS */;


--
-- Definition of table "opcionvoto"
--

DROP TABLE IF EXISTS "opcionvoto";
CREATE TABLE "opcionvoto" (
  "idOpcionVoto" int(11) NOT NULL AUTO_INCREMENT,
  "nroLista" int(11) DEFAULT NULL,
  "agrupacion" varchar(45) NOT NULL,
  "listaInt" varchar(45) DEFAULT NULL,
  "tieneSenador" bit(1) NOT NULL,
  "tieneDiputado" bit(1) NOT NULL,
  "tieneLegislador" bit(1) NOT NULL,
  "tieneConsejal" bit(1) NOT NULL,
  "orden" int(11) NOT NULL,
  "esValido" bit(1) NOT NULL,
  "esPartido" bit(1) NOT NULL,
  PRIMARY KEY ("idOpcionVoto")
) TYPE=InnoDB AUTO_INCREMENT=100;

--
-- Dumping data for table "opcionvoto"
--

/*!40000 ALTER TABLE "opcionvoto" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "opcionvoto" ("idOpcionVoto","nroLista","agrupacion","listaInt","tieneSenador","tieneDiputado","tieneLegislador","tieneConsejal","orden","esValido","esPartido") VALUES 
 (14,501,'1PAIS','LISTA UN PAIS UNIDO HOY Y SIEMPRE',0x01,0x01,0x01,0x01,14,0x01,0x01),
 (17,503,'UNIDAD CIUDADANA','LISTA CELESTE Y BLANCA U',0x01,0x01,0x00,0x00,17,0x01,0x01),
 (18,503,'UNIDAD CIUDADANA','LISTA CELESTE Y BLANCA U2',0x00,0x00,0x01,0x01,18,0x01,0x01),
 (19,503,'UNIDAD CIUDADANA','LISTA 31',0x00,0x00,0x00,0x01,19,0x01,0x01),
 (31,508,'CAMBIEMOS BUENOS AIRES','LISTA CAMBIANDO JUNTOS',0x01,0x01,0x00,0x00,31,0x01,0x01),
 (32,508,'CAMBIEMOS BUENOS AIRES','LISTA 1A AMARILLO',0x00,0x00,0x01,0x01,32,0x01,0x01),
 (33,509,'FRENTE JUSTICIALISTA','LISTA CUMPLIR',0x01,0x01,0x00,0x00,33,0x01,0x01),
 (34,509,'FRENTE JUSTICIALISTA','LISTA CUMPLIR 2',0x00,0x00,0x01,0x01,34,0x01,0x01),
 (35,509,'FRENTE JUSTICIALISTA','LISTA AMARTE ARGENTINA 32',0x00,0x00,0x00,0x01,35,0x01,0x01),
 (45,705,'CON VOCACION POR SAN ISIDRO','LISTA EL PODER DE LOS VECINOS',0x00,0x00,0x00,0x01,45,0x01,0x01),
 (98,1,'TOTAL INVALIDOS',' ',0x01,0x01,0x01,0x01,49,0x00,0x00),
 (99,1,'OTROS PARTIDOS',' ',0x01,0x01,0x01,0x01,46,0x01,0x01);
COMMIT;
/*!40000 ALTER TABLE "opcionvoto" ENABLE KEYS */;


--
-- Definition of table "resultado"
--

DROP TABLE IF EXISTS "resultado";
CREATE TABLE "resultado" (
  "idOpcionVoto" int(11) NOT NULL,
  "cantidad" int(11) NOT NULL,
  "resto" decimal(20,4) NOT NULL,
  "votos" int(11) NOT NULL,
  PRIMARY KEY ("idOpcionVoto")
) TYPE=InnoDB;

--
-- Dumping data for table "resultado"
--

/*!40000 ALTER TABLE "resultado" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "resultado" ("idOpcionVoto","cantidad","resto","votos") VALUES 
 (14,2,'0.0000',1),
 (18,2,'0.0000',1),
 (32,2,'0.0000',1),
 (34,2,'0.0000',1),
 (99,4,'0.0000',2);
COMMIT;
/*!40000 ALTER TABLE "resultado" ENABLE KEYS */;


--
-- Definition of table "usuario"
--

DROP TABLE IF EXISTS "usuario";
CREATE TABLE "usuario" (
  "idUsuario" int(11) NOT NULL,
  "nombre" varchar(45) NOT NULL,
  PRIMARY KEY ("idUsuario")
) TYPE=InnoDB;

--
-- Dumping data for table "usuario"
--

/*!40000 ALTER TABLE "usuario" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "usuario" ("idUsuario","nombre") VALUES 
 (1,'Juan'),
 (2,'Pedro');
COMMIT;
/*!40000 ALTER TABLE "usuario" ENABLE KEYS */;


--
-- Definition of table "voto"
--

DROP TABLE IF EXISTS "voto";
CREATE TABLE "voto" (
  "idVoto" int(11) NOT NULL AUTO_INCREMENT,
  "idMesa" int(11) NOT NULL,
  "idOpcionVoto" int(11) NOT NULL,
  "idUsuario" int(11) NOT NULL,
  "cantSenador" int(11) NOT NULL,
  "cantDiputado" int(11) NOT NULL,
  "cantLegislador" int(11) NOT NULL,
  "cantConsejal" int(11) NOT NULL,
  "fecha" timestamp NULL DEFAULT NULL,
  PRIMARY KEY ("idVoto"),
  UNIQUE KEY "UN_Mesa_OpcionVoto" ("idMesa","idOpcionVoto"),
  KEY "FK_Opcion_idx" ("idOpcionVoto"),
  KEY "FK_Mesa_idx" ("idMesa"),
  KEY "FK_Usuario_idx" ("idUsuario"),
  CONSTRAINT "FK_Mesa" FOREIGN KEY ("idMesa") REFERENCES "mesa" ("idMesa") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "FK_Opcion" FOREIGN KEY ("idOpcionVoto") REFERENCES "opcionvoto" ("idOpcionVoto") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "FK_Usuario" FOREIGN KEY ("idUsuario") REFERENCES "usuario" ("idUsuario") ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB AUTO_INCREMENT=25;

--
-- Dumping data for table "voto"
--

/*!40000 ALTER TABLE "voto" DISABLE KEYS */;
SET AUTOCOMMIT=0;
INSERT INTO "voto" ("idVoto","idMesa","idOpcionVoto","idUsuario","cantSenador","cantDiputado","cantLegislador","cantConsejal","fecha") VALUES 
 (1,1,14,1,1,1,1,1,'2017-08-12 12:16:24'),
 (2,1,17,1,1,1,0,0,'2017-08-12 12:16:24'),
 (3,1,18,1,0,0,1,1,'2017-08-12 12:16:24'),
 (4,1,19,1,0,0,0,0,'2017-08-12 12:16:24'),
 (5,1,31,1,1,1,0,0,'2017-08-12 12:16:24'),
 (6,1,32,1,0,0,1,1,'2017-08-12 12:16:24'),
 (7,1,33,1,1,1,0,0,'2017-08-12 12:16:24'),
 (8,1,34,1,0,0,1,1,'2017-08-12 12:16:24'),
 (9,1,35,1,0,0,0,0,'2017-08-12 12:16:24'),
 (10,1,45,1,0,0,0,0,'2017-08-12 12:16:24'),
 (11,1,99,1,2,2,2,2,'2017-08-12 12:16:24'),
 (12,1,98,1,3,3,3,3,'2017-08-12 12:16:24'),
 (13,44,14,1,1,1,1,1,'2017-08-12 13:26:10'),
 (14,44,17,1,1,1,0,0,'2017-08-12 13:26:10'),
 (15,44,18,1,0,0,1,1,'2017-08-12 13:26:10'),
 (16,44,19,1,0,0,0,1,'2017-08-12 13:26:10'),
 (17,44,31,1,1,1,0,0,'2017-08-12 13:26:10'),
 (18,44,32,1,0,0,1,1,'2017-08-12 13:26:10'),
 (19,44,33,1,1,1,0,0,'2017-08-12 13:26:10'),
 (20,44,34,1,0,0,1,1,'2017-08-12 13:26:10'),
 (21,44,35,1,0,0,0,1,'2017-08-12 13:26:10'),
 (22,44,45,1,0,0,0,1,'2017-08-12 13:26:10'),
 (23,44,99,1,-3,-3,-3,-6,'2017-08-12 13:26:10'),
 (24,44,98,1,0,0,0,0,'2017-08-12 13:26:10');
COMMIT;
/*!40000 ALTER TABLE "voto" ENABLE KEYS */;


--
-- Definition of function "f_porcentaje_escrutado"
--

DROP FUNCTION IF EXISTS `f_porcentaje_escrutado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_porcentaje_escrutado`() RETURNS decimal(20,2)
BEGIN
DECLARE cargado int;
DECLARE total int;
 

set cargado = (select count(distinct(me.idMesa)) from mesa as me, voto as vo
										where me.idMesa = vo.idMesa);

set total = (select count(me.idMesa) from mesa as me);

RETURN cargado/total*100;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function "repartirFracciones"
--

DROP FUNCTION IF EXISTS `repartirFracciones`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `repartirFracciones`(puestos int) RETURNS int(11)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE resto decimal(20,4);
DECLARE idOpcionVoto int;
DECLARE cantidadVotos int;

DECLARE c_reparticionVotos cursor for SELECT re.idOpcionVoto, re.cantidad, re.resto FROM sistemavotacion.resultado as re
										order by re.resto desc;


DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	open c_reparticionVotos;
	
	c_lista_loop: LOOP
		fetch c_reparticionVotos into idOpcionVoto, cantidadVotos, resto;
			IF done or puestos = 0 THEN
				LEAVE c_lista_loop;
			END IF;
		set cantidadVotos = cantidadVotos + 1;
   
		update resultado set resultado.cantidad = cantidadVotos  where resultado.idOpcionVoto = idOpcionVoto;
	set puestos = puestos -1;
	END LOOP c_lista_loop;  

close c_reparticionVotos;

RETURN puestos;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of function "repartirUltima"
--

DROP FUNCTION IF EXISTS `repartirUltima`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` FUNCTION `repartirUltima`(puestos int) RETURNS int(11)
BEGIN
DECLARE idOpcionVoto int;
DECLARE cantidadVotos int;


set idOpcionVoto = (SELECT re.idOpcionVoto FROM resultado as re order by re.votos desc limit 1);
set cantidadVotos = (SELECT re.cantidad FROM resultado as re where re.idOpcionVoto=idOpcionVoto) + puestos;
update resultado set resultado.cantidad = cantidadVotos  where resultado.idOpcionVoto = idOpcionVoto;


RETURN 1;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure "cociente_electoral"
--

DROP PROCEDURE IF EXISTS `cociente_electoral`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `cociente_electoral`()
BEGIN

	DECLARE coeficiente decimal(20,4);
	DECLARE votos int;
	DECLARE resto decimal(20,4);
	DECLARE idOpcionVoto int;
	DECLARE puestos int default 12;
	DECLARE cantidadVotos int;
	DECLARE cantidad int;
	DECLARE mesa int;
	DECLARE done INT DEFAULT FALSE;
	

	DECLARE c_listaCandidatos cursor for  select op.idOpcionVoto , sum(vo.cantConsejal) from voto as vo, opcionvoto as op
													where vo.idOpcionVoto=op.idOpcionVoto
													and op.tieneConsejal=1
													and op.esPartido=1
													group by op.agrupacion  order by 2 desc;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

	delete from resultado;

	set coeficiente = ((select sum(vo.cantConsejal) from voto as vo, opcionvoto as op
								where vo.IdOpcionVoto=op.idOpcionVoto
								and op.tieneConsejal=1
								and op.esPartido=1
								and op.esValido=1)/puestos);


	open c_listaCandidatos;


	c_lista_loop: LOOP
		fetch c_listaCandidatos into idOpcionVoto, cantidadVotos;
			IF done or puestos < 1 THEN
				LEAVE c_lista_loop;
			END IF;
			if coeficiente < cantidadVotos then
				set cantidad = FLOOR(cantidadVotos /coeficiente);
				set puestos = puestos - cantidad; 
				set resto = (cantidadVotos /coeficiente) - cantidad;
				set votos = cantidadVotos;
				insert into resultado (idOpcionVoto, cantidad, resto, votos) values (idOpcionVoto,cantidad, resto, votos);
			end if;

	END LOOP c_lista_loop;    

	close c_listaCandidatos;


	if puestos > 0 then
		set mesa = (select repartirFracciones(puestos));
	end if;

	if puestos > 0 then
		set puestos = (select repartirUltima(mesa));
	end if;
	
	select op.nrolista, op.agrupacion, re.cantidad from resultado as re, opcionvoto as op
		where op.idOpcionVoto = re.idOpcionVoto
		order by re.votos desc;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view "v_consejales_listaint"
--

DROP TABLE IF EXISTS "v_consejales_listaint";
DROP VIEW IF EXISTS "v_consejales_listaint";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_consejales_listaint" AS (select concat("op"."agrupacion",' - ',"op"."listaInt") AS "lista",sum("vo"."cantConsejal") AS "cantidad" from ("voto" "vo" join "opcionvoto" "op") where (("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."tieneConsejal" = 1) and ("op"."esPartido" = 1)) group by "op"."agrupacion","op"."listaInt" order by sum("vo"."cantConsejal") desc limit 5) union (select concat("op"."agrupacion",' - ',"op"."listaInt") AS "lista",sum("vo"."cantConsejal") AS "cantidad" from ("voto" "vo" join "opcionvoto" "op") where (("vo"."idOpcionVoto" = "op"."idOpcionVoto") and (("op"."idOpcionVoto" = 9) or ("op"."idOpcionVoto" = 10))) group by "op"."agrupacion","op"."listaInt" order by sum("vo"."cantConsejal") desc limit 5);

--
-- Definition of view "v_consejales_localidad"
--

DROP TABLE IF EXISTS "v_consejales_localidad";
DROP VIEW IF EXISTS "v_consejales_localidad";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_consejales_localidad" AS select "lo"."nombre" AS "localidad","op"."agrupacion" AS "agrupacion",sum("vo"."cantConsejal") AS "cantidad" from (((("circuito" "ci" join "localidad" "lo") join "mesa" "me") join "opcionvoto" "op") join "voto" "vo") where (("lo"."idLocalidad" = "ci"."idLocalidad") and ("ci"."idCircuito" = "me"."idCircuito") and ("vo"."idMesa" = "me"."idMesa") and ("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."esPartido" = 1) and ("op"."esValido" = 1) and ("op"."tieneConsejal" = 1)) group by "lo"."nombre","op"."agrupacion";

--
-- Definition of view "v_consejales_localidad_reduc"
--

DROP TABLE IF EXISTS "v_consejales_localidad_reduc";
DROP VIEW IF EXISTS "v_consejales_localidad_reduc";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_consejales_localidad_reduc" AS select "lo"."nombre" AS "localidad","op"."agrupacion" AS "descr_agrup","op"."idOpcionVoto" AS "id_agrup",sum("vo"."cantConsejal") AS "cantidad" from (((("circuito" "ci" join "localidad" "lo") join "mesa" "me") join "opcionvoto" "op") join "voto" "vo") where (("lo"."idLocalidad" = "ci"."idLocalidad") and ("ci"."idCircuito" = "me"."idCircuito") and ("vo"."idMesa" = "me"."idMesa") and ("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."esPartido" = 1) and ("op"."esValido" = 1) and ("op"."tieneConsejal" = 1) and ("op"."idOpcionVoto" in (9,10,12,13))) group by "lo"."nombre","op"."agrupacion";

--
-- Definition of view "v_consejales_partido"
--

DROP TABLE IF EXISTS "v_consejales_partido";
DROP VIEW IF EXISTS "v_consejales_partido";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_consejales_partido" AS select "op"."agrupacion" AS "agrupacion",(sum("vo"."cantConsejal") / ((select sum("vo1"."cantConsejal") from ("voto" "vo1" join "opcionvoto" "op1") where (("vo1"."idOpcionVoto" = "op1"."idOpcionVoto") and ("op1"."tieneConsejal" = 1))) / 100)) AS "cantidad" from ("voto" "vo" join "opcionvoto" "op") where (("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."tieneConsejal" = 1)) group by "op"."agrupacion" order by (sum("vo"."cantConsejal") / ((select sum("vo1"."cantConsejal") from ("voto" "vo1" join "opcionvoto" "op1") where (("vo1"."idOpcionVoto" = "op1"."idOpcionVoto") and ("op1"."tieneConsejal" = 1))) / 100)) desc;

--
-- Definition of view "v_fpv_por_localidad"
--

DROP TABLE IF EXISTS "v_fpv_por_localidad";
DROP VIEW IF EXISTS "v_fpv_por_localidad";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_fpv_por_localidad" AS select "lo"."nombre" AS "localidad",sum("vo"."cantConsejal") AS "cantidad" from (((("circuito" "ci" join "localidad" "lo") join "mesa" "me") join "opcionvoto" "op") join "voto" "vo") where (("lo"."idLocalidad" = "ci"."idLocalidad") and ("ci"."idCircuito" = "me"."idCircuito") and ("vo"."idMesa" = "me"."idMesa") and ("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."esPartido" = 1) and ("op"."esValido" = 1) and ("op"."tieneConsejal" = 1) and ("op"."idOpcionVoto" = 9)) group by "lo"."nombre","op"."agrupacion";

--
-- Definition of view "v_porcentaje_escrutado"
--

DROP TABLE IF EXISTS "v_porcentaje_escrutado";
DROP VIEW IF EXISTS "v_porcentaje_escrutado";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_porcentaje_escrutado" AS select (((select count(distinct "me"."idMesa") from ("mesa" "me" join "voto" "vo") where ("me"."idMesa" = "vo"."idMesa")) / (select count("me"."idMesa") from "mesa" "me")) * 100) AS "Name_exp_1";

--
-- Definition of view "v_resultado_Con"
--

DROP TABLE IF EXISTS "v_resultado_Con";
DROP VIEW IF EXISTS "v_resultado_Con";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_resultado_Con" AS select "ov"."agrupacion" AS "Agrupacion",sum("vo"."cantConsejal") AS "Consejal" from ("opcionvoto" "ov" join "voto" "vo") where ("ov"."idOpcionVoto" = "vo"."idOpcionVoto") group by "ov"."agrupacion" order by sum("vo"."cantConsejal") desc;

--
-- Definition of view "v_resultado_Dip"
--

DROP TABLE IF EXISTS "v_resultado_Dip";
DROP VIEW IF EXISTS "v_resultado_Dip";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_resultado_Dip" AS select "ov"."agrupacion" AS "Agrupacion",sum("vo"."cantDiputado") AS "Diputados" from ("opcionvoto" "ov" join "voto" "vo") where ("ov"."idOpcionVoto" = "vo"."idOpcionVoto") group by "ov"."agrupacion" order by sum("vo"."cantDiputado") desc;

--
-- Definition of view "v_resultado_Leg"
--

DROP TABLE IF EXISTS "v_resultado_Leg";
DROP VIEW IF EXISTS "v_resultado_Leg";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_resultado_Leg" AS select "ov"."agrupacion" AS "Agrupacion",sum("vo"."cantLegislador") AS "Legislador" from ("opcionvoto" "ov" join "voto" "vo") where ("ov"."idOpcionVoto" = "vo"."idOpcionVoto") group by "ov"."agrupacion" order by sum("vo"."cantLegislador") desc;

--
-- Definition of view "v_resultados"
--

DROP TABLE IF EXISTS "v_resultados";
DROP VIEW IF EXISTS "v_resultados";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_resultados" AS select "ov"."agrupacion" AS "Agrupacion",sum("vo"."cantDiputado") AS "Diputados",sum("vo"."cantLegislador") AS "Legislador",sum("vo"."cantConsejal") AS "Consejal" from ("opcionvoto" "ov" join "voto" "vo") where ("ov"."idOpcionVoto" = "vo"."idOpcionVoto") group by "ov"."agrupacion";

--
-- Definition of view "v_top5_listaint"
--

DROP TABLE IF EXISTS "v_top5_listaint";
DROP VIEW IF EXISTS "v_top5_listaint";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_top5_listaint" AS select concat("op"."agrupacion",' - ',"op"."listaInt") AS "lista",sum("vo"."cantConsejal") AS "cantidad" from ("voto" "vo" join "opcionvoto" "op") where (("vo"."idOpcionVoto" = "op"."idOpcionVoto") and ("op"."tieneConsejal" = 1) and ("op"."esPartido" = 1) and ("op"."idOpcionVoto" <> 9) and ("op"."idOpcionVoto" <> 10)) group by "op"."agrupacion","op"."listaInt" order by sum("vo"."cantConsejal") desc limit 5;

--
-- Definition of view "v_votos"
--

DROP TABLE IF EXISTS "v_votos";
DROP VIEW IF EXISTS "v_votos";
CREATE ALGORITHM=UNDEFINED DEFINER="root"@"%" SQL SECURITY DEFINER VIEW "v_votos" AS select sum("vo"."cantConsejal") AS "sum(`vo`.`cantConsejal`)" from ("opcionvoto" "ov" join "voto" "vo") where (("ov"."idOpcionVoto" = "vo"."idOpcionVoto") and ("ov"."esPartido" = 1) and ("ov"."tieneConsejal" = 1));



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
