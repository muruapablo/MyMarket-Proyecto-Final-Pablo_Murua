CREATE SCHEMA 01_MyMarket_TF;
USE 01_MyMarket_TF;

CREATE TABLE Categoria(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    categoria VARCHAR(30) NOT NULL
);

CREATE TABLE Metodo(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    metodo_pago VARCHAR(50) NOT NULL
);

CREATE TABLE Modalidad(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    tipo_modalidad VARCHAR(40) NOT NULL
    );
    
    CREATE TABLE Productos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    Producto_nombre VARCHAR(100) NOT NULL,
    Categoria_id INT NOT NULL,
    Producto_marca VARCHAR(100) NOT NULL,
    Producto_proveedor VARCHAR(100) NOT NULL,
    Producto_precio DECIMAL(10, 2) NOT NULL,
    producto_Stock INT NOT NULL,
    FOREIGN KEY (Categoria_id) REFERENCES Categoria(id)
    );
    
    CREATE TABLE Usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
	modalidad_id INT NOT NULL, 
    FOREIGN KEY (Modalidad_id) REFERENCES Modalidad(id)
    );
    
    CREATE TABLE Pedido(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Compra INT NOT NULL,
    fecha DATE NOT NULL,
    Usuario_id INT NOT NULL,
    productos_id INT NOT NULL,
	cantidad INT NOT NULL,
    FOREIGN KEY (Productos_id) REFERENCES Productos(id),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
    );
    
     CREATE TABLE Pago(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    monto  DECIMAL(10, 2) NOT NULL,
    fecha DATE  NOT NULL,
	total DECIMAL(10, 2) NOT NULL,
    Pedido_id INT NOT NULL,
    Metodo_id INT NOT NULL, 
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (Metodo_id) REFERENCES Metodo(id)
    );
    
    CREATE TABLE Envio(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    fecha DATE NOT NULL,
	Envio_estado VARCHAR(100) NOT NULL,
    Pedido_id INT NOT NULL, 
    FOREIGN KEY (Pedido_id) REFERENCES Pedido(id)
    );
    
    CREATE TABLE Envio_Usuario(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fecha DATE NOT NULL,
    envio_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (Envio_id) REFERENCES Envio(id),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
    );
   
   
    INSERT INTO `Categoria` (`id`, `categoria`) VALUES
(1, 'Comestibles'),
(2, 'Bebidas'),
(3, 'Carnes'),
(4, 'Lácteos'),
(5, 'Libreria'),
(6, 'Limpieza'),
(7, 'Panificados'),
(8, 'Perfumeria'),
(9, 'Verduleria'),
(10, 'Otros Productos');

INSERT INTO metodo (id, metodo_pago) VALUES
	('1', 'Efectivo'),
	('2', 'Debito'),
	('3', 'Transferencia'),
	('4', 'Cheque'),
	('5', 'Otros');
        
INSERT INTO `Modalidad` (`id`, `tipo_modalidad`) VALUES
(1, 'Personal'),
(2, 'Web'),
(3, 'Telefonico'),
(4, 'Otras Modalidades');

INSERT INTO Productos (id, Producto_nombre, Categoria_id, Producto_marca, Producto_proveedor, Producto_precio, Producto_Stock) VALUES
	('1', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 1500 CC', '1', 'ZANONI', 'AFA', '434', '205'),
	('2', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'ZANONI', 'AFA', '261', '404'),
	('3', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'NATURA', 'AGD', '304', '532'),
	('4', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'ALSAMAR', 'BUNGE', '261', '936'),
	('5', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 1500 CC', '1', 'CORAZON GERSOL', 'GERMAIZ', '434', '315'),
	('6', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'CANUELAS', 'MOLINOS CANUELAS', '293', '683'),
	('7', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 1500 CC', '1', 'CANUELAS', 'MOLINOS CANUELAS', '472', '511'),
	('8', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 1500 CC', '1', 'COCINERO', 'MOLINOS RIO DE LA PLATA', '481', '210'),
	('9', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'COCINERO', 'MOLINOS RIO DE LA PLATA', '302', '452'),
	('10', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 1500 CC', '1', 'LEGITIMO', 'NIDERA', '437', '686'),
	('11', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'LEGITIMO', 'NIDERA', '263', '227'),
	('12', 'ACEITE DE GIRASOL BOTELLA DE PLASTICO - 900 CC', '1', 'COSTA DEL SOL', 'TANONI', '277', '932'),
	('13', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 1500 CC', '1', 'CADA DIA', 'AGD', '485', '592'),
	('14', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 900 CC', '1', 'CADA DIA', 'AGD', '304', '226'),
	('15', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 1500 CC', '1', 'EL RELICAIRO', 'GERMAIZ', '434', '924'),
	('16', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 1500 CC', '1', 'IDEAL', 'MOLINOS RIO DE LA PLATA', '481', '436'),
	('17', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 900 CC', '1', 'IDEAL', 'MOLINOS RIO DE LA PLATA', '302', '774'),
	('18', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 900 CC', '1', 'BELLA FLOR', 'NIEUW WERELD', '261', '931'),
	('19', 'ACEITE MEZCLA BOTELLA DE PLASTICO - 900 CC', '1', 'MAROLIO', 'VICENTIN', '223', '723'),
	('20', 'ARROZ DOBLE CAROLINA - 500 GR', '1', 'GALLO', 'MOLINOS RIO DE LA PLATA', '516', '773'),
	('21', 'ARROZ LARGO FINO 00000 LARGO FINO 00000 - 500 GR', '1', 'MOLINOS ALA', 'ADECO AGRO', '192', '434'),
	('22', 'ARVEJAS EN LATA - 350 GR', '1', 'ALCO', 'ALCO  CANALE', '236', '650'),
	('23', 'ARVEJAS EN LATA - 300 GR', '1', 'NOEL', 'ARCOR', '148', '667'),
	('24', 'ATUN AL NATURAL DESMENUZADO - 170 GR', '1', 'GOMES DA COSTA', 'GDC ARGENTINA GRUPO CALVO', '380', '358'),
	('25', 'ATUN AL NATURAL EN LATA - 170 GR', '1', 'LA CAMPAGNOLA', 'ARCOR', '820', '248'),
	('26', 'AZUCAR BLANCA  - 1 KG', '1', 'DOMINO', 'LEDESMA', '240', '660'),
	('27', 'AZUCAR BLANCA  - 1 KG', '1', 'LEDESMA', 'LEDESMA', '292', '839'),
	('28', 'AZUCAR BLANCA  - 1 KG', '1', 'CHANGO', 'TABACAL AGROINDUSTRIA', '292', '568'),
	('29', 'CACAO EN POLVO  - 180 GR', '1', 'TODDY', 'PEPSICO', '308', '308'),
	('30', 'CAFE MOLIDO  - 250 GR', '1', 'LA MORENITA', 'LA VIRGINIA', '592', '226'),
	('31', 'CALDO DE GALLINA - 114 GR', '1', 'MAGGI', 'NESTLE ARGENTINA', '320', '400'),
	('32', 'CALDO DE GALLINA - 114 GR', '1', 'WILDE', 'UNILEVER', '316', '246'),
	('33', 'DULCE DE BATATA  - 700 GR', '1', 'CANALE', 'ALCO  CANALE', '1', '319'),
	('34', 'DULCE DE LECHE ENTERO CLASICO NO REPOSTERO - 400 GR', '1', 'ILOLAY', 'SUCESORES DE ALFREDO WILLINER', '400', '614'),
	('35', 'DULCE DE LECHE ENTERO CLASICO POTE - 400 GR', '1', 'LA SERENISIMA', 'MASTELLONE', '484', '262'),
	('36', 'FIDEOS SECOS TIPO GUISEROS CODITOS - 500 GR', '1', 'PASTAS CANALE', 'TERRABUSI KRAFT MONDELEZ', '220', '618'),
	('37', 'FIDEOS SECOS TIPO GUISEROS MOSTACHOLES - 500 GR', '1', 'MANERA', 'MOLINOS RIO DE LA PLATA', '296', '773'),
	('38', 'FIDEOS SECOS TIPO TALLARIN - 500 GR', '1', 'FAVORITA', 'MOLINOS RIO DE LA PLATA', '280', '509'),
	('39', 'FIDEOS SECOS TIPO TALLARIN - 500 GR', '1', 'PASTAS CANALE', 'TERRABUSI KRAFT MONDELEZ', '260', '952'),
	('40', 'FOSFOROS  - 220 UN', '1', 'RANCHERA', 'COMPANIA GENERAL DE FOSFOROS SUDAMERICANA', '140', '908'),
	('41', 'GALLETITAS DE AGUA COMUNES ENVASADAS  - 110 GR', '1', 'MEDIA TARDE', 'ARCOR', '194', '412'),
	('42', 'GALLETITAS DE AGUA COMUNES ENVASADAS SINGLE - 120 GR', '1', 'EXPRESS CLASICAS PARAGUAS', 'TERRABUSI-KRAFT MONDELEZ', '176', '901'),
	('43', 'GALLETITAS DULCES ENVASADAS SECAS SIN RELLENO  - 465 GR', '1', 'VOCACION', 'ARCOR', '536', '820'),
	('44', 'GALLETITAS DULCES ENVASADAS SECAS SIN RELLENO CHOCOLATE  - 153 GR', '1', 'LINCOLN TOONIX CHOCO', 'TERRABUSI-KRAFT MONDELEZ', '216', '343'),
	('45', 'GALLETITAS DULCES ENVASADAS SECAS SIN RELLENO INDIVIDUAL - 160 GR', '1', 'BOCA DE DAMA', 'TERRABUSI-KRAFT MONDELEZ', '248', '975'),
	('46', 'HARINA DE MAIZ (POLENTA)  - 500 GR', '1', 'MAGICA', 'PEPSICO', '232', '352'),
	('47', 'HARINA DE TRIGO 0000 DE 0000 - 1 KG', '1', 'BLANCAFLOR', 'MOLINOS RIO DE LA PLATA', '320', '650'),
	('48', 'HARINA DE TRIGO COMUN  000 - 1 KG', '1', 'CANUELAS', 'MOLINOS CANUELAS', '254', '101'),
	('49', 'HARINA DE TRIGO COMUN 000 - 1 KG', '1', 'FAVORITA', 'MOLINOS RIO DE LA PLATA', '291', '216'),
	('50', 'HELADO SABOR LIMON Y FRUTILLA - 63 GR', '1', 'TORPEDO', 'NESTLE ARGENTINA', '1215', '636'),
	('51', 'HUEVOS BLANCOS  - 6 UN', '1', 'AVICOPER', 'NUESTRA HUELLA', '342', '732'),
	('52', 'HUEVOS BLANCOS  - 6 UN', '1', 'SIN MARCA', 'SIN MARCA', '342', '226'),
	('53', 'LENTEJAS SECAS REMOJADAS EN LATA - 300 GR', '1', 'LA CAMPAGNOLA', 'ARCOR', '452', '368'),
	('54', 'LENTEJAS SECAS REMOJADAS EN LATA - 350 GR', '1', 'INALPA', 'INALPA', '350', '481'),
	('55', 'MAYONESA COMUN  - 500 CC', '1', 'MENOYO', 'MENOYO S.A.', '292', '568'),
	('56', 'MAYONESA COMUN SACHET - 485 GR', '1', 'RIK MAY DOYP', 'UNILEVER', '316', '727'),
	('57', 'MERMELADA DE CIRUELA FRASCO DE VIDRIO - 454 GR', '1', 'ARCOR', 'ARCOR', '582', '229'),
	('58', 'MERMELADA DE DURAZNO FRASCO DE VIDRIO - 454 GR', '1', 'CANALE', 'ALCO  CANALE', '520', '819'),
	('59', 'POROTOS EN LATA - 350 GR', '1', 'ARCOR', 'ARCOR', '272', '296'),
	('60', 'PURE DE TOMATE EN LATA - 520 GR', '1', 'ALCO', 'ALCO  CANALE', '212', '680'),
	('61', 'PURE DE TOMATE EN LATA - 520 GR', '1', 'ARCOR', 'ARCOR', '182', '322'),
	('62', 'SAL FINA ESTUCHE - 500 GR', '1', 'CELUSAL', 'INDUSTRIAS QUIMICAS Y MINERAS TIMBO S.A.', '200', '230'),
	('63', 'SAL FINA PAQUETE DE PAPEL - 500 GR', '1', 'DOS ANCLAS', 'CIA.INTRODUCTORA BS.AS.', '170', '674'),
	('64', 'SAL GRUESA PAQUETE DE PAPEL - 1 KG', '1', 'DOS ANCLAS', 'CIA.INTRODUCTORA BS.AS.', '228', '955'),
	('65', 'SAL GRUESA PAQUETE DE PAPEL - 1 KG', '1', 'CELUSAL', 'INDUSTRIAS QUIMICAS Y MINERAS TIMBO S.A.', '218', '506'),
	('66', 'TAPA DE TARTA  - 230 GR', '1', 'LA SALTENA', 'GENERAL MILLS', '216', '755'),
	('67', 'TAPA DE TARTA PASCUALINA BAJO SODIO - 400 GR', '1', 'MENDIA', 'CASAMEN', '380', '745'),
	('68', 'TAPAS PARA EMPANADAS CRIOLLA - 20 UN', '1', 'LA SALTENA', 'GENERAL MILLS', '604', '139'),
	('69', 'TE COMUN EN SAQUITOS - 25 UN', '1', 'TARAGUI', 'ESTABLECIMIENTO LAS MARIAS S.A.', '184', '719'),
	('70', 'TE COMUN EN SAQUITOS - 25 UN', '1', 'LA MORENITA', 'LA VIRGINIA', '176', '712'),
	('71', 'TOMATE PERITA EN LATA - 400 GR', '1', 'ALCO', 'ALCO  CANALE', '280', '721'),
	('72', 'TOMATE PERITA EN LATA - 400 GR', '1', 'NOEL', 'ARCOR', '214', '666'),
	('73', 'VINAGRE DE ALCOHOL - 500 ML', '1', 'DOS ANCLAS', 'CIA.INTRODUCTORA BS.AS.', '192', '463'),
	('74', 'VINAGRE DE ALCOHOL - 500 ML', '1', 'MENOYO', 'MENOYO S.A.', '268', '105'),
	('75', 'YERBA MATE CON PALO  - 1 KG', '1', 'AMANDA', 'LA CACHUERA SA', '1', '777'),
	('76', 'YERBA MATE CON PALO BAJO CONTENIDO EN POLVO - 500 GR', '1', 'UNION', 'ESTABLECIMIENTO LAS MARIAS S.A.', '710', '247'),
	('77', 'HUESO CON CARNE  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '480', '1150'),
	('78', 'JABON BLANCO EN POLVO ALTA ESPUMA NATURAL FRESH - 400 GR', '6', 'ZORRO', 'ALICORP ARGENTINA S.C.A.', '220', '669'),
	('79', 'JABON BLANCO EN POLVO BAJA ESPUMA NATURAL FRESH - 800 GR', '6', 'ZORRO', 'ALICORP ARGENTINA S.C.A.', '424', '708'),
	('80', 'JABON BLANCO EN POLVO BAJA ESPUMA NATURAL FRESH - 400 GR', '6', 'ZORRO', 'ALICORP ARGENTINA S.C.A.', '220', '880'),
	('81', 'JABON DE TOCADOR CAMPOS DE ENSUENO - 3 UN', '8', 'LIMOL', 'ALICORP ARGENTINA S.C.A.', '316', '202'),
	('82', 'JABON DE TOCADOR TE VERDE ALOE VERA - 3 UN', '8', 'SUAVE', 'UNILEVER', '320', '878'),
	('83', 'JABON EN PAN ESFERAS ACTIVAS - 150 GR', '6', 'ZORRO', 'ALICORP ARGENTINA S.C.A.', '168', '261'),
	('84', 'JABON EN POLVO PARA LAVARROPAS  REGULAR - 800 GR', '6', 'QUERUBIN', 'GRUPO QUERUCLOR', '376', '733'),
	('85', 'JABON EN POLVO PARA LAVARROPAS BAJA ESPUMA - 800 GR', '6', 'QUERUBIN', 'GRUPO QUERUCLOR', '376', '741'),
	('86', 'JABON EN POLVO PARA LAVARROPAS BAJA ESPUMA - 800 GR', '6', 'ACE', 'PROCTER AND GAMBLE', '582', '665'),
	('87', 'JAMON COCIDO  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '4', '1927'),
	('88', 'JUGO CONCENTRADO DE NARANJA - 1.5 LT', '2', 'CARIOCA', 'COCA COLA FEMSA', '300', '723'),
	('89', 'JUGO CONCENTRADO DE NARANJA - 1.5 LT', '2', 'MOCORETA', 'RPB', '380', '641'),
	('90', 'JUGO SIN DILUIR DE NARANJA - 1 LT', '2', 'CEPITA', 'COCA COLA FEMSA', '116', '343'),
	('91', 'JUGO SIN DILUIR DE NARANJA - 200 ML', '2', 'BAGGIO', 'RPB', '64', '683'),
	('92', 'JUGOS EN POLVO ANANA -  GR', '2', 'SER', 'AGUAS DANONE DE ARGENTINA S.A.', '64', '569'),
	('93', 'JUGOS EN POLVO MANZANA -  GR', '2', 'SER', 'AGUAS DANONE DE ARGENTINA S.A.', '64', '786'),
	('94', 'JUGOS EN POLVO MULTIFRUTA - 25 GR', '2', 'ARCOR', 'ARCOR', '64', '602'),
	('95', 'JUGOS EN POLVO NARANJA -  GR', '2', 'SER', 'AGUAS DANONE DE ARGENTINA S.A.', '64', '196'),
	('96', 'JUGOS EN POLVO NARANJA DULCE -  GR', '2', 'SER', 'AGUAS DANONE DE ARGENTINA S.A.', '64', '755'),
	('97', 'JUGOS EN POLVO NARANJA DURAZNO -  GR', '2', 'SER', 'AGUAS DANONE DE ARGENTINA S.A.', '300', '643'),
	('98', 'LAVANDINA COMUN  - 1 LT', '6', 'AYUDIN', 'CLOROX ARGENTINA S.A.', '207', '962'),
	('99', 'LAVANDINA CONCENTRADA  - 1 LT', '6', 'QUERUBIN', 'GRUPO QUERUCLOR', '184', '296'),
	('100', 'LECHE COMUN DESCREMADA LIQUIDA SACHET - 1 LT', '4', 'LA SERENISIMA', 'MASTELLONE', '288', '1253'),
	('101', 'LECHE COMUN DESCREMADA LIQUIDA SACHET - 1 LT', '4', 'SANCOR', 'SANCOR', '288', '1150'),
	('102', 'LECHE COMUN ENTERA SACHET - 1 LT', '4', 'SANCOR', 'SANCOR', '276', '1927'),
	('103', 'LECHE COMUN ENTERA ULTRAPASTEURIZADA  SACHETEN SACHET - 1 LT', '4', 'LA SERENISIMA', 'MASTELLONE', '276', '1086'),
	('104', 'LECHE EN POLVO ENTERA PAQUETE - 200 GR', '4', 'LA SERENISIMA', 'MASTELLONE', '466', '1354'),
	('105', 'LECHE ENTERA LARGA VIDA U A T  - 1 LT', '4', 'MILKAUT', 'MILKAUT', '334', '1561'),
	('106', 'LECHE ENTERA LARGA VIDA U A T  - 1 LT', '4', 'VERONICA', 'VERONICA S.A.', '360', '1806'),
	('107', 'LECHUGA CRIOLLA - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '440', '997'),
	('108', 'LIMPIADOR FLORES DE NAR C/ MICROPARTICULAS - 375 GR', '6', 'CIF', 'UNILEVER', '280', '768'),
	('109', 'LIMPIADOR DESENGRASANTE REPUESTO DOY PACK - 500 ML', '6', 'MR. MUSCULO', 'S.C. JOHNSON Y SON DE ARG. S.A.', '176', '601'),
	('110', 'LIMPIADOR MULTIUSOS DOY PACK - 500 ML', '6', 'PROCENEX', 'RECKITT BENCKISER', '206', '823'),
	('111', 'MANTECA  - 200 GR', '4', 'MILKAUT', 'MILKAUT', '436', '1196'),
	('112', 'MANTECA CALIDAD EXTRA VITAMINAS A Y E - 200 GR', '4', 'LA SERENISIMA', 'MASTELLONE', '460', '1803'),
	('113', 'MANZANA ROJA - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '436', '212'),
	('114', 'MARUCHA  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '1', '1086'),
	('115', 'MEDALLON CARNE VACUNA CONGELADA  276 GR - 4 UN', '3', 'SWIFT', 'JBS', '752', '1080'),
	('116', 'PAN LACTAL BLANCO RODAJAS FINAS - 630 GR', '7', 'BIMBO', 'BIMBO DE ARGENTINA S.A.', '580', '233'),
	('117', 'PAN MIGNON PANADERIA DEL SUPERMERCADO - 1 KG', '7', 'SIN MARCA', 'SIN MARCA', '740', '40'),
	('118', 'PAN RALLADO COMUN PAQUETE - 500 GR', '7', 'MAMA COCINA', 'MOLINOS CANUELAS', '410', '120'),
	('119', 'PAN RALLADO COMUN PAQUETE - 500 GR', '7', 'PREFERIDO', 'MOLINOS RIO DE LA PLATA', '436', '200'),
	('120', 'PANALES DESCARTABLES PARA BEBES  ULTRA TRI PACK CHICO - 36 UN', '8', 'BABY SEC', 'PAPELERA DEL PLATA', '1788', '864'),
	('121', 'PANALES DESCARTABLES PARA BEBES  ULTRA TRI PACK EXTRA GRANDE - 24 UN', '8', 'BABY SEC', 'PAPELERA DEL PLATA', '1788', '942'),
	('122', 'PANALES DESCARTABLES PARA BEBES  ULTRA TRI PACK EXTRA-EXTRA GRANDE - 24 UN', '8', 'BABY SEC', 'PAPELERA DEL PLATA', '1788', '807'),
	('123', 'PANALES DESCARTABLES PARA BEBES  ULTRA TRI PACK GRANDE - 30 UN', '8', 'BABY SEC', 'PAPELERA DEL PLATA', '1788', '816'),
	('124', 'PANALES DESCARTABLES PARA BEBES  ULTRA TRI PACK MEDIANO - 36 UN', '8', 'BABY SEC', 'PAPELERA DEL PLATA', '1788', '817'),
	('125', 'PANALES DESCARTABLES PARA BEBES CANT. EXTRA GRANDE - 44 UN', '8', 'PAMPERS BABYSAN', 'PROCTER AND GAMBLE', '4', '407'),
	('126', 'PAPA NEGRA - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '204', '875'),
	('127', 'PAPEL HIGIENICO HOJA SIMPLE 4 ROLLOS DE 50 METROS CADA UNO - 50 MTRS', '6', 'HIGIENOL', 'PAPELERA DEL PLATA', '510', '323'),
	('128', 'PAPEL HIGIENICO HOJA SIMPLE 4 ROLLOS DE 80  - 320 MTRS', '6', 'CAMPANITA', 'CELULOSA CAMPANA', '800', '894'),
	('129', 'PASTA DENTAL EN CREMA O GEL  - 90 GR', '8', 'KOLYNOS', 'COLGATE PALMOLIVE S.A.', '262', '159'),
	('130', 'PASTA DENTAL EN CREMA O GEL  - 90 GR', '8', 'ODOL', 'COLGATE PALMOLIVE S.A.', '194', '709'),
	('131', 'PERA  - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '384', '304'),
	('132', 'POLLO CONGELADO SIN MENUDOS - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '740', '1354'),
	('133', 'POLLO ENTERO FRESCO-CONGELADO CON MENUDOS - 1 KG', '3', 'TODAS LAS MARCAS', 'CENTRO DE EMPRESAS DE PROCESADORAS AVICOLAS', '740', '1561'),
	('134', 'POLVO DE LAVADO  GRANBY LAVADO TOTAL - 800 GR', '6', 'GRANBY', 'UNILEVER', '623', '559'),
	('135', 'POSTRE NUEVO CHOCOLATE - 120 GR', '4', 'SHIMY', 'SANCOR', '212', '411'),
	('136', 'POSTRE NUEVO CHOCOLATE Y DULCE DE LECHE - 120 GR', '4', 'SHIMY', 'SANCOR', '212', '198'),
	('137', 'POSTRE NUEVO DULCE DE LECHE - 120 GR', '4', 'SHIMY', 'SANCOR', '212', '384'),
	('138', 'POSTRE NUEVO VAINILLA - 161 GR', '4', 'DANONINO', 'DANONE', '318', '1551'),
	('139', 'POSTRE NUEVO VAINILLA - 120 GR', '4', 'SHIMY', 'SANCOR', '212', '126'),
	('140', 'POSTRE NUEVO VAINILLA Y DULCE DE LECHE - 120 GR', '4', 'SHIMY', 'SANCOR', '212', '230'),
	('141', 'PRESERVATIVOS SUPER FINOS 6 UNIDADES - 1 UN', '8', 'PRIME', 'BUHLSA', '1', '241'),
	('142', 'PRESERVATIVOS SUPER FINOS 6 UNIDADES - 1 UN', '8', 'TULIPAN', 'KOPELCO', '952', '568'),
	('143', 'QUESO CREMA ENTERO  - 300 GR', '4', 'MENDICRIM', 'SANCOR', '680', '291'),
	('144', 'QUESO RALLADO PAQUETE - 120 GR', '4', 'TREGAR', 'GARCIA HNOS. AGROINDUSTRIAL', '640', '1904'),
	('145', 'QUESO RALLADO PAQUETE - 120 GR', '4', 'LA SERENISIMA', 'MASTELLONE', '740', '1624'),
	('146', 'REPUESTO DE HOJAS TRADICIONAL CUADRICULADO - 96 HOJAS', '5', 'GLORIA', 'LEDESMA', '540', '122'),
	('147', 'REPUESTO DE HOJAS TRADICIONAL RAYADO - 96 HOJAS', '5', 'GLORIA', 'LEDESMA', '540', '831'),
	('148', 'ROAST BEEF  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '2', '1806'),
	('149', 'SALCHICHAS TIPO VIENA CON PIEL  - 6 UN', '3', 'SWIFT', 'JBS', '388', '1196'),
	('150', 'SALCHICHAS TIPO VIENA CON PIEL  - 6 UN', '3', 'PATY VIENA', 'QUICKFOOD', '416', '1803'),
	('151', 'SHAMPOO FAMILIAR CERAMIDAS+ARGININA - 1 LT', '8', 'PLUSBELLE', 'ALICORP ARGENTINA S.C.A.', '630', '427'),
	('152', 'SODA BOTELLA DE PLASTICO - 2.25 LT', '2', 'SIERRA DE LOS PADRES', 'NUTRECO ALIMENTOS S.A./ BEBIDAS NIGUIL', '416', '948'),
	('153', 'TAPA DE ASADO  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '2', '411'),
	('154', 'TAPA DE NALGA  - 1 KG', '3', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '2', '198'),
	('155', 'TOALLAS FEMENINAS NORMAL CON ALAS  - 8 UN', '8', 'CALIPSO', 'ALGODONERA ACONCAGUA SA', '192', '314'),
	('156', 'TOALLAS FEMENINAS NORMAL CON ALAS COMFORT - 8 UN', '8', 'LADY SOFT', 'PAPELERA DEL PLATA', '216', '861'),
	('157', 'TOMATE REDONDO  - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '420', '362'),
	('158', 'TOSTADAS  CLASICAS LIVIANAS - 150 GR', '7', 'BIMBO', 'BIMBO DE ARGENTINA S.A.', '422', '150'),
	('159', 'VINO COMUN TINTO TETRABRICK - 1 LT', '2', 'FACUNDO', 'PENAFLOR', '384', '414'),
	('160', 'VINO COMUN TINTO TETRABRICK - 1 LT', '2', 'UVITA', 'RPB', '394', '567'),
	('161', 'YOGUR DESCREMADO CON MUESLI - 174 GR', '4', 'SER', 'DANONE', '320', '335'),
	('162', 'ZANAHORIA  - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '258', '189'),
	('163', 'ZAPALLO  - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '360', '329'),
	('164', 'AJI MORRON FRESCO ROJO - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '1', '407'),
	('165', 'BATATA  - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '276', '565'),
	('166', 'CEBOLLA BLANCA - 1 KG', '9', 'SIN MARCA (SUPERMERCADO)', 'SIN MARCA (SUPERMERCADO)', '260', '879'),
	('167', 'CUADERNO ESCOLAR NRO 3  TAPA BLANDA - 48 HOJAS', '5', 'GLORIA', 'LEDESMA', '220', '794'),
	('168', 'CUADERNO ESCOLAR NRO 3 FORRADO UNIVERSO TAPA DURA - 48 HOJAS', '5', 'GLORIA', 'LEDESMA', '580', '304'),
	('169', 'FACTURAS DE MANTECA - 1 UN', '7', 'SIN MARCA', 'SIN MARCA', '107', '123');
    
INSERT INTO Usuario (id, nombre, telefono, mail, direccion, modalidad_id) VALUES
	('1', 'Collin Frigout', '429-366-2481', 'cfrigout0@ft.com', '2 Sachs Junction', '3'),
	('2', 'Marshal Croyden', '598-430-7047', 'mcroyden1@businesswire.com', '566 Dunning Avenue', '1'),
	('3', 'Dolly Mollett', '681-593-9149', 'dmollett2@slideshare.net', '7 Dayton Court', '3'),
	('4', 'Chery Fatscher', '798-501-1930', 'cfatscher3@studiopress.com', '24595 Tennessee Place', '3'),
	('5', 'Sile Dendle', '475-242-7335', 'sdendle4@plala.or.jp', '757 Browning Circle', '2'),
	('6', 'Katee Godleman', '383-255-9374', 'kgodleman5@dion.ne.jp', '8 Pawling Hill', '3'),
	('7', 'Vannie Binney', '879-835-9611', 'vbinney6@yellowbook.com', '827 Schiller Crossing', '2'),
	('8', 'Layney Grisenthwaite', '107-155-0002', 'lgrisenthwaite7@tumblr.com', '9 Bayside Pass', '3'),
	('9', 'Courtnay Romushkin', '305-244-0029', 'cromushkin8@mediafire.com', '72763 Tennyson Junction', '1'),
	('10', 'Allyn Tibbles', '658-989-1414', 'atibbles9@eepurl.com', '9 Basil Plaza', '2'),
	('11', 'Martha Scawen', '606-434-3708', 'mscawena@squidoo.com', '90008 Huxley Place', '1'),
	('12', 'Conant Haily', '594-335-9781', 'chailyb@ft.com', '2005 Corry Road', '3'),
	('13', 'Micheil Haresign', '176-963-2432', 'mharesignc@wikimedia.org', '93 Southridge Point', '2'),
	('14', 'Kacy Coldrick', '479-696-3421', 'kcoldrickd@networksolutions.com', '947 Burning Wood Pass', '1'),
	('15', 'Deeanne Caudray', '770-619-4253', 'dcaudraye@home.pl', '175 Mandrake Avenue', '2'),
	('16', 'Shermie Lankester', '691-501-3488', 'slankesterf@e-recht24.de', '138 Wayridge Drive', '3'),
	('17', 'Pennie St Clair', '557-458-3404', 'pstg@ft.com', '79744 Coolidge Road', '1'),
	('18', 'Ernaline Krolman', '462-536-3084', 'ekrolmanh@thetimes.co.uk', '5 Sugar Point', '1'),
	('19', 'Reyna Cowlam', '148-856-4871', 'rcowlami@wiley.com', '6 Morning Court', '1'),
	('20', 'Lyndsey Rief', '455-150-7191', 'lriefj@prnewswire.com', '57 Clemons Hill', '3'),
	('21', 'Netty Gilmour', '199-838-4670', 'ngilmourk@clickbank.net', '973 Scott Drive', '3'),
	('22', 'Nannette Westcott', '181-579-5067', 'nwestcottl@instagram.com', '1 Southridge Hill', '1'),
	('23', 'Claudia Workes', '361-573-5577', 'cworkesm@usatoday.com', '63464 Calypso Avenue', '3'),
	('24', 'Tamarra Insley', '895-605-7864', 'tinsleyn@cdc.gov', '307 Golf View Drive', '1'),
	('25', 'Bobina Pettecrew', '322-517-5106', 'bpettecrewo@infoseek.co.jp', '54 Myrtle Park', '1'),
	('26', 'Arnoldo Moffett', '823-899-6655', 'amoffettp@mail.ru', '2065 Dapin Center', '3'),
	('27', 'Murray Mahedy', '403-844-4013', 'mmahedyq@lycos.com', '15689 Porter Junction', '1'),
	('28', 'Hannah Scamp', '191-302-5000', 'hscampr@angelfire.com', '7 Shelley Parkway', '2'),
	('29', 'Ralina Denne', '868-102-5648', 'rdennes@soundcloud.com', '632 Dexter Lane', '1'),
	('30', 'Johnnie Yoskowitz', '194-316-3070', 'jyoskowitzt@dedecms.com', '22814 Jenna Street', '1'),
	('31', 'Larine Pietri', '902-718-4453', 'lpietriu@instagram.com', '863 Northland Terrace', '1'),
	('32', 'Alisa Willoughey', '512-343-1685', 'awillougheyv@google.com.hk', '7603 Debs Drive', '1'),
	('33', 'Bern McCrackem', '547-235-6003', 'bmccrackemw@mashable.com', '6 Chive Crossing', '1'),
	('34', 'Nada Slaght', '774-485-9602', 'nslaghtx@digg.com', '08445 Claremont Circle', '2'),
	('35', 'Patric Rawdall', '564-556-1180', 'prawdally@youtube.com', '20552 Stone Corner Plaza', '2'),
	('36', 'Christiane Sissens', '351-131-0432', 'csissensz@google.nl', '9955 Carberry Point', '1'),
	('37', 'Andie Germain', '353-630-4529', 'agermain10@intel.com', '3682 Kim Plaza', '3'),
	('38', 'Reube McElmurray', '487-834-6098', 'rmcelmurray11@nih.gov', '95 Fordem Terrace', '3'),
	('39', 'Antonia Covington', '522-267-8357', 'acovington12@mlb.com', '52164 North Trail', '1'),
	('40', 'Lena Battany', '603-311-6224', 'lbattany13@tamu.edu', '09256 Blaine Alley', '3'),
	('41', 'Chic Packe', '619-638-0762', 'cpacke14@paginegialle.it', '48 Moulton Alley', '3'),
	('42', 'Kelvin Showt', '344-137-1520', 'kshowt15@opera.com', '223 Dahle Junction', '2'),
	('43', 'Winonah Frankcom', '170-209-2450', 'wfrankcom16@census.gov', '12 Messerschmidt Hill', '1'),
	('44', 'Wernher Mountlow', '605-930-9014', 'wmountlow17@google.pl', '44 Hallows Road', '3'),
	('45', 'Birgit Geane', '878-880-5855', 'bgeane18@yellowbook.com', '224 Dapin Street', '3'),
	('46', 'Avis Leisman', '656-901-7598', 'aleisman19@privacy.gov.au', '05 Trailsway Crossing', '3'),
	('47', 'Halsy Barca', '993-111-0111', 'hbarca1a@tuttocitta.it', '7 Weeping Birch Street', '3'),
	('48', 'Tyson Geelan', '622-960-7212', 'tgeelan1b@tripadvisor.com', '746 Heffernan Road', '3'),
	('49', 'Lon Boggs', '439-643-5458', 'lboggs1c@php.net', '8853 Fallview Drive', '3'),
	('50', 'Martguerita McGrirl', '217-733-3882', 'mmcgrirl1d@pbs.org', '9 Lakewood Alley', '1'),
	('51', 'Weston Burry', '505-590-6495', 'wburry1e@cdc.gov', '7571 High Crossing Street', '2'),
	('52', 'Lurline Ritmeyer', '535-342-7613', 'lritmeyer1f@virginia.edu', '7540 Hintze Junction', '1'),
	('53', 'Harlene Angrove', '891-151-0385', 'hangrove1g@microsoft.com', '6429 Marcy Drive', '1'),
	('54', 'Tobiah Talloe', '191-801-7247', 'ttalloe1h@elpais.com', '981 Lukken Hill', '2'),
	('55', 'Othilia Doctor', '213-789-7168', 'odoctor1i@123-reg.co.uk', '01 Novick Way', '3'),
	('56', 'Corabella Willows', '170-652-1583', 'cwillows1j@theguardian.com', '72 Warbler Lane', '1'),
	('57', 'Marty Maltby', '233-952-0119', 'mmaltby1k@canalblog.com', '0 Clyde Gallagher Street', '1'),
	('58', 'Keary Pepperrall', '784-273-7927', 'kpepperrall1l@jimdo.com', '38 Anthes Drive', '3'),
	('59', 'Chryste Pluthero', '517-846-3394', 'cpluthero1m@statcounter.com', '2 Lawn Avenue', '2'),
	('60', 'Philly Atyea', '712-680-2878', 'patyea1n@oakley.com', '35690 Bunker Hill Circle', '3'),
	('61', 'Binni Simnel', '821-130-1168', 'bsimnel1o@discuz.net', '605 Milwaukee Crossing', '1'),
	('62', 'Rozele Glassard', '441-341-0678', 'rglassard1p@symantec.com', '4 Cardinal Parkway', '3'),
	('63', 'Myrah Manifold', '348-304-4009', 'mmanifold1q@cafepress.com', '39758 7th Alley', '3'),
	('64', 'Engracia Balcers', '627-826-7667', 'ebalcers1r@360.cn', '6 Daystar Parkway', '1'),
	('65', 'Ambur McCaster', '931-345-7347', 'amccaster1s@ifeng.com', '234 Steensland Alley', '2'),
	('66', 'Meghan MacKeague', '850-662-5186', 'mmackeague1t@symantec.com', '32606 Arapahoe Point', '2'),
	('67', 'Simonette McCaughey', '235-923-9691', 'smccaughey1u@spiegel.de', '3431 Truax Hill', '3'),
	('68', 'Pavla Hackford', '866-887-8184', 'phackford1v@noaa.gov', '8 Buena Vista Lane', '1'),
	('69', 'Bronny Petrol', '576-909-4216', 'bpetrol1w@pbs.org', '401 Waywood Circle', '1'),
	('70', 'Jay Strettell', '944-182-6273', 'jstrettell1x@rakuten.co.jp', '4944 Fisk Circle', '3'),
	('71', 'Rinaldo Ferroni', '459-797-3568', 'rferroni1y@biglobe.ne.jp', '73 Mallory Point', '4'),
	('72', 'Lilllie Dinsdale', '671-370-1699', 'ldinsdale1z@ftc.gov', '0673 Messerschmidt Center', '3'),
	('73', 'Leonard Lethcoe', '883-205-6653', 'llethcoe20@cafepress.com', '6 Tennessee Alley', '3'),
	('74', 'Carlota Heppner', '906-797-9054', 'cheppner21@privacy.gov.au', '7 North Plaza', '1'),
	('75', 'Thorsten Pharro', '774-445-6043', 'tpharro22@google.ru', '48641 Brentwood Drive', '2'),
	('76', 'Cissiee Bulle', '908-622-5999', 'cbulle23@redcross.org', '05252 Morning Park', '1'),
	('77', 'Augusto Fonteyne', '843-985-9753', 'afonteyne24@etsy.com', '724 Texas Pass', '3'),
	('78', 'Zebedee Bissill', '485-842-9777', 'zbissill25@oracle.com', '3823 Center Terrace', '3'),
	('79', 'Batsheva Morse', '898-198-1782', 'bmorse26@github.io', '62 Packers Parkway', '3'),
	('80', 'Rodrick Harwood', '592-693-8940', 'rharwood27@ucsd.edu', '5 Dennis Park', '2'),
	('81', 'Regen Bowhey', '832-345-8842', 'rbowhey28@scientificamerican.com', '5805 Schurz Pass', '3'),
	('82', 'Eadith Ksandra', '830-591-4118', 'eksandra29@berkeley.edu', '672 Swallow Terrace', '1'),
	('83', 'Igor Fawthorpe', '282-364-8822', 'ifawthorpe2a@cyberchimps.com', '242 Grim Lane', '3'),
	('84', 'Kean Halton', '479-949-0617', 'khalton2b@jalbum.net', '4959 Moland Place', '2'),
	('85', 'Nadiya Gorvette', '979-333-0438', 'ngorvette2c@51.la', '10 Monica Crossing', '1'),
	('86', 'Celinka Thorius', '179-813-4970', 'cthorius2d@about.com', '31582 Golf Lane', '1'),
	('87', 'Graehme Berkely', '338-315-3176', 'gberkely2e@icq.com', '69 Rieder Circle', '2'),
	('88', 'Karel De Avenell', '308-218-1258', 'kde2f@wikipedia.org', '83540 Stone Corner Avenue', '3'),
	('89', 'Lenora Fullun', '544-114-2534', 'lfullun2g@tripod.com', '927 Utah Place', '1'),
	('90', 'Rowen Hofner', '135-844-5205', 'rhofner2h@paypal.com', '3864 Marquette Drive', '2'),
	('91', 'Tamas Lindro', '121-300-0687', 'tlindro2i@google.cn', '462 Packers Plaza', '3'),
	('92', 'Lorianne O\'Breen', '256-852-0012', 'lobreen2j@soup.io', '891 Forest Run Junction', '2'),
	('93', 'Patten Georg', '551-469-4057', 'pgeorg2k@imageshack.us', '46421 Dottie Center', '1'),
	('94', 'Jasen MacClure', '465-368-9259', 'jmacclure2l@answers.com', '5 Village Green Circle', '2'),
	('95', 'Dode Bugdell', '604-166-0062', 'dbugdell2m@msn.com', '0660 Sycamore Terrace', '3'),
	('96', 'Leonardo Gonzalvo', '315-749-1443', 'lgonzalvo2n@dailymotion.com', '68 Florence Terrace', '1'),
	('97', 'Ardene Djokic', '891-367-4472', 'adjokic2o@wiley.com', '9 Sutteridge Drive', '1'),
	('98', 'Anna-diana Jaray', '273-512-0292', 'ajaray2p@ibm.com', '340 Clarendon Crossing', '3'),
	('99', 'Jerrie Antrum', '387-857-8867', 'jantrum2q@dyndns.org', '619 Kedzie Alley', '1'),
	('100', 'Torin Fairbairn', '285-526-4888', 'tfairbairn2r@smugmug.com', '4 Valley Edge Way', '3'),
	('101', 'Mareah Tzarkov', '341-850-3729', 'mtzarkov2s@prlog.org', '04175 Mccormick Trail', '1'),
	('102', 'Hobey Maxstead', '657-287-4704', 'hmaxstead2t@intel.com', '6401 Southridge Circle', '2'),
	('103', 'Chaddie Adam', '818-489-4122', 'cadam2u@marriott.com', '6 New Castle Crossing', '2'),
	('104', 'Tomkin Orbon', '868-704-5706', 'torbon2v@oakley.com', '80972 Rutledge Crossing', '2'),
	('105', 'Franky Polland', '257-936-4262', 'fpolland2w@scribd.com', '4 Sommers Drive', '3'),
	('106', 'Elsie Hodgon', '455-996-2774', 'ehodgon2x@hubpages.com', '23 Arrowood Park', '1'),
	('107', 'Lauraine Membry', '939-551-9735', 'lmembry2y@amazon.co.uk', '96 Buhler Street', '2'),
	('108', 'Mendie Remington', '586-537-0965', 'mremington2z@cloudflare.com', '9769 Hanson Drive', '2'),
	('109', 'Carlie Blanden', '857-833-5326', 'cblanden30@miibeian.gov.cn', '04 Heath Drive', '1'),
	('110', 'Ignatius Wyer', '588-568-3387', 'iwyer31@abc.net.au', '1 Manitowish Street', '1'),
	('111', 'Reamonn Litton', '636-219-4604', 'rlitton32@guardian.co.uk', '49550 Oak Circle', '2'),
	('112', 'Perren Alexsandrev', '110-671-8341', 'palexsandrev33@hugedomains.com', '2 Del Mar Street', '3'),
	('113', 'Preston Studdert', '748-586-8054', 'pstuddert34@alexa.com', '38168 Sachs Way', '1'),
	('114', 'Celle Hickford', '480-354-2772', 'chickford35@engadget.com', '04962 Sherman Hill', '2'),
	('115', 'Judah Kirk', '460-745-5735', 'jkirk36@ow.ly', '9 Randy Avenue', '1'),
	('116', 'Farah Brisard', '767-854-7816', 'fbrisard37@salon.com', '08657 Crest Line Road', '3'),
	('117', 'Jennette Shrimpling', '936-941-0618', 'jshrimpling38@angelfire.com', '8 Sommers Plaza', '1'),
	('118', 'Papagena German', '316-515-5438', 'pgerman39@fc2.com', '73 Elmside Center', '2'),
	('119', 'Xavier Pumphreys', '568-393-8915', 'xpumphreys3a@paypal.com', '63 Chive Place', '2'),
	('120', 'Forster Udey', '329-806-4581', 'fudey3b@gravatar.com', '4409 Farwell Plaza', '1'),
	('121', 'Ashly Hanratty', '308-632-3812', 'ahanratty3c@free.fr', '58788 Golf Course Plaza', '2'),
	('122', 'Trix Walbrun', '814-602-3596', 'twalbrun3d@vk.com', '45886 Warrior Alley', '3'),
	('123', 'Cristy Sotheby', '594-272-6398', 'csotheby3e@wordpress.org', '9916 Thompson Drive', '3'),
	('124', 'Harcourt Dizlie', '154-606-6033', 'hdizlie3f@amazon.com', '3551 Macpherson Center', '3'),
	('125', 'Cobb Trumble', '144-209-5649', 'ctrumble3g@123-reg.co.uk', '174 Jay Crossing', '1'),
	('126', 'Blakelee Jelleman', '757-319-2084', 'bjelleman3h@chicagotribune.com', '7127 Comanche Pass', '2'),
	('127', 'Leeanne Gresser', '380-301-7919', 'lgresser3i@twitter.com', '01 Vera Pass', '2'),
	('128', 'Tansy Hatcher', '849-930-2485', 'thatcher3j@loc.gov', '7 Anderson Plaza', '3'),
	('129', 'Kristyn Logesdale', '867-728-3814', 'klogesdale3k@chronoengine.com', '0821 Forster Alley', '1'),
	('130', 'Keefe Parmby', '169-655-3306', 'kparmby3l@ocn.ne.jp', '4923 Derek Crossing', '3'),
	('131', 'Smitty Bellwood', '798-554-7783', 'sbellwood3m@google.it', '20688 Straubel Trail', '2'),
	('132', 'Beckie Gasquoine', '846-624-7331', 'bgasquoine3n@vinaora.com', '346 Maple Wood Park', '2'),
	('133', 'Madalena Heigho', '424-744-0231', 'mheigho3o@chronoengine.com', '69 Melvin Parkway', '3'),
	('134', 'Kristan Andreassen', '277-918-7766', 'kandreassen3p@census.gov', '1504 Eastlawn Avenue', '1'),
	('135', 'Hurley Drinkale', '279-945-8867', 'hdrinkale3q@slideshare.net', '05750 Red Cloud Lane', '2'),
	('136', 'Chilton Barrim', '672-736-8428', 'cbarrim3r@webs.com', '9 Commercial Street', '2'),
	('137', 'Britteny O\'Lagene', '550-213-6063', 'bolagene3s@storify.com', '2317 Scoville Street', '1'),
	('138', 'Nicolle Ioselevich', '723-933-6951', 'nioselevich3t@washingtonpost.com', '56818 Grayhawk Street', '2'),
	('139', 'Kaye Fransewich', '203-141-4834', 'kfransewich3u@shinystat.com', '90 Graceland Drive', '2'),
	('140', 'Uriel Geleman', '274-641-0994', 'ugeleman3v@epa.gov', '8 Steensland Way', '3'),
	('141', 'Zolly Marrion', '880-594-6667', 'zmarrion3w@amazon.co.jp', '1697 Village Road', '2'),
	('142', 'Arvin Gelder', '309-802-1800', 'agelder3x@ehow.com', '17 Morningstar Circle', '1'),
	('143', 'Bridie Fealey', '187-132-5683', 'bfealey3y@1und1.de', '888 Magdeline Place', '1'),
	('144', 'Gayleen Copper', '190-808-5049', 'gcopper3z@slashdot.org', '71 Wayridge Court', '2'),
	('145', 'Kakalina Philippault', '396-560-6203', 'kphilippault40@globo.com', '7 Garrison Trail', '2'),
	('146', 'Shoshana Wycliffe', '298-137-6759', 'swycliffe41@mac.com', '47 Riverside Drive', '2'),
	('147', 'Micheal Leed', '402-649-9114', 'mleed42@behance.net', '1909 Hanover Park', '2'),
	('148', 'Lotte Evangelinos', '926-957-7938', 'levangelinos43@squidoo.com', '590 Lunder Street', '1'),
	('149', 'Benito Yukhtin', '747-626-4337', 'byukhtin44@patch.com', '15 Forster Court', '1'),
	('150', 'Rahel Lafoy', '413-444-4824', 'rlafoy45@oaic.gov.au', '61 Everett Street', '3'),
	('151', 'Cyrill Housecroft', '830-748-6675', 'chousecroft46@jiathis.com', '28713 Starling Trail', '3'),
	('152', 'Moses Latus', '403-207-9046', 'mlatus47@myspace.com', '5 Longview Parkway', '2'),
	('153', 'Jordan De Castri', '260-137-6567', 'jde48@unc.edu', '31455 Buhler Point', '1'),
	('154', 'Robert Beldam', '756-683-2095', 'rbeldam49@addthis.com', '52883 Elmside Road', '1'),
	('155', 'Fabe Davidwitz', '560-412-5946', 'fdavidwitz4a@drupal.org', '65 Sloan Point', '3'),
	('156', 'Shayne Bartalin', '142-474-6685', 'sbartalin4b@diigo.com', '11 Summerview Terrace', '2'),
	('157', 'Dare Loffel', '933-810-5579', 'dloffel4c@blogtalkradio.com', '6 Dapin Terrace', '1'),
	('158', 'Alisa Jakubovics', '232-320-6658', 'ajakubovics4d@bloglines.com', '308 Linden Lane', '1'),
	('159', 'Casi Pocknoll', '300-514-7209', 'cpocknoll4e@topsy.com', '46016 Russell Drive', '3'),
	('160', 'Joachim Mabbott', '873-758-7510', 'jmabbott4f@umn.edu', '6 Mcguire Street', '1'),
	('161', 'Cly Gibbett', '754-275-6410', 'cgibbett4g@behance.net', '2719 Dottie Center', '1'),
	('162', 'Caron Starkie', '501-882-1893', 'cstarkie4h@shutterfly.com', '9122 Birchwood Street', '3'),
	('163', 'Ebony Hempel', '760-423-7092', 'ehempel4i@census.gov', '14 South Crossing', '2'),
	('164', 'Matthaeus Timmes', '145-181-3073', 'mtimmes4j@meetup.com', '77 Pond Pass', '1'),
	('165', 'Janot Antrack', '952-667-5503', 'jantrack4k@epa.gov', '1035 Jackson Court', '1'),
	('166', 'Sarene Patrone', '746-144-1852', 'spatrone4l@youtube.com', '2 Dahle Court', '2'),
	('167', 'Rip Yushmanov', '344-478-1360', 'ryushmanov4m@twitter.com', '151 Columbus Place', '2'),
	('168', 'Gregor Lampel', '621-204-2522', 'glampel4n@ifeng.com', '1151 Kenwood Court', '1'),
	('169', 'Emelen Allett', '893-297-3329', 'eallett4o@zdnet.com', '666 Linden Trail', '2'),
	('170', 'Aharon Oxby', '511-982-5728', 'aoxby4p@smh.com.au', '233 American Ash Avenue', '3');


 INSERT INTO Pedido (id, Compra, fecha, Usuario_id, productos_id, cantidad) VALUES
	('2', '1', '2023-03-15', '8', '153', '1'),
	('3', '2', '2023-04-25', '169', '33', '5'),
	('4', '4', '2023-05-02', '2', '5', '1'),
	('5', '4', '2023-05-02', '2', '4', '10'),
	('6', '5', '2023-07-01', '151', '161', '2'),
	('7', '5', '2023-07-01', '151', '165', '9'),
	('8', '5', '2023-07-01', '151', '123', '1'),
	('9', '6', '2023-04-24', '18', '37', '2'),
	('10', '6', '2023-04-24', '18', '151', '3'),
	('11', '6', '2023-04-24', '18', '127', '10'),
	('12', '7', '2023-02-21', '165', '105', '1'),
	('13', '7', '2023-02-21', '165', '149', '9'),
	('14', '8', '2023-03-30', '151', '103', '4'),
	('15', '8', '2023-03-30', '151', '87', '2'),
	('16', '8', '2023-03-30', '151', '98', '1'),
	('17', '9', '2022-09-21', '71', '112', '4'),
	('18', '9', '2022-09-21', '74', '163', '3'),
	('19', '9', '2022-09-21', '74', '28', '6'),
	('20', '9', '2022-09-21', '74', '168', '10'),
	('21', '10', '2022-09-01', '86', '136', '3'),
	('22', '10', '2022-07-23', '86', '133', '8'),
	('23', '10', '2022-07-23', '86', '70', '10'),
	('24', '11', '2022-10-27', '139', '126', '8'),
	('25', '11', '2022-10-27', '139', '76', '5'),
	('26', '12', '2023-02-25', '5', '148', '5'),
	('27', '12', '2023-02-25', '5', '91', '7'),
	('28', '12', '2023-02-25', '5', '125', '2'),
	('29', '13', '2022-07-24', '107', '45', '5'),
	('30', '13', '2022-07-24', '107', '94', '9'),
	('31', '14', '2022-08-18', '134', '38', '9'),
	('32', '14', '2022-08-18', '134', '125', '7'),
	('33', '14', '2022-08-18', '134', '105', '7'),
	('34', '14', '2022-08-18', '134', '162', '5'),
	('35', '15', '2022-12-03', '99', '15', '7'),
	('36', '15', '2022-12-03', '99', '81', '6'),
	('37', '16', '2023-04-11', '151', '114', '2'),
	('38', '17', '2023-05-27', '35', '86', '9'),
	('39', '17', '2023-05-27', '35', '133', '9'),
	('40', '18', '2023-02-16', '75', '101', '5'),
	('41', '18', '2023-02-16', '75', '112', '5'),
	('42', '18', '2023-02-16', '75', '41', '8'),
	('43', '18', '2023-02-16', '75', '159', '6'),
	('44', '19', '2022-08-30', '121', '22', '5'),
	('45', '19', '2022-08-30', '121', '90', '6'),
	('46', '20', '2022-07-26', '97', '29', '2'),
	('47', '20', '2022-07-26', '97', '39', '6'),
	('48', '21', '2023-07-08', '8', '46', '9'),
	('49', '21', '2023-07-08', '8', '110', '6'),
	('50', '21', '2023-07-08', '8', '40', '4'),
	('51', '22', '2022-08-27', '18', '151', '8'),
	('52', '22', '2022-08-27', '18', '122', '1'),
	('53', '22', '2022-08-27', '18', '31', '9'),
	('54', '23', '2022-09-16', '157', '17', '4'),
	('55', '23', '2022-09-16', '157', '123', '1'),
	('56', '23', '2022-09-16', '157', '27', '3'),
	('57', '23', '2022-09-16', '157', '77', '8'),
	('58', '24', '2022-09-27', '106', '131', '2'),
	('59', '24', '2022-09-27', '106', '25', '10'),
	('60', '25', '2023-04-05', '45', '145', '4'),
	('61', '25', '2023-04-05', '45', '11', '2'),
	('62', '26', '2022-10-19', '105', '105', '7'),
	('63', '26', '2022-10-19', '105', '161', '5'),
	('64', '26', '2022-10-19', '105', '75', '8'),
	('65', '26', '2022-10-19', '105', '24', '6'),
	('66', '26', '2022-10-19', '105', '93', '8'),
	('67', '27', '2022-11-05', '127', '132', '1'),
	('68', '27', '2022-11-05', '127', '145', '3'),
	('69', '27', '2022-11-05', '127', '132', '6'),
	('70', '28', '2023-05-01', '167', '77', '8'),
	('71', '28', '2023-05-01', '167', '168', '7'),
	('72', '28', '2023-05-01', '167', '101', '5'),
	('73', '28', '2023-05-01', '167', '126', '1'),
	('74', '29', '2023-07-02', '68', '6', '6'),
	('75', '29', '2023-07-02', '68', '149', '10'),
	('76', '29', '2023-07-02', '68', '103', '9'),
	('77', '30', '2022-11-07', '100', '43', '3'),
	('78', '30', '2022-11-07', '100', '75', '5'),
	('79', '30', '2022-11-07', '100', '65', '5'),
	('80', '31', '2022-08-19', '47', '120', '5'),
	('81', '32', '2022-10-02', '142', '113', '1'),
	('82', '32', '2022-10-02', '142', '64', '10'),
	('83', '33', '2023-03-13', '164', '128', '3'),
	('84', '34', '2023-01-10', '22', '141', '2'),
	('85', '34', '2023-01-10', '22', '110', '10'),
	('86', '34', '2023-01-10', '22', '106', '8'),
	('87', '34', '2023-01-10', '22', '45', '2'),
	('88', '35', '2022-10-26', '6', '88', '7'),
	('89', '35', '2022-10-26', '6', '79', '1'),
	('90', '35', '2022-10-26', '6', '9', '8'),
	('91', '35', '2022-10-26', '6', '132', '2'),
	('92', '36', '2023-06-18', '115', '166', '2'),
	('93', '36', '2023-06-18', '115', '21', '7'),
	('94', '36', '2023-06-18', '115', '98', '6'),
	('95', '37', '2023-06-07', '117', '43', '4'),
	('96', '37', '2023-06-07', '117', '82', '6'),
	('97', '37', '2023-06-07', '117', '125', '8'),
	('98', '38', '2022-08-24', '132', '143', '5'),
	('99', '38', '2022-08-24', '132', '90', '5'),
	('100', '39', '2022-09-23', '85', '141', '2'),
	('101', '39', '2022-09-23', '85', '167', '8'),
	('102', '39', '2022-09-23', '85', '76', '2'),
	('103', '40', '2022-09-18', '86', '155', '9'),
	('104', '40', '2022-09-18', '86', '133', '8'),
	('105', '40', '2022-09-18', '86', '141', '8'),
	('106', '41', '2023-05-08', '135', '118', '2'),
	('107', '41', '2023-05-08', '135', '86', '4'),
	('108', '41', '2023-05-08', '135', '166', '4'),
	('109', '42', '2023-03-27', '145', '50', '9'),
	('110', '42', '2023-03-27', '145', '65', '5'),
	('111', '43', '2022-08-16', '122', '28', '3'),
	('112', '44', '2022-09-04', '140', '123', '6'),
	('113', '44', '2022-09-04', '140', '36', '4'),
	('114', '44', '2022-09-04', '140', '160', '6'),
	('115', '44', '2022-09-04', '140', '62', '9'),
	('116', '46', '2022-09-03', '55', '77', '1'),
	('117', '46', '2022-09-03', '55', '59', '5'),
	('118', '46', '2022-09-03', '55', '5', '9'),
	('119', '47', '2023-05-09', '60', '20', '6'),
	('120', '47', '2023-05-09', '60', '118', '1'),
	('121', '47', '2023-05-09', '60', '116', '2'),
	('122', '47', '2023-05-09', '60', '100', '8'),
	('123', '47', '2023-05-09', '60', '64', '1'),
	('124', '48', '2023-02-11', '52', '13', '1'),
	('125', '48', '2023-02-11', '52', '83', '6'),
	('126', '49', '2023-04-24', '149', '121', '8'),
	('127', '49', '2023-04-24', '149', '104', '6'),
	('128', '50', '2023-01-02', '99', '10', '4'),
	('129', '50', '2023-01-02', '99', '75', '8'),
	('130', '50', '2023-01-02', '99', '14', '5'),
	('131', '50', '2023-01-02', '99', '146', '7'),
	('132', '51', '2022-08-01', '164', '81', '6'),
	('133', '51', '2022-08-01', '164', '28', '6'),
	('134', '51', '2022-08-01', '164', '26', '4'),
	('135', '53', '2022-07-22', '108', '101', '8'),
	('136', '54', '2023-04-13', '3', '149', '5'),
	('137', '54', '2023-04-13', '3', '135', '3'),
	('138', '55', '2022-10-22', '46', '9', '7'),
	('139', '56', '2022-11-17', '80', '124', '4'),
	('140', '57', '2022-12-06', '4', '99', '9'),
	('141', '58', '2023-03-26', '98', '111', '7'),
	('142', '58', '2023-03-26', '98', '99', '10'),
	('143', '59', '2023-07-09', '48', '140', '9'),
	('144', '59', '2023-07-09', '48', '46', '4'),
	('145', '59', '2023-07-09', '48', '28', '9'),
	('146', '59', '2023-07-09', '48', '120', '3'),
	('147', '60', '2023-02-14', '128', '29', '6'),
	('148', '60', '2023-02-14', '128', '72', '9'),
	('149', '61', '2022-11-10', '6', '39', '3'),
	('150', '61', '2022-11-10', '6', '28', '1');
   
   INSERT INTO Pago (id, monto, fecha, total, Pedido_id, metodo_id) VALUES
	('1', '362', '2023-03-22', '8309', '70', '3'),
	('2', '1866', '2022-09-14', '436', '93', '1'),
	('3', '727', '2022-07-19', '5812', '63', '3'),
	('4', '1471', '2022-11-18', '101', '125', '5'),
	('5', '401', '2023-06-27', '7589', '102', '3'),
	('6', '100', '2023-05-28', '1413', '4', '1'),
	('7', '1263', '2023-02-23', '8115', '7', '2'),
	('8', '1394', '2022-11-24', '7265', '62', '2'),
	('9', '178', '2023-04-17', '10211', '142', '3'),
	('10', '1114', '2022-09-21', '4371', '80', '2'),
	('11', '1336', '2023-04-28', '10709', '119', '5'),
	('12', '528', '2022-09-03', '11727', '5', '1'),
	('13', '459', '2023-06-04', '2951', '75', '3'),
	('14', '2153', '2022-10-05', '8769', '135', '3'),
	('15', '1137', '2023-06-03', '4655', '144', '2'),
	('16', '2198', '2022-10-20', '6144', '4', '1'),
	('17', '2137', '2023-04-14', '6898', '49', '1'),
	('18', '885', '2022-08-24', '10913', '87', '5'),
	('19', '577', '2022-09-17', '7139', '122', '5'),
	('20', '1604', '2022-09-11', '3661', '72', '2'),
	('21', '236', '2023-04-10', '4181', '33', '1'),
	('22', '2030', '2022-08-07', '903', '133', '5'),
	('23', '87', '2023-03-31', '10379', '10', '3'),
	('24', '1322', '2023-01-20', '10495', '135', '1'),
	('25', '211', '2023-07-01', '7130', '21', '3'),
	('26', '872', '2023-05-09', '4366', '8', '1'),
	('27', '979', '2022-10-03', '6726', '110', '2'),
	('28', '991', '2023-05-28', '8634', '146', '5'),
	('29', '1863', '2022-10-08', '6889', '143', '4'),
	('30', '1411', '2023-04-25', '10566', '104', '4'),
	('31', '1740', '2022-09-28', '2618', '105', '5'),
	('32', '877', '2023-04-14', '4846', '9', '3'),
	('33', '1019', '2022-12-27', '6439', '30', '2'),
	('34', '2169', '2022-10-23', '3330', '60', '3'),
	('35', '1467', '2022-07-21', '9935', '48', '2'),
	('36', '1034', '2023-01-08', '3330', '20', '1'),
	('37', '976', '2022-07-23', '11850', '148', '5'),
	('38', '397', '2023-06-23', '2281', '127', '5'),
	('39', '1403', '2022-11-22', '2592', '106', '4'),
	('40', '1489', '2023-03-15', '10740', '117', '2'),
	('41', '717', '2022-10-16', '7789', '146', '2'),
	('42', '1556', '2023-04-13', '10040', '7', '3'),
	('43', '2168', '2022-12-01', '10988', '123', '3'),
	('44', '2097', '2023-05-11', '521', '52', '3'),
	('45', '973', '2023-05-10', '8655', '82', '1'),
	('46', '1535', '2022-08-10', '9984', '112', '1'),
	('47', '1119', '2023-04-08', '7055', '19', '4'),
	('48', '1287', '2023-02-10', '3553', '54', '1'),
	('49', '1296', '2023-06-04', '225', '44', '1'),
	('50', '1069', '2022-09-01', '437', '28', '3'),
	('51', '1985', '2023-06-28', '9596', '108', '2'),
	('52', '140', '2023-03-15', '10178', '106', '5'),
	('53', '1114', '2023-03-13', '6398', '119', '3'),
	('54', '1874', '2022-12-31', '2563', '98', '1'),
	('55', '635', '2023-05-21', '6645', '130', '5'),
	('56', '1327', '2023-01-02', '7694', '15', '4'),
	('57', '1288', '2022-10-18', '10974', '97', '4'),
	('58', '855', '2023-02-15', '5909', '71', '5'),
	('59', '811', '2022-08-20', '8938', '66', '3'),
	('60', '928', '2022-08-18', '9723', '100', '2'),
	('61', '1833', '2023-01-05', '2040', '98', '4'),
	('62', '1028', '2022-09-12', '6031', '131', '2'),
	('63', '2188', '2023-05-15', '8228', '29', '2'),
	('64', '1274', '2023-06-11', '8007', '38', '5'),
	('65', '652', '2023-05-25', '10842', '17', '5'),
	('66', '762', '2023-01-29', '7181', '136', '2'),
	('67', '910', '2023-05-04', '9718', '144', '1'),
	('68', '274', '2022-07-31', '8927', '137', '5'),
	('69', '2071', '2022-11-21', '6255', '71', '5'),
	('70', '2040', '2022-11-15', '10327', '106', '5'),
	('71', '1293', '2023-04-29', '1535', '66', '3'),
	('72', '991', '2023-06-25', '8376', '97', '4'),
	('73', '652', '2022-12-01', '4672', '82', '2'),
	('74', '165', '2022-08-13', '1394', '46', '2'),
	('75', '1207', '2022-12-19', '11831', '118', '1'),
	('76', '1766', '2023-05-01', '5169', '15', '4'),
	('77', '1408', '2022-09-09', '4413', '3', '5'),
	('78', '1264', '2022-08-26', '11234', '40', '2'),
	('79', '1536', '2023-01-20', '3760', '7', '4'),
	('80', '2050', '2023-04-18', '2578', '134', '2'),
	('81', '971', '2022-08-27', '1289', '81', '4'),
	('82', '721', '2022-07-30', '8845', '20', '3'),
	('83', '2146', '2023-04-29', '765', '146', '4'),
	('84', '650', '2022-10-24', '3302', '21', '1'),
	('85', '570', '2022-08-10', '11894', '121', '2'),
	('86', '997', '2023-05-27', '2994', '86', '3'),
	('87', '1090', '2022-07-15', '1017', '35', '4'),
	('88', '662', '2022-10-08', '11001', '106', '1'),
	('89', '279', '2022-12-13', '8756', '112', '3'),
	('90', '1613', '2023-03-27', '10823', '27', '3'),
	('91', '2112', '2022-07-21', '2780', '5', '3'),
	('92', '1604', '2022-12-18', '809', '77', '2'),
	('93', '999', '2022-07-28', '10254', '83', '1'),
	('94', '1056', '2023-04-14', '347', '149', '4'),
	('95', '1660', '2022-10-19', '10565', '16', '1'),
	('96', '543', '2023-02-10', '10699', '98', '4'),
	('97', '2145', '2023-04-16', '5191', '132', '1'),
	('98', '358', '2022-10-03', '10994', '79', '2'),
	('99', '1820', '2023-06-30', '6062', '34', '5'),
	('100', '137', '2023-02-01', '2656', '128', '4'),
	('101', '126', '2022-07-14', '883', '114', '4'),
	('102', '1532', '2023-03-19', '5706', '37', '3'),
	('103', '1174', '2022-12-30', '972', '84', '3'),
	('104', '2140', '2022-10-11', '142', '141', '5'),
	('105', '1850', '2023-04-20', '953', '111', '1'),
	('106', '1819', '2022-07-29', '1910', '16', '3'),
	('107', '203', '2022-11-15', '2128', '116', '5'),
	('108', '1434', '2022-08-22', '10474', '60', '2'),
	('109', '382', '2022-10-14', '10032', '24', '5'),
	('110', '781', '2023-03-16', '1318', '126', '2'),
	('111', '2033', '2022-08-14', '8180', '138', '2'),
	('112', '1950', '2022-11-07', '2856', '58', '4'),
	('113', '633', '2022-12-27', '11961', '58', '3'),
	('114', '1030', '2023-01-27', '11292', '27', '5'),
	('115', '1000', '2023-05-15', '9766', '106', '3'),
	('116', '799', '2022-11-02', '1586', '8', '3'),
	('117', '1575', '2022-09-17', '6504', '64', '1'),
	('118', '2005', '2022-12-13', '2464', '74', '5'),
	('119', '992', '2022-12-11', '5625', '73', '3'),
	('120', '2192', '2023-05-18', '8930', '130', '5'),
	('121', '733', '2022-11-26', '673', '126', '5'),
	('122', '1332', '2023-07-05', '3349', '2', '3'),
	('123', '1606', '2022-09-11', '5340', '62', '1'),
	('124', '182', '2022-09-27', '7902', '145', '3'),
	('125', '1543', '2023-01-07', '4454', '142', '2'),
	('126', '688', '2022-11-30', '4314', '111', '2'),
	('127', '280', '2022-11-30', '6874', '132', '4'),
	('128', '1298', '2022-07-25', '5091', '31', '4'),
	('129', '1910', '2023-03-20', '10742', '54', '4'),
	('130', '1757', '2022-07-30', '11422', '8', '4'),
	('131', '1930', '2022-12-24', '11375', '115', '5'),
	('132', '1071', '2022-10-08', '7990', '30', '2'),
	('133', '679', '2022-11-28', '6170', '69', '3'),
	('134', '1570', '2023-05-19', '4643', '136', '5'),
	('135', '1753', '2022-08-12', '7739', '85', '4'),
	('136', '807', '2022-11-01', '11308', '98', '2'),
	('137', '379', '2023-01-01', '5986', '146', '5'),
	('138', '606', '2022-09-07', '6884', '50', '2'),
	('139', '1679', '2022-11-30', '11941', '144', '5'),
	('140', '846', '2023-05-13', '326', '5', '3'),
	('141', '1361', '2023-02-15', '6183', '31', '5'),
	('142', '647', '2022-08-05', '9532', '149', '5'),
	('143', '1515', '2023-03-01', '4346', '107', '1'),
	('144', '1922', '2023-02-04', '11500', '30', '5'),
	('145', '461', '2022-12-08', '4615', '71', '3'),
	('146', '1307', '2022-10-31', '11669', '18', '3'),
	('147', '1718', '2023-04-04', '3020', '70', '2'),
	('148', '1481', '2022-08-17', '5120', '38', '5'),
	('149', '795', '2022-09-11', '7194', '39', '1'),
	('150', '1522', '2023-03-02', '9807', '133', '1');
   
 INSERT INTO Envio (id, fecha, Envio_estado, Pedido_id) VALUES

    ('1', '2022-10-21', 'Recibido', '13'),
	('2', '2023-07-01', 'Completado', '14'),
	('3', '2023-03-19', 'Recibido', '15'),
	('4', '2023-01-02', 'Recibido', '16'),
	('5', '2023-05-14', 'Completado', '17'),
	('6', '2023-04-30', 'En preparación', '18'),
	('7', '2022-07-26', 'Recibido', '19'),
	('8', '2022-07-16', 'Enviado', '20'),
	('9', '2022-12-30', 'Enviado', '21'),
	('10', '2022-12-01', 'Recibido', '22'),
	('11', '2022-12-04', 'En preparación', '23'),
	('12', '2023-06-09', 'Completado', '24'),
	('13', '2023-01-29', 'Recibido', '25'),
	('14', '2022-08-30', 'Enviado', '26'),
	('15', '2022-09-03', 'Recibido', '27'),
	('16', '2022-12-01', 'En preparación', '28'),
	('17', '2023-05-13', 'Completado', '29'),
	('18', '2023-04-14', 'En preparación', '30'),
	('19', '2023-01-16', 'Completado', '31'),
	('20', '2023-05-12', 'Completado', '32'),
	('21', '2023-03-09', 'Enviado', '33'),
	('22', '2022-12-16', 'Completado', '34'),
	('23', '2022-08-06', 'Completado', '35'),
	('24', '2022-12-25', 'Recibido', '36'),
	('25', '2023-06-09', 'Completado', '37'),
	('26', '2022-12-11', 'En preparación', '38'),
	('27', '2022-10-26', 'Recibido', '39'),
	('28', '2022-12-24', 'Enviado', '40'),
	('29', '2022-11-18', 'Completado', '41'),
	('30', '2022-08-01', 'Enviado', '42'),
	('31', '2022-09-18', 'Enviado', '43'),
	('32', '2023-02-08', 'Completado', '44'),
	('33', '2023-03-14', 'Recibido', '45'),
	('34', '2023-01-24', 'Recibido', '46'),
	('35', '2023-05-01', 'Completado', '47'),
	('36', '2023-06-01', 'Enviado', '48'),
	('37', '2022-09-24', 'Recibido', '49'),
	('38', '2022-10-25', 'En preparación', '50'),
	('39', '2022-07-23', 'Completado', '51'),
	('40', '2022-11-08', 'Recibido', '52'),
	('41', '2023-05-28', 'Enviado', '53'),
	('42', '2022-07-14', 'Enviado', '54'),
	('43', '2022-09-13', 'Enviado', '55'),
	('44', '2023-04-12', 'Completado', '56'),
	('45', '2022-07-21', 'En preparación', '57'),
	('46', '2022-08-04', 'En preparación', '58'),
	('47', '2023-07-01', 'En preparación', '59'),
	('48', '2022-11-23', 'Recibido', '60'),
	('49', '2023-05-26', 'Recibido', '61'),
	('50', '2023-05-11', 'Recibido', '62'),
	('51', '2022-12-27', 'Completado', '63'),
	('52', '2023-03-09', 'En preparación', '64'),
	('53', '2022-11-19', 'Recibido', '65'),
	('54', '2022-10-06', 'Recibido', '66'),
	('55', '2023-02-16', 'Enviado', '67'),
	('56', '2023-05-15', 'Recibido', '68'),
	('57', '2023-05-02', 'Recibido', '69'),
	('58', '2022-07-26', 'Enviado', '70'),
	('59', '2023-07-12', 'En preparación', '71'),
	('60', '2023-05-10', 'Enviado', '72'),
	('61', '2023-06-23', 'En preparación', '73'),
	('62', '2022-11-10', 'Completado', '74'),
	('63', '2022-09-25', 'Recibido', '75'),
	('64', '2022-11-07', 'En preparación', '76'),
	('65', '2022-10-09', 'En preparación', '77'),
	('66', '2023-07-02', 'Enviado', '78'),
	('67', '2023-04-17', 'Completado', '79'),
	('68', '2023-04-21', 'En preparación', '80'),
	('69', '2023-02-27', 'Completado', '81'),
	('70', '2023-05-27', 'Recibido', '82'),
	('71', '2023-05-05', 'Recibido', '83'),
	('72', '2022-10-17', 'En preparación', '84'),
	('73', '2023-06-17', 'Enviado', '85'),
	('74', '2023-02-07', 'En preparación', '86'),
	('75', '2023-06-19', 'Completado', '87'),
	('76', '2022-07-23', 'Recibido', '88'),
	('77', '2023-06-17', 'Enviado', '89'),
	('78', '2022-09-06', 'En preparación', '90'),
	('79', '2023-02-09', 'Enviado', '91'),
	('80', '2022-10-16', 'Recibido', '92'),
	('81', '2022-08-15', 'En preparación', '93'),
	('82', '2022-11-15', 'Completado', '94'),
	('83', '2022-09-28', 'Recibido', '95'),
	('84', '2023-02-17', 'En preparación', '96'),
	('85', '2022-08-30', 'Completado', '97'),
	('86', '2022-11-14', 'Recibido', '98'),
	('87', '2022-11-01', 'Enviado', '99'),
	('88', '2023-01-02', 'En preparación', '100'),
	('89', '2023-06-24', 'Enviado', '101'),
	('90', '2022-08-21', 'Enviado', '102'),
	('91', '2022-08-17', 'Recibido', '103'),
	('92', '2022-07-17', 'Enviado', '104'),
	('93', '2022-07-22', 'Recibido', '105'),
	('94', '2023-02-09', 'En preparación', '106'),
	('95', '2022-08-23', 'En preparación', '107'),
	('96', '2022-12-31', 'Completado', '108'),
	('97', '2023-03-03', 'Enviado', '109'),
	('98', '2023-03-30', 'Enviado', '110'),
	('99', '2022-08-27', 'En preparación', '111'),
	('100', '2023-03-25', 'En preparación', '112'),
	('101', '2022-10-30', 'Recibido', '113'),
	('102', '2023-04-07', 'Enviado', '114'),
	('103', '2022-08-25', 'Enviado', '115'),
	('104', '2023-05-21', 'En preparación', '116'),
	('105', '2022-09-08', 'Completado', '117'),
	('106', '2022-07-26', 'Recibido', '118'),
	('107', '2023-05-07', 'En preparación', '119'),
	('108', '2022-09-14', 'Recibido', '120'),
	('109', '2023-07-08', 'Enviado', '121'),
	('110', '2023-06-30', 'Recibido', '122'),
	('111', '2023-07-01', 'En preparación', '123'),
	('112', '2022-08-26', 'En preparación', '124'),
	('113', '2023-01-20', 'Enviado', '125'),
	('114', '2022-12-30', 'Enviado', '126'),
	('115', '2022-07-20', 'En preparación', '127'),
	('116', '2023-06-11', 'Completado', '128'),
	('117', '2023-03-03', 'Enviado', '129'),
	('118', '2023-03-13', 'En preparación', '130'),
	('119', '2023-03-11', 'Enviado', '131'),
	('120', '2022-07-30', 'En preparación', '132'),
	('121', '2022-12-10', 'Enviado', '133'),
	('122', '2023-01-27', 'En preparación', '134'),
	('123', '2022-09-01', 'En preparación', '135'),
	('124', '2023-01-24', 'Enviado', '136'),
	('125', '2023-03-11', 'Completado', '137'),
	('126', '2023-05-28', 'Recibido', '138'),
	('127', '2023-04-19', 'Recibido', '139'),
	('128', '2023-04-01', 'Recibido', '140'),
	('129', '2023-06-09', 'Recibido', '141'),
	('130', '2023-05-25', 'Completado', '142'),
	('131', '2023-06-22', 'En preparación', '143'),
	('132', '2023-04-04', 'Completado', '144'),
	('133', '2022-08-21', 'Recibido', '145'),
	('134', '2022-08-19', 'Enviado', '146'),
	('135', '2022-11-06', 'Enviado', '147'),
	('136', '2022-11-25', 'Enviado', '148'),
	('137', '2022-07-18', 'En preparación', '149'),
	('138', '2022-11-29', 'Completado', '150');
	
  
INSERT INTO Envio_Usuario (id, fecha, envio_id, usuario_id) VALUES
	('1', '2022-12-07', '44', '88'),
	('2', '2022-09-29', '9', '146'),
	('3', '2022-11-17', '46', '28'),
	('4', '2022-09-24', '37', '133'),
	('5', '2023-03-25', '50', '91'),
	('6', '2023-03-18', '71', '13'),
	('7', '2022-09-07', '51', '113'),
	('8', '2022-09-19', '92', '67'),
	('9', '2022-07-30', '9', '161'),
	('10', '2023-01-29', '120', '58'),
	('11', '2022-09-04', '103', '95'),
	('12', '2023-06-22', '81', '39'),
	('13', '2022-09-22', '108', '67'),
	('14', '2023-03-13', '7', '79'),
	('15', '2022-12-17', '111', '122'),
	('16', '2023-01-13', '115', '101'),
	('17', '2022-11-22', '65', '150'),
	('18', '2022-10-08', '54', '55'),
	('19', '2023-05-08', '22', '17'),
	('20', '2022-10-12', '15', '72'),
	('21', '2022-08-11', '38', '26'),
	('22', '2023-01-15', '83', '135'),
	('23', '2023-03-20', '37', '90'),
	('24', '2022-10-30', '95', '56'),
	('25', '2023-06-09', '17', '104'),
	('26', '2022-09-26', '15', '41'),
	('27', '2023-03-17', '53', '153'),
	('28', '2023-04-03', '104', '118'),
	('29', '2023-06-19', '17', '121'),
	('30', '2023-06-19', '46', '137'),
	('31', '2023-03-16', '16', '58'),
	('32', '2022-08-04', '103', '99'),
	('33', '2022-09-04', '136', '60'),
	('34', '2022-07-24', '67', '89'),
	('35', '2022-08-18', '16', '126'),
	('36', '2023-03-28', '127', '96'),
	('37', '2023-01-19', '26', '136'),
	('38', '2023-05-26', '93', '37'),
	('39', '2022-10-05', '11', '132'),
	('40', '2022-09-04', '104', '73'),
	('41', '2023-04-28', '131', '142'),
	('42', '2022-07-24', '1', '15'),
	('43', '2023-06-29', '21', '32'),
	('44', '2022-09-15', '129', '54'),
	('45', '2023-03-16', '17', '134'),
	('46', '2023-03-05', '48', '78'),
	('47', '2023-04-25', '136', '72'),
	('48', '2022-11-17', '60', '9'),
	('49', '2022-12-16', '82', '46'),
	('50', '2023-02-04', '54', '24'),
	('51', '2023-03-08', '73', '122'),
	('52', '2023-05-31', '33', '40'),
	('53', '2023-03-31', '36', '87'),
	('54', '2022-11-28', '28', '1'),
	('55', '2023-01-21', '92', '76'),
	('56', '2022-08-17', '119', '15'),
	('57', '2023-04-18', '6', '88'),
	('58', '2023-05-31', '24', '11'),
	('59', '2023-03-25', '1', '64'),
	('60', '2023-04-11', '86', '101'),
	('61', '2023-02-19', '86', '6'),
	('62', '2023-06-14', '138', '14'),
	('63', '2023-06-28', '13', '19'),
	('64', '2023-01-27', '21', '121'),
	('65', '2023-04-02', '26', '80'),
	('66', '2022-10-09', '64', '145'),
	('67', '2023-07-12', '36', '147'),
	('68', '2022-09-21', '95', '23'),
	('69', '2023-01-20', '20', '133'),
	('70', '2022-11-11', '64', '86'),
	('71', '2023-07-01', '102', '57'),
	('72', '2022-09-11', '54', '37'),
	('73', '2022-12-05', '44', '41'),
	('74', '2023-05-18', '86', '11'),
	('75', '2023-01-16', '129', '7'),
	('76', '2023-06-18', '18', '155'),
	('77', '2023-01-11', '59', '16'),
	('78', '2023-05-27', '100', '155'),
	('79', '2023-06-02', '127', '41'),
	('80', '2023-03-11', '103', '104'),
	('81', '2023-07-18', '88', '168'),
	('82', '2022-09-26', '103', '5'),
	('83', '2023-01-09', '14', '5'),
	('84', '2023-07-05', '35', '10'),
	('85', '2023-06-13', '18', '76'),
	('86', '2023-05-07', '87', '63'),
	('87', '2023-01-15', '56', '39'),
	('88', '2022-11-27', '23', '35'),
	('89', '2023-07-10', '82', '142'),
	('90', '2023-04-14', '104', '163'),
	('91', '2023-05-20', '22', '105'),
	('92', '2023-04-24', '75', '133'),
	('93', '2023-02-02', '79', '3'),
	('94', '2022-10-12', '57', '107'),
	('95', '2022-10-15', '77', '82'),
	('96', '2022-09-09', '8', '150'),
	('97', '2022-10-05', '59', '111'),
	('98', '2023-04-05', '53', '164'),
	('99', '2023-01-30', '88', '120'),
	('100', '2022-12-23', '7', '124');
    
      #----- CREACION DE VISTAS -----#

# Vista de los usuario que compran por el sitio WEB, para enviarles ofertas o descuentos via pop up, en el sitio o email marketing 
CREATE VIEW V_Usuario_Modalidad_Web AS
SELECT Modalidad.tipo_modalidad, Usuario.id, Usuario.nombre, Usuario.telefono,Usuario.mail 
FROM Modalidad, Usuario
WHERE tipo_modalidad = 'Web'; 

SELECT * FROM 01_MyMarket_TF.v_usuario_modalidad_web;

# Vista con los productos por encima del precio promedio 
CREATE VIEW V_Producto_precio_promedio AS
SELECT Producto_nombre, Producto_precio,Producto_proveedor
FROM Productos
WHERE Producto_precio > (SELECT AVG(Producto_precio) FROM Productos); 

SELECT * FROM 01_MyMarket_TF.v_producto_precio_promedio;


# Vista con los nombres y telefonos de usuarios y la fecha de sus pedidos 
CREATE VIEW V_fecha_pedidos_usuario
AS SELECT u.nombre, u.telefono, p.fecha
FROM Usuario u
INNER JOIN Pedido p ON u.id=p.Usuario_id;

SELECT * FROM 01_MyMarket_TF.v_fecha_pedidos_usuario;

# Vista con los productos sin ventas en 2023, para corregir precios o lanzar campañas de descuentos
CREATE VIEW v_productos_sin_ventas_2023 AS
SELECT p.id, p.Producto_nombre
FROM Productos p
LEFT JOIN Pedido pe ON p.id = pe.productos_id
WHERE YEAR(pe.fecha) > 2023 OR pe.fecha IS NULL;

SELECT * FROM 01_MyMarket_TF.v_productos_sin_ventas_2023;

# Vista con los productos mas vendidos en 2022
CREATE VIEW v_productos_mas_vendidos_2022 AS
SELECT pe.productos_id, p.Producto_nombre, pe.cantidad
FROM Pedido pe
JOIN Productos p ON pe.productos_id = p.id
WHERE YEAR(pe.fecha) = 2022
ORDER BY pe.cantidad DESC;

SELECT * FROM 01_MyMarket_TF.v_productos_mas_vendidos_2022;



#----- CREACION DE FUNCIONES ----- # 

# FUNCION Obtener Cantidad Envios Pendiente
DELIMITER //
CREATE FUNCTION Func_EnviosEnPreparacion() RETURNS float
deterministic
BEGIN
    DECLARE cantidad_envios_pendientes INT;
    SELECT COUNT(*) INTO cantidad_envios_pendientes
    FROM Envio
    WHERE Envio_estado = 'En preparacion';
    RETURN cantidad_envios_pendientes;
END; //
DELIMITER ;


# FUNCION Obtener Cantidad PEDIDOS POR USUARIO, para sabercuales estan comprando mas
DELIMITER //
CREATE FUNCTION Func_PedidosxUsuarios (usuarioid INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE cantidad_pedidos INT;
    SELECT COUNT(*) INTO cantidad_pedidos
    FROM Pedido
    WHERE usuario_id = usuarioid;
    RETURN cantidad_pedidos;
END; //
DELIMITER ;


# FUNCION obtener el precio promedio de los productos de una categoria, para verificar costos y ajustar por inflacion 
DELIMITER //
CREATE FUNCTION Func_PrecioPromedioxCategoria(categoriaid INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precio_promedio DECIMAL(10, 2);
    SELECT AVG(Producto_precio) INTO precio_promedio
    FROM Productos
    WHERE categoria_id = categoriaid;
    RETURN precio_promedio;
END; //
DELIMITER ;


# FUNCION Obtener Categoria más costosa
DELIMITER //
CREATE FUNCTION Func_CategoriaMasCostosa() RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE categoria_nombre VARCHAR(50);
    SELECT c.categoria INTO categoria_nombre
    FROM categoria c
    INNER JOIN Productos p ON c.id = p.id
    GROUP BY c.categoria
    ORDER BY SUM(p.Producto_precio) DESC
    LIMIT 1;
    RETURN categoria_nombre;
END; //
DELIMITER ;

# FUNCION Obtener Categoria más Vendida
DELIMITER //
CREATE FUNCTION Func_CategoriaMasVendida()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE categoriaMasVendida VARCHAR(50);
    
    SELECT c.categoria INTO categoriaMasVendida
    FROM Categoria c
    JOIN Productos p ON c.id = p.Categoria_id
    JOIN Pedido pe ON p.id = pe.productos_id
    GROUP BY c.categoria
    ORDER BY SUM(pe.cantidad) DESC
    LIMIT 1;
    
    RETURN categoriaMasVendida;
END//
DELIMITER ;


#----- STORED PROCEDURES -----#

# S.P ver productos, marca y precios superios a una cifra 
Delimiter //
 create procedure SP_precios_producto(
   in Monto_Precio_Producto decimal(6,2))
 begin
   select Producto_nombre,Producto_marca,Producto_precio
     from Productos
     where Producto_precio>=Monto_Precio_Producto;
 end //
Delimiter ;


# S:P Insertar nuevas categorias de productos
DELIMITER $$
CREATE PROCEDURE SP_insert_nueva_categoria (IN field CHAR(20), OUT output VARCHAR(50))
BEGIN
	IF field <> '' THEN
		INSERT INTO Categoria (categoria) VALUES (UCASE(field));
        SET output = 'Inserción exitosa';
	ELSE
		SET output = 'ERROR: no se pudo crear la categoria indicado';
	END IF;
    
    SET @clausula = 'SELECT * FROM Categoria ORDER BY id DESC ';
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;

END
$$
Delimiter ;

# S:P Ordenar Envios por Estado
DELIMITER $$
CREATE PROCEDURE SP_ordenar_Envios_por_Estado(IN Estado_del_envio VARCHAR(25))
BEGIN
    SET @clausula = CONCAT ('SELECT * FROM Envio ORDER BY Envio_estado');
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END
$$
 delimiter ;

# S:P Aumentar un 10% los Precios de los productos de un Proveedor
DELIMITER $$
CREATE PROCEDURE SP_Aumentar_PreciosProveedor (IN proveedor VARCHAR(100))
BEGIN
    UPDATE Productos
    SET Producto_precio = Producto_precio * 1.1
    WHERE Producto_proveedor = proveedor;
END
 $$

 DELIMITER ;
 # test 
select Producto_proveedor, producto_precio from Productos;


#---___--- TRIGGERS ---___---#
SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE productos_old(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    Producto_nombre VARCHAR(100) NOT NULL,
    Categoria_id INT NOT NULL,
    Producto_marca VARCHAR(100) NOT NULL,
    Producto_proveedor VARCHAR(100) NOT NULL,
    Producto_precio DECIMAL(10, 2) NOT NULL,
    borrado_por VARCHAR(100) NOT NULL,
    fecha_borrado DATETIME NOT NULL);
    

# -  TRIGGER Crea un registro en la carpeta Productos_old, al eliminarse un producto de la tabla Productos - #   

DELIMITER //
CREATE TRIGGER backup_eliminar_producto
AFTER DELETE ON Productos
FOR EACH ROW
BEGIN
 DECLARE username VARCHAR(50);
 DECLARE fecha_hora DATETIME;   
    SELECT CURRENT_USER() INTO username;
    SET fecha_hora = CURRENT_TIMESTAMP();
    
    INSERT INTO productos_old (id, Producto_nombre, Categoria_id, Producto_marca, Producto_proveedor, Producto_precio, borrado_por,fecha_borrado)
    VALUES (OLD.id, OLD.producto_nombre, OLD.Categoria_id, OLD.Producto_marca, OLD.Producto_proveedor, OLD.Producto_precio , username, fecha_hora);
END //

DELIMITER ;
#--------------------------------------------------------------------------------------------------------#

CREATE TABLE pedido_old(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, UNIQUE (id),
    Compra INT NOT NULL,
    fecha DATE NOT NULL,
	Usuario_id INT NOT NULL,
    productos_id INT NOT NULL,
    borrado_por VARCHAR(100) NOT NULL,
    fecha_borrado DATETIME NOT NULL);

# - TRIGGER Crea un registro en la carpeta pedido_old, al eliminarse un pedido de la tabla pedido y diciendo que usuario realizo el borrado - # 

DELIMITER //
CREATE TRIGGER backup_eliminar_pedido
AFTER DELETE ON Pedido
FOR EACH ROW
BEGIN
 DECLARE username VARCHAR(50);
 DECLARE fecha_hora DATETIME;   
    SELECT CURRENT_USER() INTO username;
    SET fecha_hora = CURRENT_TIMESTAMP();
    
    INSERT INTO pedido_old (id, compra, fecha, usuario_id, productos_id, borrado_por,fecha_borrado)
    VALUES (OLD.id, OLD.compra, OLD.fecha, OLD.usuario_id, OLD.productos_id, username, fecha_hora);
END //
DELIMITER ;
#--------------------------------------------------------------------------------------------------------#
 
# - TRIGGER  para evitar que se inserten datos duplicados en la tabla productos - # 
 
 DELIMITER //

CREATE TRIGGER prevent_products_duplicados
BEFORE INSERT ON Productos
FOR EACH ROW
BEGIN

IF EXISTS (SELECT 1 FROM productos WHERE Producto_nombre = NEW.Producto_nombre) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe.';
END IF;

END//

DELIMITER ;


