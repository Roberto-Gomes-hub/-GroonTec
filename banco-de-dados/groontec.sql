create database gronntech;
use gronntech;

create table usuario (
	idUsuario int primary key auto_increment,
    cnpj varchar (50) not null,
    razaoSocial varchar (80) not null,
    email varchar (50) not null,
    senha varchar (12) not null,
    telefone varchar (20) not null,
    tipo char (1) not null
);

-- tipo: 1 = Produtor 
--       2 = Cliente do Produtor

insert into usuario values 
	(null, '60.746.948/0001-12', 'Assai Atacadista', 'assai.atacadista@assai.com', 'assai123', '+55 11 22850583', '2'),
    (null, '30.533.432/0002-14', 'Boa Vista', 'boa.vista@boavista.com', 'boavista123', '+55 11 25378986', '2' ),
    (null, '90.846.443/0005-38', 'Fazenda Pamplona', 'fazenda.pamplona@pamplona.com', 'fazenda123', '+55 11 54807124', '1' ),
    (null, '69.242.676/0009-68', 'Oba', 'oba@oba.com', 'oba123', '+55 11 55338902', '1');
    
select * from usuario;

-- O nosso serviço possuirá as informações e os parâmetros de 3 ervas determinadas, babosa, gengibre e camomila

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

-- Guilherme Guedes lindao 
select razaoSocial from  usuario order by razaoSocial desc;
select * from ervas where nomeCientifico like '%a';

-- Guilherme Sousa 
SELECT tempMin, tempMax FROM ervas ORDER BY tempMin ASC;
SELECT * FROM ervas WHERE descricao like '%tropical%';

-- Roberto Gomes 
ALTER TABLE usuario RENAME COLUMN telefone TO fone;
UPDATE ervas SET nome = 'Hortelã' where idErvas = 2;

-- Luis Gustavo
alter table usuario modify email varchar (50) not null unique;





