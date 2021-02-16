create database escuela
use escuela

--Tabla carrera
create table carrera(
clave_c int,
nom_c varchar(30),
durac_c float,
constraint pk_cc primary key (clave_c)
)

insert into carrera values(1,'Ingenieria de Sistemas',4)
insert into carrera values(2,'Contabilidad',4)

select * from carrera

--Tabla materia
create table materia(
clave_m int,
nom_m varchar(50),
cred_m float,
constraint pk_cm primary key(clave_m)
)

insert into materia values(1,'Base de datos',4)
insert into materia values (2,'Programacion',6)

select clave_m, nom_m from materia

--Tabla profesor
create table profesor(
clave_p int,
nom_p varchar(150),
dir_p varchar(200),
tel_p bigint,
hor_p varchar(15),
constraint pk_cp primary key(clave_p)
)

insert into profesor values(1,'Smerlin Fernandez','Calle 25 #26',8295560945,'7:00')

select * from profesor

/*Tabla alumno
(con llave foranea de carrera)*/
create table alumno(
mat_alu int,
nom_alu varchar(150),
edad_alu tinyint,
sem_alu tinyint,
gen_alu varchar(10),
clave_c1 int,
constraint pk_calu primary key(mat_alu),
constraint fk_fc1 foreign key(clave_c1) references carrera(clave_c)
)

insert into alumno values(1,'Rlm Perez',18,1,'Femenino',1)


--Alumno-profesor
create table alu_pro(
mat_alu1 int,
clave_p1 int,
constraint fk_falu1 foreign key(mat_alu1) references alumno(mat_alu),
constraint fk_fp1 foreign key(clave_p1) references profesor(clave_p)
)

insert into alu_pro values(1,1)

--Materia-Alumno
create table mat_alu(
clave_m1 int,
mat_alu2 int,
constraint fk_fm1 foreign key (clave_m1) references materia(clave_m),
constraint fk_falu2 foreign key (mat_alu2) references alumno(mat_alu)
)

insert into mat_alu values(1,1)

--Materia-profesor
create table mat_pro(
clave_m2 int,
clave_p2 int,
constraint fk_fm2 foreign key(clave_m2) references materia(clave_m),
constraint fk_fp2 foreign key(clave_p2) references profesor(clave_p)
)


insert into mat_pro values(1,1)

--insertar datos

/*Insert*/
--Tabla carrera
insert into carrera values (3,'Diseño',3)

--Tabla materia
insert into materia values(3,'Dibujo',15)
insert into materia values(4,'Programación',20)

--Tabla alumno
insert into alumno values(2,'Sergio',19,7,'Hombre',2)
insert into alumno values(3,'Julieta',20,6,'Mujer',3)

--Alumno-Profesor
insert into alu_pro values(2,1)
insert into alu_pro values(3,1)

--Materia-ALumno
insert into mat_alu values(4,2)
insert into mat_alu values(3,3)
insert into mat_alu values(4,1)

--Seleccionar con inner join para unir tablas
select mat_alu, nom_alu,edad_alu,gen_alu,nom_c,nom_p,nom_m
from alumno inner join carrera on carrera.clave_c =alumno.clave_c1
inner join alu_pro on alu_pro.mat_alu1 = alumno.mat_alu
inner join profesor on profesor.clave_p = alu_pro.clave_p1
inner join mat_alu on mat_alu.mat_alu2 = alumno.mat_alu
inner join materia on materia.clave_m = mat_alu.clave_m1
where clave_c = 1


select alumno.nom_alu,profesor.nom_p
from alumno inner join alu_pro on alu_pro.mat_alu1 = alumno.mat_alu
inner join profesor on profesor.clave_p = alu_pro.clave_p1

update profesor
set nom_p = 'Juan RLM'
where clave_p = 1

select * from profesor