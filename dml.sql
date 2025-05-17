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


--Para ordenar los espacios con los vehículos e información de cada uno: 
SELECT
  esp.id_espacio AS parking,
  esp.estado AS estado,
  v.matricula AS placa,
  v.marca AS marca,
  v.modelo AS modelo,
  c.nombre AS nombre,
  c.apellido AS apellido,
  c.telefono AS telefono,
  emp.id_emp AS oficial,
  emp.nombre_emp AS nombre_oficial,
  emp.apellido_emp AS apellido_oficial
FROM
  espacios esp
JOIN
  vehiculo v ON esp.id_vehiculo = v.id_vehiculo
JOIN
  clientes c ON v.id_client = c.id_client
JOIN
  relacioncli r ON r.id_client = c.id_client
JOIN
  empleados emp ON r.id_emp = emp.id_emp
ORDER BY
  esp.id_espacio;


--Para acceder al historial de mantenimientos:
SELECT
  m.id_espacio AS espacio,
  m.id_emp AS personal,
  emp.nombre_emp AS nombre_personal,
  emp.apellido_emp AS apellido_personal,
	m.fecha AS fecha
FROM
  mantenimiento m
LEFT JOIN
  empleados emp ON m.id_emp = emp.id_emp;
