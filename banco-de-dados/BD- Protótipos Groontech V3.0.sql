create database groontech;
use groontech;

-- Tabela usuario

create table usuario (
	idUsuario int auto_increment,
	fkempresa int,
    cpf varchar (50) not null,
    telefoneCell varchar (20) not null,
    email varchar (50) not null,
    senha varchar (12) not null,
    perfil varchar (8) not null,
    check (perfil = 'Adm' or perfil = 'Técnico'),
    primary key (idUsuario, fkempresa),
    foreign key (fkempresa) references empresa(idEmpresa)
) auto_increment =100 ;

insert into usuario values 
	(null, '1', '448.663.458-95', '+55 11 22850583', 'gabi.foschini@gmail.com', 'gabi123', 'Técnico' ),
    (null, '2', '450.088.456-35', '+55 11 25378986', 'yudi.lucas@gmail.com', 'yudi123', 'Técnico'),
    (null, '3', '861.348.956.12', '+55 11 54807124', 'guilherme.soares@gmail.com', 'soares123', 'Adm' ),
    (null, '4', '325.756.184-34', '+55 11 55338902', 'roberto.gomes@gmail.com', 'roberto123', 'Adm' );
 
 select * from usuario;
 
 create table empresa (
	idEmpresa int primary key auto_increment,
    cnpj char(14) not null,
    razaoSocial char(45) not null,
    email varchar(60) not null,
    senha varchar(16) not null,
    telefoneFixo char(12) not null
 );
 
 insert into empresa values 
 (null,'45654876461245','asscai.ltda', 'assai@assai.com', 'assai123', '11 4535-4877' ),
 (null, '45612547896542', 'coca cola.ltda', 'coca@cola.com' , 'cocacola123', '11 4632-1411' ),
 (null, '15487979553230', 'fanta.ltda', 'fanta@fanta.com', 'fanta123', '11 6568-4564'),
 (null, '56421214458412', 'fazenda lonpona', 'fazenda.lonpona@lonpona.com', 'lonpona123', '12 4512-5323');
    
create table estufa(
	idestufa int primary key auto_increment,
    fkEmpresa int,
    nomeEstufa varchar(20),
    foreign key (fkEmpresa) references empresa(idEmpresa)
) auto_increment = 500;

insert into estufa values 
	(null, '1', 'Estufa A'),
    (null, '2','Estufa B'),
	(null, '3', 'Estufa A'),
    (null, '4','Estufa Delta');
    
    
    
create table Acesso (
	fkUsuario int,
    fkEstufa int,
    foreign key (fkEstufa) references estufa(idEstufa),
    foreign key (fkUsuario) references usuario(idUsuario),
    visualizar varchar(3) default 'sim',
    editar varchar(3),
    primary key (fkUsuario, fkEstufa),
    check (visualizar = "sim" or visualizar = "não"),
    check (editar = 'sim' or editar = 'não')
);

insert into Acesso values
('104', '500', default , 'sim'),
('105' ,'501', default , 'não'),
('106', '502', 'não', 'sim'),
('107', '503', 'não', 'não');


create table erva (
	idErva int primary key auto_increment,
    nome varchar (50) not null,
    nomeCientifico varchar (50) not null,
    descricao varchar (300) not null,
    tempMax float not null,
    tempMin float not null
);
insert into erva values 
	(null, 'Babosa', 'Aloe vera', 'O clima da babosa é equatorial, tropical e subtropical. Ela trata feridas, queimaduras e inflamacoes na pele.', 40 , 18 ),
    (null, 'Camomila', 'Matricaria chamomilla', 'O clima da camomila é temperado, frio e úmido. Ela trata ansiedade e insônia.', 22, 18 ),
	(null, 'Gengibre', 'Zingiber officinale', 'O clima do gengibre é tropical e subtropical. Ele trata rouquidão e problemas na garganta.', 35, 17);


create table Setor (
	idSetor int primary key auto_increment,
    fkErva int,
    fkEstufa int,
    foreign key (fkErva) references erva(idErva),
    foreign key (fkEstufa) references estufa(idestufa),
    nomeSetor varchar(45)
);

insert into setor (idSetor, fkerva, fkestufa, nomeSetor)  values
	(null, '1','500','Setor Alfa'),
	(null, '2','500','Setor Beta'),
    (null, '1','501','Setor Azul'),
    (null, '3','501','Setor Vermelho'),
    (null, '3','502','Setor Alfa'),
    (null, '1','502','Setor Beta'),
    (null, '2','502','Setor Delta'),
    (null, '1','503','Setor 1'),
    (null, '2','503','Setor 2'),
    (null, '3','502','Setor do soso'),
    (null, '1','500','Setor 404');
    
create table sensor (
	idSensor int primary key auto_increment,
	tiposensor varchar(20),
    statusSensor varchar(20) default 'Ativo',
    fkSetor int,
    foreign key (fkSetor) references Setor(idSetor),
    check (statusSensor='ativo' or statusSensor='inativo'),
    check (tiposensor ='luminosidade' or tiposensor = 'temperatura')
)   auto_increment=1000;
select * from setor;
insert into sensor  values
	(null, 'temperatura','ativo',1),
	(null, 'temperatura','ativo',2),
    (null, 'temperatura','ativo',3),
    (null,'temperatura','ativo',4),
	(null,'temperatura','ativo',7),
	(null,'temperatura','ativo',6),
    (null,'temperatura','ativo',8),
   	(null,'temperatura','ativo',10),
    (null,'temperatura','ativo',11), 
    (null,'temperatura','ativo',9);
    
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
        
    

select * from usuario;    
select * from erva;
select * from estufa;
select * from empresa;
select * from sensor;
select * from registro;
select * from acesso;
select * from setor;


select 
	usuario.perfil,
    erva.nome as 'erva plantada',
    estufa.nomeEstufa,
    setor.nomeSetor,
    sensor.statusSensor as 'Status do Sensor',
    sensor.tiposensor as 'Tipo de Sensor',
    sensor.idsensor,
    registro.dataRegistro,
    registro.Medida
	from 
		usuario,
		erva,
		estufa,
		setor,
		sensor,
		registro,
        acesso
	where
		idUsuario=fkUsuario 	
	and
		idestufa=setor.fkEstufa
	and
		iderva=fkerva
	and
		idsensor=fksensor
	and
		idSetor=fksetor;
        

drop database groontech;