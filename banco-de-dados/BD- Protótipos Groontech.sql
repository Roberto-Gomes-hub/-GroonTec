create database teste;

-- Tabela usuario
create table usuario (
	idUsuario int primary key auto_increment,
    cnpj varchar (50) not null,
    razaoSocial varchar (80) not null,
    email varchar (50) not null,
    senha varchar (12) not null,
    telefone varchar (20) not null,
    tipo char (1) not null 
) auto_increment =100;

-- identifica o cliente em produtor(1) e comprador(0)

insert into usuario values 
	(null, '60.746.948/0001-12', 'Assai Atacadista', 'assai.atacadista@assai.com', 'assai123', '+55 11 22850583', '2'),
    (null, '30.533.432/0002-14', 'Boa Vista', 'boa.vista@boavista.com', 'boavista123', '+55 11 25378986', '2' ),
    (null, '90.846.443/0005-38', 'Fazenda Pamplona', 'fazenda.pamplona@pamplona.com', 'fazenda123', '+55 11 54807124', '1' ),
    (null, '69.242.676/0009-68', 'Oba', 'oba@oba.com', 'oba123', '+55 11 55338902', '1');


-- Tabela com informações sobre as ervas plantadas
create table ervas (
	idErvas int primary key auto_increment,
    nome varchar (50) not null,
    nomeCientifico varchar (50) not null,
    descricao varchar (300) not null,
    tempMax int not null,
    tempMin int not null
);

insert into ervas values
	(null, 'Babosa', 'Aloe vera', 'O clima da babosa é equatorial, tropical e subtropical. Ela trata feridas, queimaduras e inflamacoes na pele.', 40 , 18 ),
    (null, 'Camomila', 'Matricaria chamomilla', 'O clima da camomila é temperado, frio e úmido. Ela trata ansiedade e insônia.', 22, 18 ),
	(null, 'Gengibre', 'Zingiber officinale', 'O clima do gengibre é tropical e subtropical. Ele trata rouquidão e problemas na garganta.', 35, 17);
    
   select * from ervas;

-- Tabela dos sensores
create table sensor (
	idSensor int primary key auto_increment,
	tiposensor varchar(20),
    statusSensor varchar(20),
    fkErvas int,
    fkusuario int,
    foreign key (fkusuario) references usuario(idusuario),
    foreign key (fkErvas) references ervas(idervas),
    check (statusSensor='ativo' or statusSensor='inativo'),
    check (tiposensor ='luminosidade' or tiposensor = 'temperatura')
)   auto_increment=1000;

insert into sensor (tiposensor,statussensor,fkervas,fkusuario) values
	('temperatura','ativo',1,101 ) ,
    ('temperatura','ativo',3,101 ) ,
    ('temperatura','ativo',2,101 ) ,
    ('temperatura','ativo',1,103 ) ,
    ('temperatura','ativo',1,102 ) ,
    ('temperatura','ativo',1,102 ) ;
    
    select * from sensor;
    -- seleciona as informações de sensores, as empresas que os possuem e o tipo de erva que monitoram.
    select sensor.*, ervas.nome, usuario.razaosocial from sensor, ervas, usuario where fkervas=idervas and fkusuario=idusuario;
    
    -- Tabelas de registros
    create table registro(
	idRegistro int auto_increment primary key,
    luminosidade varchar(10),
    temperatura float,
    dataRegistro datetime default current_timestamp,
    fksensor int,
    foreign key (fksensor) references sensor(idsensor)
    )auto_increment = 7000;
    
	insert into registro(temperatura,fksensor) values
						(23.4, 1000),
						(23.6, 1000),
                        (23.5, 1000),
                        (25.1, 1001),
                        (24.5, 1002),
                        (24.3, 1002),
                        (27.5, 1003),
                        (21.5, 1004),
                        (25.2, 1005);

	select * from registro;
    
    
-- Exibir registros de um sensor determinado e os dados relacionados a ele
select 
	sensor.*, 
	ervas.nome as 'Tipo de erva', 
	usuario.razaosocial as 'Nome da empresa'  ,
    registro.temperatura,
    registro.dataregistro
from 
	sensor, 
	ervas, 
	usuario,
	registro
where 
	fkervas=idervas 
and 
	fkusuario=idusuario 
and 
	fksensor=1000 
and 
	idsensor=fksensor;
    
-- Exibir registros dos sensores de um determinado usuario
select 
	sensor.idSensor, 
	sensor.tiposensor,
	sensor.statusSensor,
	registro.temperatura,
	registro.dataregistro,
	ervas.nome as 'Tipo de erva', 
	usuario.razaosocial as 'Nome da empresa'
from 
	sensor, 
	ervas, 
	usuario,
	registro
where 
	fkervas=idervas 
and 
	fkusuario=idusuario 
and
	idsensor=fksensor
and 
	idusuario =101
    
    
    