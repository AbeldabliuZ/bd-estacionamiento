--registrar cliente
INSERT INTO clientes(nombre, apellido, email, telefono)
VALUES 
	('Erick','Montes','erickgameryt@gmail.com','0987426854');
		--vizualizacion
Select
	id_client, nombre, apellido, telefono, email
from clientes;



-- registrar vehiculo con el id del nuevo cliente
INSERT INTO vehiculo(matricula, marca, modelo, id_client)
VALUES
		('TYEEY874', 'volkswagen', 'gol 2008',6);
--visualizacion
SELECT
	v.id_vehiculo,
	v.matricula,
	v.marca,
	v.modelo,
	c.id_client,
	c.nombre,
	c.apellido,
	c.telefono
FROM vehiculo v 
LEFT JOIN clientes c ON v.id_client=c.id_client
WHERE v.matricula= 'TYEEY874';



--relacionar cliente-empleado para definir el encargado
INSERT INTO relacioncli(id_client, id_emp)
VALUES(6, 5);



--asignar un espacio a un vehiculo 
update espacios
set estado='ocupado', id_vehiculo=7
where id_espacio=8;


-- liberar un espacio
update espacios
set estado='libre', id_vehiculo=NULL
WHERE id_espacio=8;


--registrar un nuevo empleado en la base de datos
INSERT INTO empleados(nombre_emp, apellido_emp, telefono_emp, email_emp)
VALUES ('Sergio', 'Ramirez', '0965412587', 'sergiram@gmail.com');


--registrar un mantenimiento
INSERT INTO mantenimiento(id_espacio, id_emp, fecha)
VALUES (5, 6 , '16/05/25');


--Para ver la tabla del parking:
SELECT * FROM vista_parkin;


--Para acceder al historial de mantenimientos:
SELECT * FROM vista_mantenimiento;

