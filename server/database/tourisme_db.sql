create database tourisme;
use tourisme;

select * from destinos_turisticos;
select * from categoria_turistica;
select * from ubicacion;

CALL insertar_destino(1,'Parque Arví','Parque natural ideal para senderismo y picnic','Medellín','Medellín',1);

CALL insertar_destino(1,'Cerro El Volador','Cerro tutelar con miradores y senderos ecológicos','Medellín','Medellín',1);

CALL insertar_destino(1,'Parque Ecológico Piedras Blancas','Bosque natural con lagos y senderos','Medellín','Medellín',1);

CALL insertar_destino(1,'Reserva Natural La Honda','Reserva natural con cascadas y biodiversidad','Medellín','Medellín',1);

CALL insertar_destino(1,'Reserva Natural San Sebastián - La Castellana','Reserva ecológica urbana','Medellín','Medellín',1);

CALL insertar_destino(1,'Bosque de Niebla San Sebastián - La Castellana','Bosque natural para senderismo y observación','Medellín','Medellín',1);


CALL insertar_destino(2,'Mirador de Las Palmas','Vista panorámica de Medellín','Medellín','Medellín',1);

CALL insertar_destino(2,'Mirador del Cielo','Mirador con vista panorámica urbana','Medellín','Medellín',1);

CALL insertar_destino(2,'Mirador Cerro El Picacho','Uno de los puntos más altos de la ciudad','Medellín','Medellín',1);

CALL insertar_destino(2,'Mirador Cerro de Las Tres Cruces','Mirador popular para deportistas','Medellín','Medellín',1);

CALL insertar_destino(2,'Mirador La Asomadera','Mirador urbano tranquilo','Medellín','Medellín',1);

CALL insertar_destino(2,'Mirador San Javier','Mirador con vista a la Comuna 13','Medellín','Medellín',1);


CALL insertar_destino(3,'Museo de Antioquia Plaza Botero','Museo con obras de Fernando Botero','Medellín','Medellín',1);

CALL insertar_destino(3,'Museo Casa de la Memoria','Museo histórico sobre el conflicto en Colombia','Medellín','Medellín',1);

CALL insertar_destino(3,'Pueblito Paisa','Réplica de un pueblo tradicional antioqueño','Medellín','Medellín',1);

CALL insertar_destino(3,'Catedral Basílica Metropolitana','Iglesia histórica de gran valor arquitectónico','Medellín','Medellín',1);

CALL insertar_destino(3,'Centro Museo San Pedro','Cementerio museo con valor histórico','Medellín','Medellín',1);


CALL insertar_destino(4,'Ciclovía Medellín','Espacios dominicales para ciclismo y deporte','Medellín','Medellín',1);

CALL insertar_destino(4,'Ciclovía Vía Las Palmas','Ruta exigente para ciclistas','Medellín','Medellín',1);

CALL insertar_destino(4,'Cerro de Las Tres Cruces','Senderismo con vista panorámica','Medellín','Medellín',1);

CALL insertar_destino(4,'Patinaje Aeroparque Juan Pablo II','Espacio recreativo para patinaje','Medellín','Medellín',1);

CALL insertar_destino(4,'Senderismo Cerro Pan de Azúcar','Caminata desafiante con vistas espectaculares','Medellín','Medellín',1);

CALL insertar_destino(4,'Parque Comfama Arví','Parque con actividades al aire libre','Medellín','Medellín',1);

CALL insertar_destino(4,'Rutas de Downhill Loma del Escobero','Rutas técnicas para ciclismo extremo','Medellín','Medellín',1);


CALL insertar_destino(5,'Comuna 13','Destino turístico cultural con arte urbano','Medellín','Medellín',1);

CALL insertar_destino(5,'Parque de los Pies Descalzos','Espacio urbano interactivo','Medellín','Medellín',1);

CALL insertar_destino(5,'Parque Explora y Planetario','Ciencia y tecnología en un solo lugar','Medellín','Medellín',1);

CALL insertar_destino(5,'Jardín Botánico','Pulmón verde de la ciudad','Medellín','Medellín',1);

CALL insertar_destino(5,'Parque Norte','Parque de diversiones urbano','Medellín','Medellín',1);

CALL insertar_destino(5,'Centro Cultural Moravia','Espacio cultural y comunitario','Medellín','Medellín',1);

CALL consultar_destinos();



CALL insertar_destino(1, 'Ecoparque La Romera',
'Espacio natural protegido ideal para senderismo y avistamiento de flora y fauna.',
'Sabaneta',
'Vereda La Doctora',
4);

CALL insertar_destino(1, 'Parque Ecológico La Doctora',
'Zona natural con senderos ecológicos y espacios de recreación al aire libre.',
'Sabaneta',
'Sector La Doctora',
4);

CALL insertar_destino(1, 'Senderos Naturales La Romera',
'Rutas ecológicas para caminatas y contacto con la naturaleza.',
'Sabaneta',
'Montaña La Romera',
4);


CALL insertar_destino(2, 'Mirador de Sabaneta',
'Punto panorámico con vista hacia el Valle de Aburrá.',
'Sabaneta',
'Zona alta del municipio',
4);

CALL insertar_destino(2, 'Mirador La Romera',
'Mirador natural ubicado en la montaña La Romera.',
'Sabaneta',
'Vereda La Doctora',
4);

CALL insertar_destino(2, 'Mirador Alto de las Flores',
'Espacio elevado con vista panorámica del municipio.',
'Sabaneta',
'Sector Alto de las Flores',
4);


CALL insertar_destino(3, 'Casa de la Cultura La Barquereña',
'Espacio cultural para eventos artísticos y exposiciones.',
'Sabaneta',
'Parque Principal',
4);

CALL insertar_destino(3, 'Iglesia Santa Ana',
'Templo religioso principal del municipio con valor histórico.',
'Sabaneta',
'Parque Principal',
4);

CALL insertar_destino(3, 'Biblioteca Pública Municipal',
'Espacio cultural y educativo para la comunidad.',
'Sabaneta',
'Centro del municipio',
4);


CALL insertar_destino(4, 'Rutas de Senderismo La Romera',
'Recorridos naturales ideales para caminatas ecológicas.',
'Sabaneta',
'Montaña La Romera',
4);

CALL insertar_destino(4, 'Ciclorrutas Sabaneta',
'Rutas urbanas y rurales para práctica de ciclismo.',
'Sabaneta',
'Zona urbana',
4);

CALL insertar_destino(4, 'Unidad Deportiva Zona Sur',
'Espacio para actividades deportivas y recreativas.',
'Sabaneta',
'Zona Sur',
4);


CALL insertar_destino(5, 'Parque Principal de Sabaneta',
'Plaza central del municipio, punto de encuentro social.',
'Sabaneta',
'Centro',
4);

CALL insertar_destino(5, 'Parque Lineal La Doctora',
'Espacio público para recreación y caminatas.',
'Sabaneta',
'Sector La Doctora',
4);

CALL insertar_destino(5, 'Unidad Deportiva Zona Sur',
'Complejo deportivo con espacios recreativos urbanos.',
'Sabaneta',
'Zona Sur',
4);

select * from Destinos_Turisticos where id_ubicacion = 4;



CALL insertar_destino(1, 'Cascada Salto del Ángel',
'Cascada natural ubicada en zona rural ideal para senderismo.',
'Envigado',
'Zona rural',
3);

CALL insertar_destino(1, 'Parque Ecológico El Salado',
'Reserva natural con senderos ecológicos y zonas verdes.',
'Envigado',
'Sector El Salado',
3);

CALL insertar_destino(1, 'Reserva Natural La Morena',
'Espacio natural para caminatas y avistamiento de flora.',
'Envigado',
'Zona alta de Envigado',
3);



CALL insertar_destino(2, 'Mirador El Salado',
'Mirador natural con vista panorámica del Valle de Aburrá.',
'Envigado',
'Sector El Salado',
3);

CALL insertar_destino(2, 'Mirador Alto de Palmas',
'Mirador con vista hacia Medellín y el sur del Valle.',
'Envigado',
'Vía Las Palmas',
3);

CALL insertar_destino(2, 'Mirador La Catedral',
'Punto elevado con vista panorámica y valor histórico.',
'Envigado',
'Zona alta',
3);



CALL insertar_destino(3, 'Casa Museo Otraparte',
'Casa museo del escritor Fernando González.',
'Envigado',
'Barrio Otraparte',
3);

CALL insertar_destino(3, 'Parroquia Santa Gertrudis',
'Iglesia principal del municipio con valor histórico.',
'Envigado',
'Parque Principal',
3);

CALL insertar_destino(3, 'Casa de la Cultura Miguel Uribe Restrepo',
'Espacio cultural para eventos artísticos y formativos.',
'Envigado',
'Centro',
3);


CALL insertar_destino(4, 'Senderismo El Salado',
'Rutas naturales para caminatas ecológicas.',
'Envigado',
'Sector El Salado',
3);

CALL insertar_destino(4, 'Ciclorrutas Envigado',
'Rutas urbanas y rurales para ciclismo recreativo.',
'Envigado',
'Zona urbana',
3);

CALL insertar_destino(4, 'Canopy Parque El Salado',
'Actividad de aventura en entorno natural.',
'Envigado',
'Sector El Salado',
3);



CALL insertar_destino(5, 'Parque Principal de Envigado',
'Plaza central del municipio y punto de encuentro social.',
'Envigado',
'Centro',
3);

CALL insertar_destino(5, 'Parque Cultural Débora Arango',
'Espacio cultural y artístico en zona urbana.',
'Envigado',
'Centro',
3);

CALL insertar_destino(5, 'Unidad Deportiva Sur de Envigado',
'Complejo deportivo y recreativo urbano.',
'Envigado',
'Zona Sur',
3);


CALL insertar_destino(1, 'Cerro Quitasol',
'Montaña emblemática ideal para senderismo y actividades ecológicas.',
'Bello',
'Zona rural',
2);

CALL insertar_destino(1, 'Parque Ecológico Cerro Quitasol',
'Espacio natural con rutas ecológicas y miradores naturales.',
'Bello',
'Sector Quitasol',
2);

CALL insertar_destino(1, 'Humedal Piamonte',
'Zona ambiental protegida con biodiversidad local.',
'Bello',
'Sector Piamonte',
2);


CALL insertar_destino(2, 'Mirador San Félix',
'Mirador natural reconocido por su vista panorámica y deportes extremos.',
'Bello',
'Sector San Félix',
2);

CALL insertar_destino(2, 'Cerro Quitasol',
'Punto elevado con vista panorámica del Valle de Aburrá.',
'Bello',
'Sector Quitasol',
2);

CALL insertar_destino(2, 'Mirador Altos de Niquía',
'Mirador urbano con vista hacia el sur del municipio.',
'Bello',
'Altos de Niquía',
2);



CALL insertar_destino(3, 'Casa de la Cultura Cerro del Ángel',
'Espacio cultural para actividades artísticas y educativas.',
'Bello',
'Centro',
2);

CALL insertar_destino(3, 'Iglesia Nuestra Señora del Rosario',
'Templo histórico ubicado en el parque principal.',
'Bello',
'Parque Principal',
2);

CALL insertar_destino(3, 'Biblioteca Marco Fidel Suárez',
'Espacio cultural y educativo del municipio.',
'Bello',
'Centro',
2);


CALL insertar_destino(4, 'Parapente San Félix',
'Zona reconocida para práctica de parapente y deportes extremos.',
'Bello',
'Sector San Félix',
2);

CALL insertar_destino(4, 'Senderismo Cerro Quitasol',
'Ruta ecológica ideal para caminatas y ejercicio al aire libre.',
'Bello',
'Sector Quitasol',
2);

CALL insertar_destino(4, 'Ciclomontañismo San Félix',
'Rutas de montaña para ciclismo extremo.',
'Bello',
'Sector San Félix',
2);


CALL insertar_destino(5, 'Parque Principal de Bello',
'Plaza central del municipio y punto de encuentro social.',
'Bello',
'Centro',
2);

CALL insertar_destino(5, 'El Callejón del Artesano',
'Espacio cultural y comercial con artesanías locales.',
'Bello',
'Centro',
2);

CALL insertar_destino(5, 'Parque Tulio Ospina',
'Complejo deportivo y recreativo urbano.',
'Bello',
'Sector Tulio Ospina',
2);


select * from Destinos_Turisticos where id_ubicacion = 2;


CALL insertar_destino(1, 'Parque Ecológico El Porvenir',
'Espacio natural con zonas verdes y senderos ecológicos.',
'Itagüí',
'Sector El Porvenir',
5);

CALL insertar_destino(1, 'Cerro Manzanillo',
'Zona natural ideal para caminatas y actividades ecológicas.',
'Itagüí',
'Zona rural',
5);

CALL insertar_destino(1, 'Quebrada Doña María',
'Entorno natural con biodiversidad y senderos.',
'Itagüí',
'Sector rural',
5);


CALL insertar_destino(2, 'Mirador El Porvenir',
'Punto elevado con vista panorámica del municipio.',
'Itagüí',
'Sector El Porvenir',
5);

CALL insertar_destino(2, 'Mirador Alto de la Cruz',
'Mirador natural con vista hacia el sur del Valle de Aburrá.',
'Itagüí',
'Zona alta',
5);

CALL insertar_destino(2, 'Mirador Ditaires',
'Mirador urbano cercano al complejo deportivo.',
'Itagüí',
'Sector Ditaires',
5);


CALL insertar_destino(3, 'Casa Museo Ditaires',
'Espacio cultural con exposiciones artísticas.',
'Itagüí',
'Sector Ditaires',
5);

CALL insertar_destino(3, 'Parroquia Nuestra Señora del Rosario',
'Iglesia histórica ubicada en el parque principal.',
'Itagüí',
'Centro',
5);

CALL insertar_destino(3, 'Casa de la Cultura de Itagüí',
'Centro cultural con actividades artísticas y educativas.',
'Itagüí',
'Centro',
5);


CALL insertar_destino(4, 'Complejo Deportivo Ditaires',
'Escenario deportivo para múltiples disciplinas.',
'Itagüí',
'Sector Ditaires',
5);

CALL insertar_destino(4, 'Ciclorrutas Itagüí',
'Rutas urbanas para ciclismo recreativo.',
'Itagüí',
'Zona urbana',
5);

CALL insertar_destino(4, 'Senderismo Cerro Manzanillo',
'Ruta ecológica para caminatas y ejercicio.',
'Itagüí',
'Zona rural',
5);


CALL insertar_destino(5, 'Acuaparque Ditaires',
'Parque acuático recreativo para toda la familia.',
'Itagüí',
'Sector Ditaires',
5);

CALL insertar_destino(5, 'Parque Principal de Itagüí',
'Plaza central del municipio y punto de encuentro social.',
'Itagüí',
'Centro',
5);

CALL insertar_destino(5, 'Parque Obrero',
'Espacio público urbano para recreación y eventos.',
'Itagüí',
'Centro',
5);


select * from Destinos_Turisticos where id_ubicacion = 5;


CALL insertar_destino(1, 'Reserva Natural El Romeral',
'Zona natural protegida ideal para senderismo y observación de flora y fauna.',
'La Estrella',
'Sector El Romeral',
6);

CALL insertar_destino(1, 'Parque Ecológico San Miguel',
'Espacio natural con senderos y zonas verdes para actividades ecológicas.',
'La Estrella',
'Zona rural',
6);

CALL insertar_destino(1, 'Quebrada La Estrella',
'Entorno natural con biodiversidad y rutas ecológicas.',
'La Estrella',
'Zona rural',
6);


CALL insertar_destino(2, 'Mirador El Romeral',
'Punto panorámico con vista al sur del Valle de Aburrá.',
'La Estrella',
'Sector El Romeral',
6);

CALL insertar_destino(2, 'Mirador La Tablaza',
'Mirador natural con vista hacia las montañas del municipio.',
'La Estrella',
'Sector La Tablaza',
6);

CALL insertar_destino(2, 'Mirador Alto de San Miguel',
'Mirador natural con paisaje rural y vista panorámica.',
'La Estrella',
'Zona rural',
6);


CALL insertar_destino(3, 'Parroquia Nuestra Señora del Rosario',
'Iglesia histórica ubicada en el parque principal del municipio.',
'La Estrella',
'Centro',
6);

CALL insertar_destino(3, 'Casa de la Cultura Francisco Carrillo',
'Espacio cultural con actividades artísticas y educativas.',
'La Estrella',
'Centro',
6);

CALL insertar_destino(3, 'Centro Cultural La Estrella',
'Lugar destinado a exposiciones y eventos culturales.',
'La Estrella',
'Centro',
6);


CALL insertar_destino(4, 'Senderismo El Romeral',
'Ruta ecológica ideal para caminatas y contacto con la naturaleza.',
'La Estrella',
'Sector El Romeral',
6);

CALL insertar_destino(4, 'Ciclorrutas La Estrella',
'Rutas urbanas y rurales para ciclismo recreativo.',
'La Estrella',
'Zona urbana y rural',
6);

CALL insertar_destino(4, 'Parapente La Tablaza',
'Zona cercana utilizada para deportes aéreos y aventura.',
'La Estrella',
'Sector La Tablaza',
6);


CALL insertar_destino(5, 'Parque Principal La Estrella',
'Plaza central del municipio y punto de encuentro social.',
'La Estrella',
'Centro',
6);

CALL insertar_destino(5, 'Parque La Tablaza',
'Espacio urbano para recreación familiar.',
'La Estrella',
'Sector La Tablaza',
6);

CALL insertar_destino(5, 'Parque San Agustín',
'Zona pública con áreas verdes y espacios recreativos.',
'La Estrella',
'Zona urbana',
6);

select * from Destinos_Turisticos where id_ubicacion = 6;

DELETE FROM destinos_turisticos WHERE id_destino = 103;
DELETE FROM destinos_turisticos WHERE id_destino = 104;
DELETE FROM destinos_turisticos WHERE id_destino = 105;

CALL insertar_destino(1, 'Reserva Natural San Miguel',
'Zona natural protegida ideal para senderismo y contacto con la naturaleza.',
'Caldas',
'Zona rural',
7);

CALL insertar_destino(1, 'Cerro La Cruz',
'Montaña natural con rutas ecológicas y espacios verdes.',
'Caldas',
'Zona alta',
7);

CALL insertar_destino(1, 'Quebrada La Miel',
'Entorno natural con senderos y biodiversidad local.',
'Caldas',
'Sector rural',
7);


CALL insertar_destino(2, 'Mirador La Cruz',
'Punto panorámico con vista hacia el sur del Valle de Aburrá.',
'Caldas',
'Zona alta',
7);

CALL insertar_destino(2, 'Mirador Alto de Minas',
'Mirador natural con paisaje montañoso.',
'Caldas',
'Vía Alto de Minas',
7);

CALL insertar_destino(2, 'Mirador Vereda La Corrala',
'Mirador rural con vista panorámica del municipio.',
'Caldas',
'Vereda La Corrala',
7);


CALL insertar_destino(3, 'Parroquia Nuestra Señora de las Mercedes',
'Iglesia principal del municipio con valor histórico.',
'Caldas',
'Parque Principal',
7);

CALL insertar_destino(3, 'Casa de la Cultura de Caldas',
'Espacio cultural para actividades artísticas y educativas.',
'Caldas',
'Centro',
7);

CALL insertar_destino(3, 'Biblioteca Pública Municipal de Caldas',
'Espacio educativo y cultural para la comunidad.',
'Caldas',
'Centro',
7);


CALL insertar_destino(4, 'Senderismo Cerro La Cruz',
'Ruta ecológica para caminatas y ejercicio al aire libre.',
'Caldas',
'Zona alta',
7);

CALL insertar_destino(4, 'Ciclorrutas Caldas',
'Rutas rurales ideales para ciclismo recreativo.',
'Caldas',
'Zona urbana y rural',
7);

CALL insertar_destino(4, 'Rutas de Motociclismo Alto de Minas',
'Trayecto montañoso frecuentado para turismo en moto.',
'Caldas',
'Vía Alto de Minas',
7);


CALL insertar_destino(5, 'Parque Principal de Caldas',
'Plaza central del municipio y punto de encuentro social.',
'Caldas',
'Centro',
7);

CALL insertar_destino(5, 'Parque Santander',
'Espacio público urbano para recreación familiar.',
'Caldas',
'Centro',
7);

CALL insertar_destino(5, 'Unidad Deportiva de Caldas',
'Complejo deportivo y recreativo del municipio.',
'Caldas',
'Zona urbana',
7);



CALL insertar_destino(1, 'Cerro El Umbí',
'Zona natural ideal para senderismo y actividades ecológicas.',
'Copacabana',
'Zona rural',
8);

CALL insertar_destino(1, 'Reserva Natural La Veta',
'Espacio natural con senderos y biodiversidad local.',
'Copacabana',
'Sector rural',
8);

CALL insertar_destino(1, 'Quebrada Piedras Blancas',
'Entorno natural con vegetación y rutas ecológicas.',
'Copacabana',
'Zona rural',
8);


CALL insertar_destino(2, 'Mirador El Umbí',
'Punto panorámico con vista al Valle de Aburrá.',
'Copacabana',
'Zona alta',
8);

CALL insertar_destino(2, 'Mirador La Veta',
'Mirador natural con vista hacia las montañas del municipio.',
'Copacabana',
'Sector La Veta',
8);

CALL insertar_destino(2, 'Mirador Alto de la Virgen',
'Mirador rural con paisaje montañoso y vista panorámica.',
'Copacabana',
'Zona rural',
8);


CALL insertar_destino(3, 'Parroquia Nuestra Señora de la Asunción',
'Iglesia principal del municipio con valor histórico.',
'Copacabana',
'Parque Principal',
8);

CALL insertar_destino(3, 'Casa de la Cultura de Copacabana',
'Espacio cultural para actividades artísticas y educativas.',
'Copacabana',
'Centro',
8);

CALL insertar_destino(3, 'Biblioteca Pública Municipal de Copacabana',
'Espacio cultural y educativo para la comunidad.',
'Copacabana',
'Centro',
8);


CALL insertar_destino(4, 'Senderismo Cerro El Umbí',
'Ruta ecológica ideal para caminatas y contacto con la naturaleza.',
'Copacabana',
'Zona rural',
8);

CALL insertar_destino(4, 'Ciclomontañismo La Veta',
'Rutas de montaña para ciclismo extremo.',
'Copacabana',
'Sector La Veta',
8);

CALL insertar_destino(4, 'Rutas Ecoturísticas Copacabana',
'Recorridos rurales para turismo de aventura.',
'Copacabana',
'Zona rural',
8);


CALL insertar_destino(5, 'Parque Principal de Copacabana',
'Plaza central del municipio y punto de encuentro social.',
'Copacabana',
'Centro',
8);

CALL insertar_destino(5, 'Parque La Asunción',
'Espacio público urbano para recreación familiar.',
'Copacabana',
'Centro',
8);

CALL insertar_destino(5, 'Unidad Deportiva Copacabana',
'Complejo deportivo y recreativo del municipio.',
'Copacabana',
'Zona urbana',
8);

select * from Destinos_Turisticos where id_ubicacion = 8;


CALL insertar_destino(1, 'Cerro Las Baldías',
'Zona natural ideal para senderismo y actividades ecológicas.',
'Girardota',
'Zona rural',
9);

CALL insertar_destino(1, 'Reserva Natural El Totumo',
'Espacio natural con senderos y biodiversidad local.',
'Girardota',
'Sector rural',
9);

CALL insertar_destino(1, 'Quebrada El Salado',
'Entorno natural con vegetación y rutas ecológicas.',
'Girardota',
'Zona rural',
9);


CALL insertar_destino(2, 'Mirador Las Baldías',
'Punto panorámico con vista al norte del Valle de Aburrá.',
'Girardota',
'Zona alta',
9);

CALL insertar_destino(2, 'Mirador El Totumo',
'Mirador natural con vista hacia las montañas del municipio.',
'Girardota',
'Sector rural',
9);

CALL insertar_destino(2, 'Mirador Alto del Norte',
'Mirador rural con paisaje montañoso y vista panorámica.',
'Girardota',
'Zona alta',
9);

CALL insertar_destino(3, 'Parroquia Nuestra Señora del Rosario',
'Iglesia principal del municipio con valor histórico.',
'Girardota',
'Parque Principal',
9);

CALL insertar_destino(3, 'Casa de la Cultura de Girardota',
'Espacio cultural para actividades artísticas y educativas.',
'Girardota',
'Centro',
9);

CALL insertar_destino(3, 'Biblioteca Pública Municipal de Girardota',
'Espacio cultural y educativo para la comunidad.',
'Girardota',
'Centro',
9);


CALL insertar_destino(4, 'Senderismo Cerro Las Baldías',
'Ruta ecológica ideal para caminatas y contacto con la naturaleza.',
'Girardota',
'Zona rural',
9);

CALL insertar_destino(4, 'Ciclomontañismo Girardota',
'Rutas de montaña para ciclismo recreativo.',
'Girardota',
'Zona rural',
9);

CALL insertar_destino(4, 'Rutas Ecoturísticas Girardota',
'Recorridos rurales para turismo de aventura.',
'Girardota',
'Zona rural',
9);

CALL insertar_destino(5, 'Parque Principal de Girardota',
'Plaza central del municipio y punto de encuentro social.',
'Girardota',
'Centro',
9);

CALL insertar_destino(5, 'Parque Las Acacias',
'Espacio público urbano para recreación familiar.',
'Girardota',
'Centro',
9);

CALL insertar_destino(5, 'Unidad Deportiva Girardota',
'Complejo deportivo y recreativo del municipio.',
'Girardota',
'Zona urbana',
9);




CALL insertar_destino(1, 'Charcos de Barbosa',
'Pozos naturales ideales para disfrutar de actividades recreativas en entorno natural.',
'Barbosa',
'Zona rural',
10);

CALL insertar_destino(1, 'Reserva Natural La Peña',
'Espacio natural con senderos ecológicos y biodiversidad.',
'Barbosa',
'Sector rural',
10);

CALL insertar_destino(1, 'Quebrada La Herradura',
'Entorno natural con vegetación y rutas ecológicas.',
'Barbosa',
'Zona rural',
10);


CALL insertar_destino(2, 'Mirador La Peña',
'Punto panorámico con vista hacia el norte del Valle de Aburrá.',
'Barbosa',
'Zona alta',
10);

CALL insertar_destino(2, 'Mirador Alto del Hatillo',
'Mirador natural con paisaje montañoso.',
'Barbosa',
'Vereda El Hatillo',
10);

CALL insertar_destino(2, 'Mirador Charcos de Barbosa',
'Mirador cercano a zona natural y turística.',
'Barbosa',
'Zona rural',
10);


CALL insertar_destino(3, 'Parroquia San Antonio de Padua',
'Iglesia principal del municipio con valor histórico.',
'Barbosa',
'Parque Principal',
10);

CALL insertar_destino(3, 'Casa de la Cultura de Barbosa',
'Espacio cultural para actividades artísticas y educativas.',
'Barbosa',
'Centro',
10);

CALL insertar_destino(3, 'Biblioteca Pública Municipal de Barbosa',
'Espacio cultural y educativo para la comunidad.',
'Barbosa',
'Centro',
10);


CALL insertar_destino(4, 'Tubing en el Río Porce',
'Actividad recreativa acuática en el río.',
'Barbosa',
'Zona rural',
10);

CALL insertar_destino(4, 'Senderismo La Peña',
'Ruta ecológica ideal para caminatas y contacto con la naturaleza.',
'Barbosa',
'Zona alta',
10);

CALL insertar_destino(4, 'Ciclomontañismo Barbosa',
'Rutas rurales ideales para ciclismo recreativo.',
'Barbosa',
'Zona rural',
10);


CALL insertar_destino(5, 'Parque Principal de Barbosa',
'Plaza central del municipio y punto de encuentro social.',
'Barbosa',
'Centro',
10);

CALL insertar_destino(5, 'Parque Diego Echavarría',
'Espacio público urbano para recreación familiar.',
'Barbosa',
'Centro',
10);

CALL insertar_destino(5, 'Unidad Deportiva Barbosa',
'Complejo deportivo y recreativo del municipio.',
'Barbosa',
'Zona urbana',
10);
















































CALL insertar_destino(
1,
'Parque Arví',
'Ideal para senderismo y picnic',
'Medellín',
'Santa Elena',
1
);

CALL insertar_destino(
2,
'Mirador Las Palmas',
'Vista panorámica de la ciudad',
'Medellín',
'Vía Las Palmas',
1
);

CALL insertar_destino(
3,
'Museo de Antioquia',
'Exhibe obras de Fernando Botero',
'Medellín',
'Centro',
1
);



-- INSERTAR DATOS TABLA UBICACIONES --
call sp_insertar_ubicacion('Medellín');
call sp_insertar_ubicacion('Bello');
call sp_insertar_ubicacion('Envigado');
call sp_insertar_ubicacion('Sabaneta');
call sp_insertar_ubicacion('Itagüí');
call sp_insertar_ubicacion('La Estrella');
call sp_insertar_ubicacion('Caldas');
call sp_insertar_ubicacion('Copacabana');
call sp_insertar_ubicacion('Girardota');
call sp_insertar_ubicacion('Barbosa');

CALL consultar_categorias();





CALL insertar_categoria_turistica(
'Parques y Reservas',
'Espacios naturales protegidos y zonas verdes'
);

CALL insertar_categoria_turistica(
'Miradores',
'Lugares con vistas panorámicas del Valle de Aburrá'
);

CALL insertar_categoria_turistica(
'Museos y Cultura',
'Espacios culturales e históricos'
);

CALL insertar_categoria_turistica(
'Actividades y Aventura',
'Experiencias recreativas y deportivas'
);

CALL insertar_categoria_turistica(
'Plazas y Parques Urbanos',
'Espacios públicos dentro de la ciudad'
);


select id_ubicacion, nombre
from ubicacion
order by id_ubicacion ASC;

DELETE FROM autenticacion WHERE id_usuario = 3;
DELETE FROM usuario WHERE id_usuario = 3;

UPDATE rol 
SET nombre = 'Usuario'
WHERE nombre = 'Turista';

ALTER TABLE autenticacion CHANGE correo email VARCHAR(255);

DELETE FROM autenticacion 
WHERE email = 'marianahm1092@gmail.com';

DELETE FROM usuario 
WHERE email = 'marianahm1092@gmail.com';

alter table Usuario
add column email varchar(150) not null unique,
add column password varchar(50) not null,
add column fecha_nacimiento date,
add column genero varchar(20),
add column nacionalidad varchar(50)
;

ALTER TABLE usuario DROP COLUMN password;

update Rol
set nombre = 'Turista'
where nombre = 'Usuario';

 -- TABLA DE ROLES (usuario, proveedor turistico, administrador unico) -- 
create table Rol(
id_rol int primary key auto_increment,
nombre varchar(100) unique not null
);


-- TABLA DE USUARIOS  --
create table Usuario(
id_usuario int primary key auto_increment,
nombre varchar(100) not null,
fecha_registro timestamp default current_timestamp,
id_rol int not null default 1, -- 1 = usuario, 2 = proveedor, 3 = administrador unico --
foreign key(id_rol) references Rol (id_rol) on delete cascade
);


-- TABAL DE AUTENTICACIÓN (Para el registro de los usuarios) --
create table Autenticacion(
id_autenticacion int primary key auto_increment,
id_usuario int not null,
correo varchar(100) not null,
contrasena_hash varchar(100),
fecha_nacimiento date,
genero enum('Masculino', 'Femenino', 'Otro'),
nacionalidad varchar(100),
id_google varchar(100) unique,
tipo_autenticacion enum ('normal', 'google') not null,
foreign key (id_usuario) references Usuario (id_usuario) on delete cascade
);


-- TABLA DE RECUPERACIÓN DE CONTRASEÑA (Tokens) --
create table Token_Recuperacion(
id_token int primary key auto_increment,
id_usuario int,
token varchar(100) unique not null,
fecha_expiracion datetime not null,
foreign key (id_usuario) references Usuario(id_usuario) on delete cascade
);


create table Ubicacion(
id_ubicacion int primary key auto_increment,
nombre varchar(100) unique not null
);

alter table destinos_turisticos
add column id_ubicacion int;

alter table destinos_turisticos
add constraint fk_destino_ubicacion
foreign key(id_ubicacion)references Ubicacion(id_ubicacion)
on delete cascade;

-- TABLA DE CATEGORIAS TURISTICAS --
create table Categoria_Turistica(
id_categoria int primary key auto_increment,
nombre varchar(100) unique not null,
descripcion text
);


-- TABLA DE DESTINOS TURISTICOS --
create table Destinos_Turisticos(
id_destino int primary key auto_increment,
id_categoria int not null,
nombre varchar(100) not null,
descripcion text, 
ciudad varchar(100) not null,
direccion varchar(100) not null, 
foreign key (id_categoria) references Categoria_Turistica(id_categoria) on delete cascade
);


-- TABLA DE EMPRESAS (Negocios, restaurantes, atracciones) --
create table Empresa(
id_empresa int primary key auto_increment,
id_usuario int not null, 
id_destino int not null,
nombre varchar(100) not null,
descripcion text,
tipo enum('Restaurante', 'Atracción', 'Otro') not null,
horario_apertura time,
horario_cierre time,
telefono varchar(20),
foreign key(id_usuario) references Usuario(id_usuario) on delete cascade,
foreign key(id_destino) references Destinos_Turisticos(id_destino) on delete cascade
);



-- TABLA DE PRODUCTOS O SERVIOS DENTRO DE LA EMPRESA --
create table Producto_Servicio(
id_producto int primary key auto_increment,
id_empresa int not null,
nombre varchar(100) not null,
descripcion text,
precio decimal(10,2) not null,
foreign key(id_empresa) references Empresa(id_empresa) on delete cascade
);


-- TABLA DE RESERVAS --
create table Reserva(
id_reserva int primary key auto_increment,
id_usuario int not null,
id_destino int not null,
id_empresa int not null,
fecha_reserva time not null,
hora_reserva time not null,
cantidad int not null,
estado enum('Pendiente', 'Confirmada', 'Cancelada') default 'Pendiente',
foreign key(id_usuario) references Usuario(id_usuario) on delete cascade,
foreign key(id_destino) references Destinos_Turisticos(id_destino) on delete cascade,
foreign key(id_empresa) references Empresa(id_empresa) on delete cascade
);


-- TABLA DE DETALLE DE LA RESERVA FALTA POR EJECUTAR--
create table Detalle_Reserva(
id_detalle_reserva int primary key auto_increment,
id_reserva int not null,
id_producto int not null,
cantidad int not null,
precio_unitario decimal(10,2) not null,
foreign key(id_reserva) references Reserva(id_reserva) on delete cascade,
foreign key(id_producto) references Producto_Servicio(id_producto) on delete cascade
);


-- TABLA DE METODO DE PAGO --
create table Metodo_Pago(
id_metodo int primary key auto_increment,
metodo varchar(100) unique not null -- Tarjeta, Transferenica, Pse, etc. --
);


-- TABLA DE PAGOS --
create table Pago(
id_pago int primary key auto_increment,
id_usuario int not null,
id_reserva int not null,
id_metodo int not null,
monto_total decimal (10,2) not null,
estado enum ('Pendiente', 'Completado', 'Fallido', 'Reembolsado') default 'Pendiente',
fecha_pago timestamp default current_timestamp,
foreign key(id_usuario) references Usuario(id_usuario) on delete cascade,
foreign key(id_reserva) references Reserva(id_reserva) on delete cascade,
foreign key(id_metodo) references Metodo_Pago(id_metodo) on delete cascade
);


-- TABLA DE CALIFICACION DE DESTINOS --
create table Calificacion_Destino(
id_calificacion int primary key auto_increment,
id_usuario int not null,
id_destino int not null,
calificacion tinyint not null check (calificacion between 1 and 5),
comentario text,
fecha timestamp default current_timestamp,
foreign key (id_usuario) references Usuario(id_usuario) on delete cascade,
foreign key(id_destino) references Destinos_Turisticos(id_destino) on delete cascade
);


-- TABLAS DE RESEÑAS DE LAS EMPRESAS --
create table Resena_Empresa(
id_resena int primary key auto_increment,
id_usuario int not null,
id_empresa int not null,
comentario text,
calificacion tinyint not null check (calificacion between 5 and 1),
fecha timestamp default current_timestamp,
foreign key(id_usuario) references Usuario(id_usuario) on delete cascade,
foreign key(id_empresa) references Empresa(id_empresa) on delete cascade
);


-- TABLA PARA AUDITORIAS DE CAMBIOS IMPORTANTES (Rol administrador) --
create table Bitacora_Auditoria(
id_bitacora int primary key auto_increment,
id_usuario int not null,
accion varchar(100) not null,
fecha timestamp default current_timestamp,
foreign key(id_usuario) references Usuario(id_usuario) on delete cascade
);

-- TABLA CONTENIDO --
create table Contenido(
	id_contenido int primary key auto_increment,
    titulo varchar (200) not null,
    descripcion text not null,
    imagen varchar(500) not null,
    precio decimal(10,2) not null,
    fecha_creacion timestamp default current_timestamp,
    id_destino int,
    id_empresa int,
    foreign key(id_destino) references Destinos_Turisticos(id_destino) on delete cascade,
    foreign key(id_empresa) references Empresa(id_empresa) on delete cascade
);



-- 


-- ---------------------------------------------------------------------------------------------------------- --


-- SEGURIDAD PARA LA BASE DE DATOS --

-- CREACIÓN DE USUARIOS (Roles) --
create user 'admin'@'localhost' identified by 'admin_password';
create user 'proveedor'@'localhost' identified by 'proveedor_password';
create user 'usuario'@'localhost' identified by 'usuario_password';


-- ASIGNACIÓN DE PERMISOS A CADA ROL --
-- ROL ADMIN: ACCESO TOTAL --
grant all privileges on tourisme.* to 'admin'@'localhost';

-- ROL PROVEEDOR: ACCESO A EMPRESA Y PRODUCTOS --
grant select, insert, update on tourisme.Empresa to 'proveedor'@'localhost';
grant select, insert, update on tourisme.Producto_Servicio to 'proveedor'@'localhost';
grant select on tourisme.Reserva to 'proveedor'@'localhost';
grant select on tourisme.pago to 'proveedor'@'localhost';

-- ROL USUARIO NORMAL: ACCESO A: 
-- Inicio de sesión y registrarse --
grant insert on tourisme.autenticacion to 'usuario'@'localhost';
grant insert on tourisme.usuario to 'usuario'@'localhost';
grant select on tourisme.reserva to 'usuario'@'localhost';

-- Recuperar contraseña --
grant insert on tourisme.token_recuperacion to 'usuario'@'localhost';

-- Explorar categorias y destinos --
grant select on tourisme.categoria_turistica to 'usuario'@'localhost';
grant select on tourisme.destinos_turisticos to 'usuario'@'localhost';

-- Visualizar productos y servicios de empresas --
grant select on tourisme.producto_servicio to 'usuario'@'localhost';

-- Visualizar reseñas de otros usuarios sobre las empresas --
grant select on tourisme.resena_empresa to 'usuario'@'localhost';

-- Realizar una reseña --
grant insert on tourisme.reserva to 'usuario'@'localhost';

-- Calificar destinos turisticos -- 
grant insert on tourisme.calificacion_destino to 'usuario'@'localhost';

-- Dejar una reseña a una empresa --
grant insert on tourisme.resena_empresa to 'usuario'@'localhost';

-- Realizar pagos --
grant insert on tourisme.pago to 'usuario'@'localhost';

-- Visualizar pagos realizados --
grant select on tourisme.pago to 'usuario'@'localhost';


-- -----------------------------INICIO DE PROCEDINIENTOS ALMACENADOS ------------------------------------------ --



-- ----------------------------------------------------------------------------------------------------- --
-- PROCEDIMIENTOS ALMACENADOS TABLA UBICACIÓN --
-- INSERTAR UBICACIÓN --

DELIMITER //

CREATE PROCEDURE sp_insertar_ubicacion(
    IN p_nombre VARCHAR(100)
)
BEGIN
    INSERT INTO Ubicacion (nombre)
    VALUES (p_nombre);
END //

DELIMITER ;



-- EDITAR UBICACION --
DELIMITER //

CREATE PROCEDURE sp_actualizar_ubicacion(
    IN p_id INT,
    IN p_nombre VARCHAR(100)
)
BEGIN
    UPDATE Ubicacion
    SET nombre = p_nombre
    WHERE id_ubicacion = p_id;
END //

DELIMITER ;

-- ELIMINARF UBICACIÓN --

DELIMITER //

CREATE PROCEDURE sp_eliminar_ubicacion(
    IN p_id INT
)
BEGIN
    DELETE FROM Ubicacion
    WHERE id_ubicacion = p_id;
END //

DELIMITER ;

-- LISTAR UBICACIONES --
DELIMITER //

CREATE PROCEDURE sp_listar_ubicaciones()
BEGIN
    SELECT * FROM Ubicacion
    ORDER BY nombre ASC;
END //

DELIMITER ;



-- PROCEDIMIENTOS ALMACENADOS TABLA USUARIO --
-- INSERTAR USUARIO --

DELIMITER //
create procedure insertar_usuario(
    in p_nombre varchar(100),
    in p_correo varchar(100),
    in p_fecha_nacimiento date,
    in p_genero enum('masculino', 'femenino', 'otro'),
    in p_nacionalidad varchar(50),
    in p_contrasena_hash varchar(100),
    in p_id_google varchar(100),
    in p_tipo_autenticacion enum('normal','google'),
    in p_id_rol int
)
begin
    -- asignar rol por defecto si no se proporciona (usuario normal)
    if p_id_rol is null then
        set p_id_rol = 1;
    end if;

    -- verificar si el correo ya está registrado
    if exists (select 1 from Autenticacion where correo = p_correo) then
        signal sqlstate '45000'
        set message_text = 'Error: El correo ya está en uso.';
    end if;

    -- evitar que haya más de un administrador
    if p_id_rol = 3 and exists (select 1 from Usuario where id_rol = 3) then
        signal sqlstate '45000'
        set message_text = 'Error: Ya existe un administrador registrado.';
    end if;

    -- insertar el usuario en la tabla Usuario
    insert into Usuario(nombre, id_rol)
    values(p_nombre, p_id_rol);

    -- obtener el id del usuario recién insertado
    set @id_usuario = last_insert_id();

    -- insertar en la tabla autenticacion
    insert into Autenticacion(id_usuario, correo, contrasena_hash, fecha_nacimiento, 
							  genero, nacionalidad, id_google, tipo_autenticacion) 
    values (@id_usuario, p_correo, p_contrasena_hash, p_fecha_nacimiento, 
		    p_genero, p_nacionalidad, p_id_google, p_tipo_autenticacion);
end //
DELIMITER ;


-- CONSULTAR USUARIO POR ID --
DELIMITER //
create procedure consultar_usuario_id(
	in p_id_usuario int
)
begin
	select * from Usuario where id_usuario = p_id_usuario;
end //
DELIMITER ;

-- CONSULTAR USUARIO EN GENERAL --
DELIMITER //
create procedure consultar_usuarios()
begin
	select * from Usuario;
end //
DELIMITER ;

-- ACTUALIZAR USUARIO --
DELIMITER //
 create procedure actualizar_usuario(
    in p_id_usuario int,
    in p_nombre varchar(100),
    in p_correo varchar(100),
    in p_fecha_nacimiento date,
    in p_genero enum('masculino', 'femenino', 'otro'),
    in p_nacionalidad varchar(50),
    in p_contrasena_hash varchar(100),
    in p_id_google varchar(100),
    in p_tipo_autenticacion enum('normal', 'google'),
    in p_id_rol int
)
begin 
    -- verificar que el nuevo correo no esté en uso por otro usuario
    if exists (select 1 from Autenticacion where correo = p_correo and id_usuario != p_id_usuario) then
        signal sqlstate '45000'
        set message_text = 'Error: El correo ya está en uso por otro usuario.';
    end if;

    -- evitar que haya más de un administrador
    if p_id_rol = 3 and exists (select 1 from Usuario where id_rol = 3 and id_usuario != p_id_usuario) then
        signal sqlstate '45000'
        set message_text = 'Error: Ya existe un administrador registrado.';
    end if;

    -- actualizar el usuario
    update Usuario
    set nombre = p_nombre,
        id_rol = p_id_rol
    where id_usuario = p_id_usuario;

    -- actualizar autenticación
    update Autenticacion
    set correo = p_correo,
        fecha_nacimiento = p_fecha_nacimiento,
        genero = p_genero,
        nacionalidad = p_nacionalidad,
        contrasena_hash = p_contrasena_hash,
        id_google = p_id_google,
        tipo_autenticacion = p_tipo_autenticacion
    where id_usuario = p_id_usuario;
end //
DELIMITER ;

-- ELIMINAR USUARIO --
DELIMITER //
create procedure eliminar_usuario(
    in p_id_usuario int
)
begin
    -- verificar si el usuario existe
    if not exists (select 1 from Usuario where id_usuario = p_id_usuario) then
        signal sqlstate '45000'
        set message_text = 'Error: El usuario no existe.';
    end if;

    -- evitar la eliminación del único administrador
    if (select id_rol from Usuario where id_usuario = p_id_usuario) = 3 
       and (select count(*) from Usuario where id_rol = 3) = 1 then
        signal sqlstate '45000'
        set message_text = 'Error: No se puede eliminar el único administrador.';
    end if;

    -- eliminar primero de autenticacion y empresa si aplica
    delete from Autenticacion where id_usuario = p_id_usuario;
    delete from Empresa where id_usuario = p_id_usuario;
    delete from Usuario where id_usuario = p_id_usuario;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA ROL --
-- INSERTAR ROL ACTUALIZADO PARA EVITAR QUE SE REGISTRE MAS DE 1 ROL ADMINISTRADOR--
DELIMITER //
create procedure insertar_rol (
	in p_nombre varchar(100)
)
begin
	-- Verificar si ya existe un rol Administrador 
    if p_nombre = 'Administrador' and exists (select 1 from Rol where nombre = 'Administrador') then
		signal sqlstate '45000'
		set message_text = 'Error: Solo puede existir un Administrador';
        
	-- Verificar si el rol es valido
    elseif p_nombre not in ('Usuario', 'Negocio', 'Administrador') then
		signal sqlstate '45000'
        set message_text = 'Error: El rol debe de ser Usuario, Negocio o Administrador.';
	else 
		insert into Rol (nombre) values (p_nombre);
	end if;
end //
DELIMITER ;

use tourisme;

-- 	CONSULTAR ROL POR ID --
DELIMITER //
create procedure consultar_rol_id(
	in p_id_rol int
)
begin 
	select * from Rol where id_rol = p_id_rol;
end //
DELIMITER ;

-- CONSULTAR ROL EN GENERAL--
DELIMITER //
create procedure consultar_roles()
begin
	select * from Rol;
end //
DELIMITER ;

-- ACTUALIZAR ROL --
DELIMITER //
create procedure actualizar_rol(
	in p_id_rol int, 
    in p_nombre varchar(100)
)
begin
    -- Evitar actualizar el rol Administrador
    if (select nombre from Rol where id_rol = p_id_rol) = 'Administrador' then
        signal sqlstate '45000'
        set message_text = 'Error: No se puede modificar el rol Administrador.';
    else 
        update Rol 
        set nombre = p_nombre
        where id_rol = p_id_rol;
    end if;
end //
DELIMITER ;

-- ELIMINAR ROL SE MODIFICO PARA EVITAR LA ELIMINACIÓN DEL ROL ADMINISTRADOR--
DELIMITER //
create procedure eliminar_rol(
 in p_id_rol int
)
begin
    declare v_nombre varchar(100);

    -- Verificar si el ID existe antes de continuar
    select nombre into v_nombre from Rol where id_rol = p_id_rol;

    if v_nombre is null then
        signal sqlstate '45000'
        set message_text = 'Error: El rol no existe.';
    elseif v_nombre = 'Administrador' then
        signal sqlstate '45000'
        set message_text = 'Error: No se puede eliminar el rol de Administrador.';
    else 
        delete from Rol where id_rol = p_id_rol;
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTO ALMACENADO TABLA AUTENTICACIÓN --
-- INSERTAR AUTENTICACIÓN --
DELIMITER //
create procedure insertar_autenticacion(
    in p_id_usuario int,
    in p_correo varchar(100),
    in p_contrasena_hash varchar(100),
    in p_fecha_nacimiento date,
    in p_genero enum('masculino', 'femenino', 'otro'),
    in p_nacionalidad varchar(100),
    in p_id_google varchar(100),
    in p_tipo_autenticacion enum('normal', 'google')
)
begin
    -- Verificar si el correo ya existe
    if exists (select 1 from autenticacion where correo = p_correo) then
        signal sqlstate '45000'
        set message_text = 'Error: El correo ya está registrado.';
    else
        insert into autenticacion(id_usuario, correo, contrasena_hash, fecha_nacimiento, genero, nacionalidad, id_google, tipo_autenticacion)
        values (p_id_usuario, p_correo, p_contrasena_hash, p_fecha_nacimiento, p_genero, p_nacionalidad, p_id_google, p_tipo_autenticacion);
    end if;
end 
DELIMITER ;


-- CONSULTAR AUTENTICACIÓN POR ID --
DELIMITER //
create procedure consultar_autenticacion_id(
    in p_id_usuario int
)
begin
    select * from Autenticacion where id_usuario = p_id_usuario;
end //
DELIMITER ;

-- CONSULTAR AUTENTICACIONES EN GENERAL --
DELIMITER //
create procedure consultar_autenticaciones()
begin
    select * from Autenticacion;
end //
DELIMITER ;


-- ACTUALIZAR AUTENTICACIÓN --
DELIMITER //
create procedure actualizar_autenticacion(
    in p_id_usuario int,
    in p_correo varchar(100),
    in p_contrasena_hash varchar(100),
    in p_fecha_nacimiento date,
    in p_genero enum('masculino', 'femenino', 'otro'),
    in p_nacionalidad varchar(100),
    in p_id_google varchar(100),
    in p_tipo_autenticacion enum('normal', 'google')
)
begin
    -- Verificar que el nuevo correo no esté en uso por otro usuario
    if exists (select 1 from Autenticacion where correo = p_correo and id_usuario != p_id_usuario) then
        signal sqlstate '45000'
        set message_text = 'Error: El correo ya está en uso por otro usuario.';
    end if;

    update Autenticacion
    set correo = p_correo,
        contrasena_hash = p_contrasena_hash,
        fecha_nacimiento = p_fecha_nacimiento,
        genero = p_genero,
        nacionalidad = p_nacionalidad,
        id_google = p_id_google,
        tipo_autenticacion = p_tipo_autenticacion
    where id_usuario = p_id_usuario;
end //
DELIMITER ;


-- ELIMINAR AUTENTICACIÓN --
DELIMITER //
create procedure eliminar_autenticacion(
    in p_id_usuario int
)
begin
    delete from Autenticacion where id_usuario = p_id_usuario;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --
-- PROCEDIMIENTOS ALMACENADOS TABLA TOKEN RECUPERACIÓN --
-- GENERAR NUEVO TOKEN --
DELIMITER //
create procedure generar_token_recuperacion(
    in p_id_usuario int,
    in p_token varchar(100),
    in p_fecha_expiracion datetime
)
begin
    -- Eliminar tokens previos del usuario para evitar duplicidad
    delete from Token_Recuperacion where id_usuario = p_id_usuario;
    
    -- Insertar el nuevo token
    insert into Token_Recuperacion(id_usuario, token, fecha_expiracion)
    values (p_id_usuario, p_token, p_fecha_expiracion);
end //
DELIMITER ;

-- VALIDAR TOKEN --
DELIMITER //
create procedure validar_token_recuperacion(
    in p_token varchar(100)
)
begin
    -- Verificar si el token es válido y no ha expirado
    if not exists (select 1 from Token_Recuperacion where token = p_token and fecha_expiracion > now()) then
        signal sqlstate '45000'
        set message_text = 'Error: Token inválido o expirado.';
    end if;
end //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------- --
-- PROCEDIMIENTOS ALMACENADOS TABLA CATEGORIA TURISTICA --
-- INSERTAR --
DELIMITER //
create procedure insertar_categoria_turistica(
    in p_nombre varchar(100),
    in p_descripcion text
)
begin
    -- verificar si la categoría ya existe
    if exists (select 1 from Categoria_Turistica where nombre = p_nombre) then
        signal sqlstate '45000'
        set message_text = 'Error: La categoría ya existe.';
    else
        insert into Categoria_Turistica(nombre, descripcion)
        values (p_nombre, p_descripcion);
    end if;
end //	
DELIMITER ;

-- ACTUALIZAR --
DELIMITER //
create procedure actualizar_categoria_turistica(
    in p_id_categoria int,
    in p_nombre varchar(100),
    in p_descripcion text
)
begin
    -- verificar si la categoría existe
    if not exists (select 1 from Categoria_Turistica where id_categoria = p_id_categoria) then
        signal sqlstate '45000'
        set message_text = 'Error: La categoría no existe.';
    else
        update Categoria_Turistica
        set nombre = p_nombre, descripcion = p_descripcion
        where id_categoria = p_id_categoria;
    end if;
end //
DELIMITER ;

-- CONSULTAR POR ID --
DELIMITER //
create procedure consultar_categoria_por_id(
    in p_id_categoria int
)
begin
    -- retornar la categoría correspondiente al id
    select * from Categoria_Turistica where id_categoria = p_id_categoria;
end //
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_categorias;

CALL consultar_categorias();

-- CONSULTAR EN GENERAL --
DELIMITER //

CREATE PROCEDURE consultar_categorias()
BEGIN
    SELECT id_categoria, nombre, descripcion
    FROM Categoria_Turistica
    ORDER BY nombre ASC;
END //

DELIMITER ;



-- ELIMINAR -
DELIMITER //
create procedure eliminar_categoria_turistica(
    in p_id_categoria int
)
begin
    -- verificar si la categoría existe antes de eliminar
    if not exists (select 1 from Categoria_Turistica where id_categoria = p_id_categoria) then
        signal sqlstate '45000'
        set message_text = 'Error: La categoría no existe.';
    else
        delete from Categoria_Turistica where id_categoria = p_id_categoria;
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA DESTINO TURISTICO --
-- INSERTAR DESTINO --
DELIMITER //

CREATE PROCEDURE insertar_destino(
    IN p_id_categoria INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_ciudad VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_id_ubicacion INT
)
BEGIN
    INSERT INTO Destinos_Turisticos
    (id_categoria, nombre, descripcion, ciudad, direccion, id_ubicacion)
    VALUES
    (p_id_categoria, p_nombre, p_descripcion, p_ciudad, p_direccion, p_id_ubicacion);
END //

DELIMITER ;


-- CONSULTAR DESTINOS --
DELIMITER //

CREATE PROCEDURE consultar_destinos()
BEGIN
    SELECT 
        d.id_destino,
        d.nombre,
        d.descripcion,
        d.ciudad,
        d.direccion,
        c.nombre AS categoria,
        u.nombre AS ubicacion
    FROM Destinos_Turisticos d
    INNER JOIN Categoria_Turistica c ON d.id_categoria = c.id_categoria
    INNER JOIN Ubicacion u ON d.id_ubicacion = u.id_ubicacion
    ORDER BY d.nombre ASC;
END //

DELIMITER ;

CALL consultar_destinos();



-- ACTUALIZAR DESTINO ACTUALIZADO --
DELIMITER //

CREATE PROCEDURE actualizar_destino(
    IN p_id_destino INT,
    IN p_id_categoria INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_ciudad VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_id_ubicacion INT
)
BEGIN
    UPDATE Destinos_Turisticos
    SET id_categoria = p_id_categoria,
        nombre = p_nombre,
        descripcion = p_descripcion,
        ciudad = p_ciudad,
        direccion = p_direccion,
        id_ubicacion = p_id_ubicacion
    WHERE id_destino = p_id_destino;
END //

DELIMITER ;


-- ELIMINAR DESTINO --
DELIMITER //
create procedure eliminar_destino (
	in p_id_destino int
)
begin
	delete from Destinos_Turisticos where id_destino = p_id_destino;
end //
DELIMITER ;


DROP PROCEDURE IF EXISTS insertar_destino;
DROP PROCEDURE IF EXISTS actualizar_destino;
DROP PROCEDURE IF EXISTS consultar_destinos;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA EMPRESA --
-- INSERTAR EMPRESA ACTUALIZADO ACTUALIZADO --
DELIMITER //
create procedure insertar_empresa(
    in p_id_usuario int,
    in p_id_destino int,
    in p_nombre varchar(100),
    in p_descripcion text,
    in p_tipo varchar(20),
    in p_horario_apertura time,
    in p_horario_cierre time,
    in p_telefono varchar(20)
)
begin
    -- verificar si el usuario ya tiene una empresa
    if exists (select 1 from empresa where id_usuario = p_id_usuario) then
        signal sqlstate '45000'
        set message_text = 'error: el usuario ya tiene una empresa registrada.';
    else
        -- validar el tipo de empresa
        if p_tipo not in ('restaurante', 'atracción', 'otro') then
            signal sqlstate '45000'
            set message_text = 'error: tipo de empresa inválido.';
        else
            insert into empresa(id_usuario, id_destino, nombre, descripcion, tipo, 
								horario_apertura, horario_cierre, telefono)
            values (p_id_usuario, p_id_destino, p_nombre, p_descripcion, p_tipo, 
								p_horario_apertura, p_horario_cierre, p_telefono);
        end if;
    end if;
end //
DELIMITER ;


-- CONSULTAR EMPRESA POR ID --
DELIMITER //
create procedure consultar_empresa_id(
	in p_id_empresa int
)
begin
    select * from Empresa where id_empresa = p_id_empresa;
end //
DELIMITER ;

-- CONSULTAR EMPRESA EN GENERAL --
DELIMITER //
create procedure consultar_empresas()
begin
    select * from Empresa;
end //
DELIMITER ;

-- ACTUALIZAR EMPRESA ACTUALIZADO --
DELIMITER //
create procedure actualizar_empresa(
    in p_id_empresa int,
    in p_id_usuario int,
    in p_id_destino int,
    in p_nombre varchar(100),
    in p_descripcion text,
    in p_tipo varchar(20),
    in p_horario_apertura time,
    in p_horario_cierre time,
    in p_telefono varchar(20)
)
begin
    -- validar que la empresa exista
    if (select count(*) from empresa where id_empresa = p_id_empresa) = 0 then
        signal sqlstate '45000'
        set message_text = 'error: la empresa no existe.';
    else
        -- validar el tipo de empresa
        if p_tipo not in ('restaurante', 'atracción', 'otro') then
            signal sqlstate '45000'
            set message_text = 'error: tipo de empresa inválido.';
        else
            update empresa
            set id_usuario = p_id_usuario,
                id_destino = p_id_destino,
                nombre = p_nombre,
                descripcion = p_descripcion,
                tipo = p_tipo,
                horario_apertura = p_horario_apertura,
                horario_cierre = p_horario_cierre,
                telefono = p_telefono
            where id_empresa = p_id_empresa;
        end if;
    end if;
end //
DELIMITER ;

-- ELIMINAR EMPRESA ACTUALIZADO --
DELIMITER //
create procedure eliminar_empresa(
    in p_id_empresa int
)
begin
    declare exit handler for sqlexception 
    begin
        rollback;
        signal sqlstate '45000'
        set message_text = 'error al eliminar la empresa';
    end;
    
    start transaction;
    
    -- verificar si la empresa existe
    if (select count(*) from empresa where id_empresa = p_id_empresa) = 0 then
        signal sqlstate '45000'
        set message_text = 'error: la empresa no existe.';
    else
        -- verificar si la empresa tiene productos o servicios asociados
        if (select count(*) from producto_servicio where id_empresa = p_id_empresa) > 0 then
            signal sqlstate '45000'
            set message_text = 'error: no se puede eliminar la empresa 
								porque tiene productos o servicios asociados.';
        else
            -- eliminar la empresa
            delete from empresa where id_empresa = p_id_empresa;
        end if;
    end if;
    
    commit;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA PRODUCTO SERVICIO --
-- INSERTAR --
DELIMITER //
create procedure insertar_producto_servicio(
    in p_id_empresa int,
    in p_nombre varchar(100),
    in p_descripcion text,
    in p_precio decimal(10,2)
)
begin
    -- Verificar si la empresa existe
    if not exists (select 1 from empresa where id_empresa = p_id_empresa) then
        signal sqlstate '45000'
        set message_text = 'error: la empresa no existe.';
    else
        insert into producto_servicio (id_empresa, nombre, descripcion, precio)
        values (p_id_empresa, p_nombre, p_descripcion, p_precio);
    end if;
end //
DELIMITER ;

-- CONSULTAR PRODUCTO SERVICIO POR ID --
DELIMITER //
create procedure consultar_producto_id(
	in p_id_producto int
)
begin
    select * from Producto_Servicio where id_producto = p_id_producto;
end //
DELIMITER ;

-- CONSULTAR PRODUCTO SERVICIO EN GENERAL --
DELIMITER //
create procedure consultar_productos()
begin
    select * from Producto_Servicio;
end //
DELIMITER ;

-- ACTUALIZAR PRODUCTO SERVICIO ACTUALIZADO --
DELIMITER //
create procedure actualizar_producto_servicio(
    in p_id_producto int,
    in p_id_empresa int,
    in p_nombre varchar(100),
    in p_descripcion text,
    in p_precio decimal(10,2)
)
begin
    -- Verificar si el producto existe
    if not exists (select 1 from producto_servicio where id_producto = p_id_producto) then
        signal sqlstate '45000'
        set message_text = 'error: el producto no existe.';
    else
        update producto_servicio
        set id_empresa = p_id_empresa,
            nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio
        where id_producto = p_id_producto;
    end if;
end //
DELIMITER ;

-- ELIMINAR PRODUCTO SERVICIO ACTUALIZADO--
DELIMITER //
create procedure eliminar_producto_servicio(
    in p_id_producto int
)
begin
    -- Verificar si el producto existe
    if not exists (select 1 from producto_servicio where id_producto = p_id_producto) then
        signal sqlstate '45000'
        set message_text = 'error: el producto no existe.';
    else
        delete from producto_servicio where id_producto = p_id_producto;
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA RESERVA --
-- INSERTAR RESERVA --
DELIMITER //
create procedure insertar_reserva(
    in p_id_usuario int,
    in p_id_destino int,
    in p_id_empresa int,
    in p_fecha_reserva date,
    in p_hora_reserva time,
    in p_cantidad int,
    in p_estado enum('pendiente', 'confirmada', 'cancelada')
)
begin
    insert into Reserva (id_usuario, id_destino, id_empresa, fecha_reserva, hora_reserva, cantidad, estado)
    values (p_id_usuario, p_id_destino, p_id_empresa, p_fecha_reserva, p_hora_reserva, p_cantidad, p_estado);
end //
DELIMITER ;

-- CONSULTAR RESERVA POR ID --
DELIMITER //
create procedure consultar_reserva_id(
	in p_id_reserva int
)
begin
    select * from Reserva where id_reserva = p_id_reserva;
end //
DELIMITER ;

-- CONSULTAR RESERVA EN GENERAL --
DELIMITER //
create procedure consultar_reservas()
begin
    select * from Reserva;
end //
DELIMITER ;

-- ACTUALIZAR RESERVA --
DELIMITER //
create procedure actualizar_reserva(
    in p_id_reserva int,
    in p_estado enum('pendiente', 'confirmada', 'cancelada')
)
begin
    update Reserva
    set estado = p_estado
    where id_reserva = p_id_reserva;
end //
DELIMITER ;

-- ELIMINAR RESERVA --
DELIMITER //
create procedure eliminar_reserva(
	in p_id_reserva int
)
begin
    delete from Reserva where id_reserva = p_id_reserva;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA DETALLE RESERVA --
-- INSERTAR DETALLE_RESERVA --
DELIMITER //
create procedure insertar_detalle_reserva(
    in p_id_reserva int,
    in p_id_producto int,
    in p_cantidad int,
    in p_precio_unitario decimal(10,2)
)
begin
    insert into Detalle_Reserva (id_reserva, id_producto, cantidad, precio_unitario)
    values (p_id_reserva, p_id_producto, p_cantidad, p_precio_unitario);
end //
DELIMITER ;

-- CONSULTAR DETALLE RESERVA POR ID --
DELIMITER //
create procedure consultar_detalle_reserva_id(
	in p_id_detalle int
)
begin
    select * from Detalle_Reserva where id_detalle = p_id_detalle;
end //
DELIMITER ;

-- CONSULTAR DETALLE RESERVA EN GENERAL --
DELIMITER //
create procedure consultar_detalles_reservas()
begin
    select * from Detalle_Reserva;
end //
DELIMITER ;

-- ACTUALIZAR DETALLE RESERVA --
DELIMITER //
create procedure actualizar_detalle_reserva(
    in p_id_detalle int,
    in p_cantidad int,
    in p_precio_unitario decimal(10,2)
)
begin
    update Detalle_Reserva
    set cantidad = p_cantidad,
        precio_unitario = p_precio_unitario
    where id_detalle = p_id_detalle;
end //
DELIMITER ;

-- ELIMINAR DETALLE RESERVA --
DELIMITER //
create procedure eliminar_detalle_reserva(
	in p_id_detalle int
)
begin
    delete from Detalle_Reserva where id_detalle = p_id_detalle;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA METODO PAGO --
-- INSERTAR METODO PAGO --
DELIMITER //
create procedure insertar_metodo_pago(
	in p_metodo varchar(50)
)
begin
    insert into Metodo_Pago (metodo) 
    values (p_metodo);
end //
DELIMITER ;

-- CONSULTAR METODO PAGO POR ID --
DELIMITER //
create procedure consultar_metodo_pago_id(
	in p_id_metodo int
)
begin
    select * from Metodo_Pago where id_metodo = p_id_metodo;
end //
DELIMITER ;

-- CONSULTAR METODO PAGO EN GENERAL --
DELIMITER //
create procedure consultar_metodos_pago()
begin
    select * from Metodo_Pago;
end //
DELIMITER ;

-- ACTUALIZAR METODO PAGO --
DELIMITER //
create procedure actualizar_metodo_pago(
	in p_id_metodo int, in p_metodo varchar(50)
)
begin
    update Metodo_Pago 
    set metodo = p_metodo 
    where id_metodo = p_id_metodo;
end //
DELIMITER ;

-- ELIMINAR METODO PAGO --
DELIMITER //
create procedure eliminar_metodo_pago(
	in p_id_metodo int
)
begin
    delete from Metodo_Pago where id_metodo = p_id_metodo;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA PAGO --
-- INSERTAR PAGO --
DELIMITER //
create procedure insertar_pago(
    in p_id_reserva int,
    in p_id_metodo int,
    in p_monto_total decimal(10,2),
    in p_estado enum('pendiente', 'completado', 'fallido', 'reembolsado')
)
begin
    insert into Pago (id_reserva, id_metodo, monto_total, estado)
    values (p_id_reserva, p_id_metodo, p_monto_total, p_estado);
end //
DELIMITER ;

-- CONSULTAR PAGO POR ID --
DELIMITER //
create procedure consultar_pago_id(
	in p_id_pago int
)
begin
    select * from Pago where id_pago = p_id_pago;
end //
DELIMITER ;

-- CONSULTAR PAGOS EN GENERAL --
DELIMITER //
create procedure consultar_pagos()
begin
    select * from Pago;
end //
DELIMITER ;

-- ACTUALIZAR PAGO --
DELIMITER //
create procedure actualizar_pago(
    in p_id_pago int,
    in p_estado enum('pendiente', 'completado', 'fallido', 'reembolsado')
)
begin
    update Pago
    set estado = p_estado
    where id_pago = p_id_pago;
end //
DELIMITER ;

-- ELIMINAR PAGO --
DELIMITER //
create procedure eliminar_pago(
	in p_id_pago int
)
begin
    delete from Pago where id_pago = p_id_pago;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --



-- PROCEDIMIENTOS ALMACENADOS TABLA CALIFICACION DESTINO --
-- INSERTAR CALIFICACIÓN DESTINO --
DELIMITER //
create procedure insertar_calificacion_destino(
    in p_id_usuario int,
    in p_id_destino int,
    in p_calificacion tinyint,
    in p_comentario text
)
begin
    insert into Calificacion_Destino (id_usuario, id_destino, calificacion, comentario)
    values (p_id_usuario, p_id_destino, p_calificacion, p_comentario);
end //
DELIMITER ;


-- CONSULTAR CALIFICACION DESTINO POR ID --
DELIMITER //
create procedure consultar_calificacion_id(
	in p_id_calificacion int
)
begin
    select * from Calificacion_Destino 
    where id_calificacion = p_id_calificacion;
end //
DELIMITER ;

-- CONSULTAR CALIFICACION DESTINO EN GENERAL --
DELIMITER //
create procedure consultar_todas_calificaciones()
begin
    select * from Calificacion_Destino;
end //
DELIMITER ;

-- ACTUALIZAR CALIFICACION DESTINO --
DELIMITER //
create procedure actualizar_calificacion(
    in p_id_calificacion int,
    in p_calificacion tinyint,
    in p_comentario text
)
begin
    update Calificacion_Destino
    set calificacion = p_calificacion,
        comentario = p_comentario
    where id_calificacion = p_id_calificacion;
end //
DELIMITER ;

-- ELIMINAR CALIFICACION DESTINO --
DELIMITER //
create procedure eliminar_calificacion(
	in p_id_calificacion int
)
begin
    delete from Calificacion_Destino where id_calificacion = p_id_calificacion;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA RESEÑA EMPRESA --
-- INSERTAR RESEÑA EMPRESA --
DELIMITER //
create procedure insertar_resena_empresa(
    in p_id_usuario int,
    in p_id_empresa int,
    in p_comentario text,
    in p_calificacion tinyint
)
begin
    insert into Resena_Empresa (id_usuario, id_empresa, comentario, calificacion)
    values (p_id_usuario, p_id_empresa, p_comentario, p_calificacion);
end //
DELIMITER ;

-- CONSULTAR RESEÑA EMPRESA POR ID --
DELIMITER //
create procedure consultar_resena_id(
	in p_id_resena int
)
begin
    select * from Resena_Empresa where id_resena = p_id_resena;
end //
DELIMITER ;

-- CONSULTAR RESEÑA EMPRESA EN GENERAL --
DELIMITER //
create procedure consultarresenas()
begin
    select * from Resena_Empresa;
end //
DELIMITER ;

-- ACTUALIZAR RESEÑA EMPRESA --
DELIMITER //
create procedure actualizar_resena(
    in p_id_resena int,
    in p_comentario text,
    in p_calificacion tinyint
)
begin
    update Resena_Empresa
    set comentario = p_comentario,
        calificacion = p_calificacion
    where id_resena = p_id_resena;
end //
DELIMITER ;

-- ELIMINAR RESEÑA EMPRESA --
DELIMITER //
create procedure eliminar_resena(
	in p_id_resena int
)
begin
    delete from Resena_Empresa where id_resena = p_id_resena;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA BITACORA AUDITORIA --
-- INSERTAR  --
DELIMITER //
create procedure insertar_bitacora_auditoria(
    in p_id_usuario int,
    in p_accion varchar(255)
)
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (p_id_usuario, p_accion, current_timestamp());
end //
DELIMITER ;

-- CONSULTAR BITACORA AUDITORIA POR ID --
DELIMITER //
create procedure consultar_bitacora_id(
	in p_id_auditoria int
)
begin
    select * from Bitacora_Auditoria where id_auditoria = p_id_auditoria;
end //
DELIMITER ;

-- CONSULTAR BITACORA AUDITORIA EN GENERAL --
DELIMITER //
create procedure consultar_toda_bitacora()
begin
    select * from Bitacora_Auditoria;
end //
DELIMITER ;

-- ELIMINAR BITACORA AUDITORIA --
DELIMITER //
create procedure eliminar_registro_bitacora(in p_id_auditoria int)
begin
    delete from Bitacora_Auditoria where id_auditoria = p_id_auditoria;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- PROCEDIMIENTOS ALMACENADOS TABLA CONTENIDO --
-- INSERTAR --
DELIMITER //
create procedure insertar_contenido(
    in p_titulo varchar(200),
    in p_descripcion text,
    in p_imagen varchar(500),
    in p_precio decimal(10,2),
    in p_id_destino int,
    in p_id_empresa int
)
begin
    insert into contenido (titulo, descripcion, imagen, precio, id_destino, id_empresa)
    values (p_titulo, p_descripcion, p_imagen, p_precio, p_id_destino, p_id_empresa);
end //
DELIMITER ;

-- CONSULTAR CONTENIDO POR ID --
DELIMITER //
create procedure consultar_contenido_id(in p_id_contenido int)
begin
    select * from contenido where id_contenido = p_id_contenido;
end //
DELIMITER ;

-- CONSULTAR CONTENIDOS --
DELIMITER //
create procedure consultar_contenidos()
begin
    select * from contenido;
end //
DELIMITER ;

-- ACTUALIZAR CONTENIDOS --
DELIMITER //
create procedure actualizar_contenido(
    in p_id_contenido int,
    in p_titulo varchar(200),
    in p_descripcion text,
    in p_imagen varchar(500),
    in p_precio decimal(10,2),
    in p_id_destino int,
    in p_id_empresa int
)
begin
    update contenido
    set titulo = p_titulo,
        descripcion = p_descripcion,
        imagen = p_imagen,
        precio = p_precio,
        id_destino = p_id_destino,
        id_empresa = p_id_empresa
    where id_contenido = p_id_contenido;
end //
DELIMITER ;

-- ELIMINAR CONTENIDOS --
DELIMITER //
create procedure eliminar_contenido(in p_id_contenido int)
begin
    delete from contenido where id_contenido = p_id_contenido;
end //
DELIMITER ;

-- ----------------------------------------- INICIO DE TRIGGERS NO EJECUTADOS AUN -------------------------------- --

-- TRIGGERS TABLA USUARIO --
DELIMITER //
create trigger tr_insertar_usuario
after insert on Usuario
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Usuario creado', current_timestamp());
end //

create trigger tr_actualizar_usuario
after update on Usuario
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Usuario actualizado', current_timestamp());
end //

create trigger tr_eliminar_usuario
after delete on Usuario
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (old.id_usuario, 'Usuario eliminado', current_timestamp());
end //

create trigger tr_evitar_cambio_a_admin
before update on Usuario
for each row
begin
    -- evitar que un usuario normal se actualice a administrador si ya existe uno
    if new.id_rol = 3 and old.id_rol != 3 and exists (select 1 from Usuario where id_rol = 3) then
        signal sqlstate '45000'
        set message_text = 'Error: No se puede asignar otro usuario como administrador.';
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA ROL ACTUALIZADO --
DELIMITER //
create trigger tr_evitar_cambio_de_rol
before update on Rol
for each row
begin
    if old.nombre = 'Administrador' then
        signal sqlstate '45000' set message_text = 'No se puede modificar el rol Administrador';
    end if;
end //
DELIMITER ;


drop trigger if exists tr_evitar_cambio_de_rol;


-- ----------------------------------------------------------------------------------------------------------- --

-- TRIGGERS TABLA AUTENTICACIÓN --

DELIMITER //
create trigger tr_antes_de_actualizar_correo
before update on Autenticacion
for each row
begin
    if old.tipo_autenticacion = 'google' and new.correo != old.correo then
        signal sqlstate '45000'
        set message_text = 'Error: No se puede cambiar el correo de un usuario registrado con Google.';
    end if;
end //
DELIMITER ;


DELIMITER //
create trigger tr_antes_de_insertar_autenticacion
before insert on Autenticacion
for each row
begin
    if exists (select 1 from Autenticacion where correo = new.correo) then
        signal sqlstate '45000'
        set message_text = 'Error: El correo ya está registrado.';
    end if;
    
    if new.id_google is not null and exists (select 1 from Autenticacion where id_google = new.id_google) then
        signal sqlstate '45000'
        set message_text = 'Error: El ID de Google ya está registrado.';
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --

-- TRIGGERS TABLA TOKEN RECUPERACIÓN --
DELIMITER //
create trigger tr_eliminar_tokens_expirados
before insert on Token_Recuperacion
for each row
begin
    delete from Token_Recuperacion where fecha_expiracion < now();
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --

-- TRIGGERS TABLA CATEGORIA TURISTICA --
DELIMITER //
create trigger tr_antes_de_actualizar_categoria
before update on Categoria_Turistica
for each row
begin
    if exists (select 1 from Categoria_Turistica where nombre = new.nombre and id_categoria != old.id_categoria) then
        signal sqlstate '45000'
        set message_text = 'Error: El nombre de la categoría ya existe.';
    end if;
end //
DELIMITER ;

-- REGISTRAR CAMBIOS --
DELIMITER //
create trigger tr_despues_de_eliminar_categoria
after delete on Categoria_Turistica
for each row
begin
    insert into Registro_Cambios (tabla_afectada, accion, descripcion, fecha)
    values ('Categoria_Turistica', 'Eliminación', concat('Se eliminó la categoría con ID ', 
			old.id_categoria, ' y nombre ', old.nombre), now());
end //
DELIMITER ;

-- -----------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------
-- 


-- TRIGGERS TABLA DESTINO TURISTICO --

-- REGISTRAR INSERCIÓN DE DESTINO ACTUALIZADO --
DELIMITER //
create trigger despues_de_insertar_destino
after insert on Destinos_Turisticos
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, descripcion, fecha)
    values (null, 'Destino turístico creado', concat('Destino: ', new.nombre, 
			' en ', new.ciudad), current_timestamp());
end //
DELIMITER ;

-- ACTUALIZAR DESTINO ACTUALIZADO --
DELIMITER //
create trigger despues_de_actualizar_destino
after update on Destinos_Turisticos
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, descripcion, fecha)
    values (null, 'Destino turístico actualizado', concat('Destino actualizado: ', new.nombre), 
			current_timestamp());
end //
DELIMITER ;

-- ELIMINAR DESTINO CON RESERVA --

DELIMITER //
create trigger antes_de_eliminar_destino
before delete on Destinos_Turisticos
for each row
begin
    if (select count(*) from Reserva where id_destino = old.id_destino) > 0 then
        signal sqlstate '45000' 
        set message_text = 'No se puede eliminar el destino porque tiene reservas asociadas.';
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --

-- TRIGGERS TABLA EMPRESA --
-- INSERTAR EMPRESA ACTUALIZADO --
DELIMITER //
create trigger tr_insertar_empresa
after insert on empresa
for each row
begin
    insert into bitacora_auditoria (id_usuario, accion, tabla_afectada, fecha)
    values (new.id_usuario, concat('empresa creada (ID: ', new.id_empresa, ')'), 
		    'empresa', current_timestamp());
end //
DELIMITER ;


-- ELIMINAR EMPRESA ACTUALIZADO --
DELIMITER //
create trigger tr_eliminar_empresa
before delete on empresa
for each row
begin
    -- verificar si la empresa existe antes de eliminar productos
    if exists (select 1 from empresa where id_empresa = old.id_empresa) then
        delete from producto_servicio where id_empresa = old.id_empresa;
    end if;
    
    -- registrar en la bitácora
    insert into bitacora_auditoria (id_usuario, accion, tabla_afectada, fecha)
    values (old.id_usuario, concat('empresa eliminada (ID: ', old.id_empresa, ') 
			junto con sus productos'), 'empresa', current_timestamp());
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA PRODUCTO SERVICIO --
DELIMITER //
create trigger tr_insertar_producto
after insert on producto_servicio
for each row
begin
    insert into bitacora_auditoria (id_usuario, accion, fecha)
    values (
        (select id_usuario from empresa where id_empresa = new.id_empresa),
        'producto/servicio agregado',
        current_timestamp()
    );
end //
DELIMITER ;


DELIMITER //
create trigger tr_actualizar_producto
after update on producto_servicio
for each row
begin
    insert into bitacora_auditoria (id_usuario, accion, fecha)
    values (
        (select id_usuario from empresa where id_empresa = new.id_empresa),
        'producto/servicio actualizado',
        current_timestamp()
    );
end //
DELIMITER ;


DELIMITER //
create trigger tr_eliminar_producto
before delete on producto_servicio
for each row
begin
    insert into bitacora_auditoria (id_usuario, accion, fecha)
    values (
        (select id_usuario from empresa where id_empresa = old.id_empresa),
        'producto/servicio eliminado',
        current_timestamp()
    );
end //
DELIMITER ;



-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA RESERVA --
DELIMITER //
create trigger tr_insertar_reserva
after insert on Reserva
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Reserva creada', current_timestamp());
end //

create trigger tr_eliminar_reserva
after delete on Reserva
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (old.id_usuario, 'Reserva cancelada', current_timestamp());
end //

DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA DETALLE RESERVA --
DELIMITER //
create trigger tr_insertar_detalle_reserva
after insert on Detalle_Reserva
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (null, 'Detalle de reserva agregado', current_timestamp());
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA PAGO --
DELIMITER //
create trigger tr_insertar_pago
after insert on Pago
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Pago realizado', current_timestamp());
end //

create trigger tr_prevenir_modificar_pago
before update on Pago
for each row
begin
    if old.estado = 'completado' then
        signal sqlstate '45000' set message_text = 'No se puede modificar un pago que ya ha sido completado';
    end if;
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA CALIFICAICÓN DESTINO --
DELIMITER //
create trigger tr_insertar_calificacion
after insert on Calificacion_Destino
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Calificación de destino creada', current_timestamp());
end //

create trigger tr_prevenir_modificacion_calificacion
before update on Calificacion_Destino
for each row
begin
    signal sqlstate '45000' set message_text = 'No se puede modificar una calificación de destino';
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --



-- TRIGGERS TABLA RESEÑA EMPRESA --
DELIMITER //
create trigger tr_insertar_resena
after insert on Resena_Empresa
for each row
begin
    insert into Bitacora_Auditoria (id_usuario, accion, fecha)
    values (new.id_usuario, 'Reseña de empresa creada', current_timestamp());
end //

create trigger tr_prevenir_modificar_resena
before update on Resena_Empresa
for each row
begin
    signal sqlstate '45000' set message_text = 'No se puede modificar una reseña de empresa';
end //
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


-- TRIGGERS TABLA CONTENIDO --
-- Evitar precios negativos antes de insertar
DELIMITER //
create trigger before_insert_contenido
before insert on contenido
for each row
begin
    if new.precio < 0 then
        signal sqlstate '45000'
        set message_text = 'El precio no puede ser negativo';
    end if;
end;
//

-- Evitar precios negativos antes de actualizar
create trigger before_update_contenido
before update on contenido
for each row
begin
    if new.precio < 0 then
        signal sqlstate '45000'
        set message_text = 'El precio no puede ser negativo';
    end if;
end;
//

-- Registrar cambios en contenido después de una actualización
create table if not exists historial_contenido (
    id_historial int primary key auto_increment,
    id_contenido int,
    titulo_anterior varchar(200),
    descripcion_anterior text,
    precio_anterior decimal(10,2),
    fecha_cambio timestamp default current_timestamp,
    foreign key (id_contenido) references contenido(id_contenido) on delete cascade
);
//

create trigger after_update_contenido
after update on contenido
for each row
begin
    insert into historial_contenido (id_contenido, titulo_anterior, descripcion_anterior, precio_anterior)
    values (old.id_contenido, old.titulo, old.descripcion, old.precio);
end;
//

-- Registrar eliminaciones en contenido
create table if not exists eliminaciones_contenido (
    id_eliminacion int primary key auto_increment,
    id_contenido int,
    titulo varchar(200),
    descripcion text,
    precio decimal(10,2),
    fecha_eliminacion timestamp default current_timestamp
);
//

create trigger after_delete_contenido
after delete on contenido
for each row
begin
    insert into eliminaciones_contenido (id_contenido, titulo, descripcion, precio)
    values (old.id_contenido, old.titulo, old.descripcion, old.precio);
end;
//
DELIMITER ;


-- ----------------------------------------------------------------------------------------------------------- --


 


-- ----------------------------------------------------------------------------------------------------------- --

-- NOMBRES PROCEDIMIENTOS ALMACENADOS 
-- TABLA USUARIO --                        
insertar_usuario
consultar_usuario_id
consultar_usuarios
actualizar_usuario
eliminar_usuario



-- TABLA DESTINO --
insertar_destino
consultar_destino_id
consultar_destinos
actualizar_destino
eliminar_destino

-- TABLA EMPRESA --
insertar_empresa
consultar_empresa_id
consultar_empresas
actualizar_empresa
eliminar_empresa

-- TABLA PRODUCTO SERVICIO --
insertar_producto_servicio
consultar_producto_id
consultar_productos
actualizar_producto_servicio
eliminar_producto_servicio

-- TABLA RESERVA --
insertar_reserva
consultar_reserva_id
consultar_reservas
actualizar_reserva
eliminar_reserva

-- TABLA DETALLE RESERVA --
insertar_detalle_reserva
consultar_detalle_reserva_id
consultar_detalles_reservas
actualizar_detalle_reserva
eliminar_detalle_reserva

-- TABLA METODO PAGO --
insertar_metodo_pago
consultar_metodo_pago_id
consultar_metodos_pago
actualizar_metodo_pago
eliminar_metodo_pago

-- TABLA PAGO --
insertar_pago
consultar_pago_id
consultar_pagos
actualizar_pago
eliminar_pago

-- TABLA CALIFICAICÓN DESTINO --
insertar_calificacion_destino
consultar_calificacion_id
consultar_todas_calificaciones
actualizar_calificacion
eliminar_calificacion

-- TABLA RESEÑA EMPRESA --
insertar_resena_empresa
consultar_resena_id
consultarresenas
actualizar_resena
eliminar_resena

-- TABLA BITACORA AUDITORIA --
insertar_bitacora_auditoria
consultar_bitacora_id
consultar_toda_bitacora
eliminar_registro_bitacora

-- TABLA CONTENIDO --
insertar_contenido
consultar_contenido_id
consultar_contenidos
actualizar_contenido
eliminar_contenido

use tourisme;
-- CRUD A LA TABLA ROL --
call insertar_rol('Usuario');
call insertar_rol('Negocio');
call insertar_rol('Administrador');

call consultar_roles();
call consultar_rol_id(2);

call actualizar_rol(2, 'Negocio');
call consultar_roles();

call eliminar_rol(3);
call consultar_roles();


alter table resena_empresa
drop constraint resena_empresa,
add constraint resena_empresa check (calificacion between 1 and 5);

use tourisme;
select table_name, constraint_name
from information_schema.table_constraints
where table_name = 'resena_empresa';

alter table resena_empresa drop constraint resena_empresa_chk_1;

alter table resena_empresa
add constraint resena_empresa_chk_1 check (calificacion between 1 and 5);


alter table reserva
modify column fecha_reserva date not null;

alter table reserva
drop foreign key reserva_ibfk_2,
drop column id_destino;

alter table contenido 
add column estado enum('Activo', 'Inactivo') default 'Activo';

alter table autenticacion
add constraint unique_correo unique (correo);




select * from information_schema.TRIGGERS
where TRIGGERS_SCHEMA = 'tourisme';



create user 'tourisme_user'@'%' identified by 'TourismeDB2025*!';
grant all privileges on tourisme_db. * to 'tourisme_user'@'%';
flush privileges;


DROP USER 'tourisme_user'@'%';
FLUSH PRIVILEGES;


use tourisme;
DROP USER 'tourisme'@'%';
SELECT user, host FROM mysql.user;

use tourisme_db;

-- Crear usuario mariana con todos los privilegios
CREATE USER 'mariana'@'%' IDENTIFIED BY '12345*';
GRANT ALL PRIVILEGES ON tourisme_db.* TO 'mariana'@'%';

-- Crear usuarios con permisos de solo lectura
CREATE USER 'daniel'@'%' IDENTIFIED BY '12345*';
CREATE USER 'alexis'@'%' IDENTIFIED BY '12345*';
CREATE USER 'miguel'@'%' IDENTIFIED BY '12345*';

-- Asignar permisos de solo lectura a los demás usuarios
GRANT SELECT ON tourisme_db.* TO 'daniel'@'%';
GRANT SELECT ON tourisme_db.* TO 'alexis'@'%';
GRANT SELECT ON tourisme_db.* TO 'miguel'@'%';

-- Aplicar cambios
FLUSH PRIVILEGES;

SELECT user, host FROM mysql.user;

ALTER USER 'mariana'@'%' IDENTIFIED BY 'Tourisme_DB2025*!';
FLUSH PRIVILEGES;


use tourisme;
SELECT user, host FROM mysql.user;

drop user 'daniel'@'%';
drop user 'alexis'@'%';
drop user 'miguel'@'%';
drop user 'mariana'@'%';
