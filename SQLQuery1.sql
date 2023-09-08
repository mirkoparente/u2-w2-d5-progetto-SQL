create table Anagrafica(
IdAnagrafica int primary key identity,
Nome nvarchar(20) not null,
Cognome nvarchar(20) not null,
Indirizzo nvarchar(100),
Citta nvarchar (50),
CAP nvarchar(5),
CodFisc nvarchar(16) unique
)

create table TipoViolazione(
IdViolazione int primary key identity,
Descrizione nvarchar(max) not null
)

create table Verbale(
IdVerbale int primary key identity,
DataViolazione Datetime not null,
IndirizzoViolazione nvarchar(100) not null,
NominativoAgente nvarchar(50),
DataTrascrizione Datetime not null,
Importo money not null,
Decurtamento bit not null,
IdAnagrafica int,
foreign key(IdAnagrafica) references Anagrafica(IdAnagrafica),
IdViolazione int,
foreign key(IdViolazione) references TipoViolazione(IdViolazione)

)


Alter table Verbale
alter column DataViolazione date 

Alter table Verbale
alter column DataTrascrizione date 


Insert into Anagrafica 
values ('Mario', 'Rossi', 'Via Roma 1', 'Milano', '20100', 'ABCDEF12G34H567I'),('Luigi', 'Bianchi', 'Via Garibaldi 2', 'Roma', '00100', 'DEFGHI34J56K789L'),('Anna', 'Verdi','Via Napoli 3',  'Napoli', '80100', 'MNBVCX23Z45Y678O'),('Giovanni', 'Gialli', 'Via Vittorio 4', 'Napoli', '80100', 'FGHIJK12L34M567N')

Insert into TipoViolazione
values ('Eccesso di velocità'),('Guida senza cintura'),('Semaforo rosso'),('Stato di ebbrezza')


Insert into Verbale
values ('2023/09/01' , 'Via Monti 1', 'Agente Rossi', '2023/09/02 ', 200, 1, 2, 1),('2023/08/15 ', 'Piazza di Spagna', 'Agente Rossi', '2023/08/16 ', 100, 1, 2, 2),('2023/09/03 ', 'Piazza Garibaldi', 'Agente Gialli', '2023/09/04 ', 190.50, 1, 4, 4),('2023/08/28 ', 'Via Nazionale 1', 'Agente Blu', '2023/08/29 ', 350, 0, 3, 3)

alter table Verbale
alter column Decurtamento int

update Verbale
set Decurtamento=10
where IdVerbale between 3 and 6

select count(*) from Verbale

select Nome, Cognome,COUNT(Verbale.idverbale)
from Anagrafica
inner join Verbale  on Anagrafica.idanagrafica = Verbale.idanagrafica
group by  Anagrafica.Nome,Anagrafica.Cognome;

select Descrizione,COUNT(Verbale.idverbale) as NumeroMulte
from TipoViolazione
inner join Verbale  on TipoViolazione.IdViolazione = Verbale.idanagrafica
group by  TipoViolazione.Descrizione;

select Nome, Cognome, sum(Verbale.Decurtamento) as TotalePunti
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
group by Anagrafica.nome, Anagrafica.Cognome

update Anagrafica
set Citta ='Palermo'
where IdAnagrafica=4


select Nome,Cognome,Verbale.DataViolazione,Verbale.IndirizzoViolazione,Verbale.Importo,Verbale.Decurtamento 
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
where Anagrafica.Citta='Palermo'

Insert into Anagrafica 
values ('Marco', 'Rossi', 'Via Roma 5', 'Milano', '20100', 'ABUDEF12G34H567I'),('Pippo', 'Bianchi', 'Via Garibaldi 22', 'Roma', '00100', 'VEFGHI34J56K789L')

Insert into Verbale
values ('2009/02/12' , 'Via Monti 1', 'Agente Rossi', '2009/02/13 ', 200, 8, 6, 1),('2009/07/15 ', 'Piazza di Spagna', 'Agente Rossi', '2008/07/16 ', 100, 15, 7, 2)


select Nome,Cognome,Verbale.DataViolazione,Verbale.IndirizzoViolazione,Verbale.Importo,Verbale.Decurtamento 
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
where Verbale.DataViolazione between '2009/02/01' and '2009/07/01'

select Nome,Cognome ,Sum(Verbale.Importo) as TotaleMulte from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
group by Anagrafica.Nome,Anagrafica.Cognome

select * from Anagrafica
where Citta ='Palermo'

select NominativoAgente, count(*) as TotaleMulte from Verbale
group by NominativoAgente

update Verbale
set Decurtamento =5
where IdVerbale=6

select Nome,Cognome,Verbale.DataViolazione,Verbale.IndirizzoViolazione,Verbale.Importo,Verbale.Decurtamento 
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
where Verbale.Decurtamento>5



update Verbale
set Importo =560
where IdVerbale=6

select Nome,Cognome,Verbale.DataViolazione,Verbale.IndirizzoViolazione,Verbale.Importo,Verbale.Decurtamento 
from Anagrafica
inner join Verbale on Anagrafica.IdAnagrafica=Verbale.IdAnagrafica
where Verbale.Importo>400


update Verbale
set DataViolazione ='2023/09/03'
where IdVerbale=3