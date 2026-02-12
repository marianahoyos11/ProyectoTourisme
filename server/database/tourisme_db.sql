create database tourisme;
use tourisme;

select * from Rol;

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


-- PROCEDIMIENTOS ALMACENADOS TABLA USUARIO ACTUALIZADA --
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

-- CONSULTAR EN GENERAL --
DELIMITER //
create procedure consultar_categorias()
begin
    -- retornar todas las categorías
    select * from Categoria_Turistica;
end //
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
create procedure insertar_destino(
	in p_id_categoria int,
    in p_nombre varchar (100),
    in p_descripcion text,
    in p_ciudad varchar(100),
    in p_direccion varchar(100)
)
begin
	insert into Destinos_Turisticos(id_categoria, nombre, descripcion, ciudad, direccion)
    values(p_id_categoria,p_nombre, p_descripcion, p_ciudad, p_direccion);
end //
DELIMITER ;

-- CONSULTAR DESTINO POR ID --
DELIMITER //
create procedure consultar_destino_id(
	in p_id_destino int
)
begin
	select * from Destinos_Turisticos where id_destino = p_id_destino;
end //
DELIMITER ;

-- CONSULTAR DESTINO EN GENERAL --
DELIMITER //
create procedure consultar_destinos()
begin
	select * from  Destinos_Turisticos;
end //
DELIMITER ;

-- ACTUALIZAR DESTINO ACTUALIZADO --
DELIMITER //
create procedure actualizar_destino(
	in p_id_destino int,
    in p_id_categoria int,
    in p_nombre varchar(100),
    in p_descripcion text,
    in p_ciudad varchar(100),
    in p_direccion varchar(100)
)
begin
	update Destinos_Turisticos
    set id_categoria = p_id_categoria, nombre = p_nombre, descripcion = p_descripcion,
		ciudad = p_ciudad, direccion = p_direccion
	where id_destino = p_id_destino;
end //
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
