create database teste;


-- Tabela usuario

create table usuario (
	idUsuario int primary key auto_increment,
    cnpj varchar (50) not null,
    razaoSocial varchar (80) not null,
    email varchar (50) not null,
    senha varchar (12) not null,
    telefone varchar (20) not null
) auto_increment =100;

insert into usuario values 
	(null, '60.746.948/0001-12', 'Assai Atacadista', 'assai.atacadista@assai.com', 'assai123', '+55 11 22850583'),
    (null, '30.533.432/0002-14', 'Boa Vista', 'boa.vista@boavista.com', 'boavista123', '+55 11 25378986'),
    (null, '90.846.443/0005-38', 'Fazenda Pamplona', 'fazenda.pamplona@pamplona.com', 'fazenda123', '+55 11 54807124'),
    (null, '69.242.676/0009-68', 'Oba', 'oba@oba.com', 'oba123', '+55 11 55338902');
 
 select * from usuario;
    
    
create table estufa(
	idestufa int primary key auto_increment,
    fkUsuario int,
    nomeEstufa varchar(20),
    foreign key (fkUsuario) references usuario(idUsuario)
) auto_increment = 500;

insert into estufa (fkusuario,nomeEstufa) values 
	(100, 'Estufa A'),
    (100,'Estufa B'),
	(101, 'Estufa A'),
    (102,'Estufa Delta'),	
    (103,'Estufa do Soso'),	
    (103, 'Estufa A')
    ;

create table descricao (
	idDesc int primary key auto_increment,
    nome varchar (50) not null,
    nomeCientifico varchar (50) not null,
    descricao varchar (300) not null,
    tempMax int not null,
    tempMin int not null
);

create table erva (
	idErva int primary key auto_increment,
    fkDesc int,
    fkEstufa int,
    setor varchar(45),
    foreign key (fkDesc) references descricao(idDesc),
    foreign key (fkEstufa) references estufa(idestufa)
    
);

insert into erva (fkdesc,fkestufa,setor) values
	(1,500,'Setor Alfa'),
	(2,500,'Setor Beta'),
    (1,501,'Setor Azul'),
    (3,501,'Setor Vermelho'),
    (3,502,'Setor Alfa'),
    (1,502,'Setor Beta'),
    (2,502,'Setor Delta'),
    (1,503,'Setor 1'),
    (2,503,'Setor 2'),
    (3,504,'Setor do soso'),
    (1,505,'Setor 404');
    
create table sensor (
	idSensor int primary key auto_increment,
	tiposensor varchar(20),
    statusSensor varchar(20),
    fkErva int,
    foreign key (fkErva) references erva(idErva),
    check (statusSensor='ativo' or statusSensor='inativo'),
    check (tiposensor ='luminosidade' or tiposensor = 'temperatura')
)   auto_increment=1000;

insert into sensor (tiposensor,statusSensor,fkerva) values
	('temperatura','ativo',1),
	('temperatura','ativo',2),
    ('temperatura','ativo',3),
    ('temperatura','ativo',4),
	('temperatura','ativo',7),
	('temperatura','ativo',6),
    ('temperatura','ativo',8),
   	('temperatura','ativo',10),
    ('temperatura','ativo',11), 
    ('temperatura','ativo',9);
    
    select * from sensor;
    
  create table registro(
	idRegistro int auto_increment primary key,
	Medida float,
    dataRegistro datetime default current_timestamp,
    fksensor int,
    foreign key (fksensor) references sensor(idsensor)
    )auto_increment = 7000;
    
    insert into registro (medida,fksensor) values 
		(30,1000),
        (29,1000),
        (24,1001),
        (23,1002),
        (19,1003),
        (32,1004),
		(30,1005),
        (29,1006),
        (24,1007),
        (23,1008),
        (19,1009)
        ;
    
    
    -- Inserção de dados
    
insert into descricao values
	(null, 'Babosa', 'Aloe vera', 'O clima da babosa é equatorial, tropical e subtropical. Ela trata feridas, queimaduras e inflamacoes na pele.', 40 , 18),
    (null, 'Camomila', 'Matricaria chamomilla', 'O clima da camomila é temperado, frio e úmido. Ela trata ansiedade e insônia.', 22, 18 ),
	(null, 'Gengibre', 'Zingiber officinale', 'O clima do gengibre é tropical e subtropical. Ele trata rouquidão e problemas na garganta.', 35, 17);
    
    

select * from usuario;    
select * from descricao;
select * from estufa;
select * from erva;
select * from sensor;
select * from registro;


select 
	usuario.razaoSocial,
    descricao.nome as 'erva plantada',
    estufa.nomeEstufa,
    erva.setor,
    sensor.statusSensor as 'Status do Sensor',
    sensor.tiposensor as 'Tipo de Sensor',
    sensor.idsensor,
    registro.dataRegistro,
    registro.Medida
	from 
		usuario,
		descricao,
		estufa,
		erva,
		sensor,
		registro
	where
		idUsuario=fkusuario 	
	and
		idestufa=fkEstufa
	and
		idDesc=fkdesc
	and
		idsensor=fksensor
	and
		iderva=fkerva;
        

		