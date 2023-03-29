-- Gruppo [Group]
create table `gruppo` (
   `oid`  integer  not null,
   `group_name`  varchar(255),
  primary key (`oid`)
);


-- Modulo [Module]
create table `modulo` (
   `oid`  integer  not null,
   `module_id`  varchar(255),
   `module_name`  varchar(255),
  primary key (`oid`)
);


-- Utente [User]
create table `utente` (
   `oid`  integer  not null,
   `user_name`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Evento [ent1]
create table `evento` (
   `oid`  integer  not null,
   `orario_fine`  time,
   `orario_inizio`  time,
   `data`  date,
   `descrizione`  longtext,
   `titolo`  varchar(255),
  primary key (`oid`)
);


-- Staff [ent10]
create table `staff` (
   `utenteinterno_oid`  integer  not null,
  primary key (`utenteinterno_oid`)
);


-- Alumno [ent11]
create table `alumno` (
   `utenteinterno_oid`  integer  not null,
   `nazionalita`  varchar(255),
   `data_nascita`  date,
   `telefono`  varchar(255),
   `approvato`  bit,
  primary key (`utenteinterno_oid`)
);


-- Amministratore [ent12]
create table `amministratore` (
   `utenteinterno_oid`  integer  not null,
  primary key (`utenteinterno_oid`)
);


-- Indirizzo [ent13]
create table `indirizzo` (
   `oid`  integer  not null,
   `cap`  varchar(255),
   `citta`  varchar(255),
   `numero`  varchar(255),
   `via`  varchar(255),
  primary key (`oid`)
);


-- Qualifica [ent14]
create table `qualifica` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `istituzione`  varchar(255),
   `data_conseguimento`  date,
  primary key (`oid`)
);


-- Posizione [ent15]
create table `posizione` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `azienda`  varchar(255),
   `data_inizio`  date,
   `data_fine`  date,
   `descrizione`  longtext,
  primary key (`oid`)
);


-- EventoInEvidenza [ent16]
create table `eventoinevidenza` (
   `eventoinevidenza_oid`  integer  not null,
  primary key (`eventoinevidenza_oid`)
);


-- RaccoltaFondi [ent17]
create table `raccoltafondi` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `descrizione`  longtext,
   `totale_obiettivo`  double precision,
   `data_pubblicazione`  date,
  primary key (`oid`)
);


-- Donazione [ent18]
create table `donazione` (
   `oid`  integer  not null,
   `nome_donatore`  varchar(255),
   `ammontare`  double precision,
  primary key (`oid`)
);


-- Nazione [ent19]
create table `nazione` (
   `oid`  integer  not null,
  primary key (`oid`)
);


-- Ospite [ent2]
create table `ospite` (
   `oid`  integer  not null,
   `descrizione`  longtext,
   `cognome`  varchar(255),
   `nome`  varchar(255),
  primary key (`oid`)
);


-- Fotografia [ent3]
create table `fotografia` (
   `oid`  integer  not null,
   `descrizione`  longtext,
   `path`  varchar(255),
  primary key (`oid`)
);


-- EventoPubblico [ent4]
create table `eventoinevidenza` (
   `evento_oid`  integer  not null,
  primary key (`evento_oid`)
);


-- UtenteInterno [ent5]
create table `utenteinterno` (
   `utente_oid`  integer  not null,
   `cognome`  varchar(255),
   `nome`  varchar(255),
  primary key (`utente_oid`)
);


-- EventoRiservatoAlumni [ent6]
create table `eventoriservatoalumni` (
   `evento_oid`  integer  not null,
  primary key (`evento_oid`)
);


-- EventoRiservatoAziende [ent7]
create table `eventoriservatoaziende` (
   `evento_oid`  integer  not null,
  primary key (`evento_oid`)
);


-- Azienda [ent8]
create table `azienda` (
   `utente_oid`  integer  not null,
   `nome`  varchar(255),
   `approvata`  bit,
  primary key (`utente_oid`)
);


-- TipologiaEvento [ent9]
create table `tipologiaevento` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `gruppo`  add column  `modulo_oid`  integer;
alter table `gruppo`   add index fk_gruppo_modulo (`modulo_oid`), add constraint fk_gruppo_modulo foreign key (`modulo_oid`) references `modulo` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `gruppo_oid`  integer not null,
   `modulo_oid`  integer not null,
  primary key (`gruppo_oid`, `modulo_oid`)
);
alter table `group_module`   add index fk_group_module_gruppo (`gruppo_oid`), add constraint fk_group_module_gruppo foreign key (`gruppo_oid`) references `gruppo` (`oid`);
alter table `group_module`   add index fk_group_module_modulo (`modulo_oid`), add constraint fk_group_module_modulo foreign key (`modulo_oid`) references `modulo` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente`  add column  `gruppo_oid`  integer;
alter table `utente`   add index fk_utente_gruppo (`gruppo_oid`), add constraint fk_utente_gruppo foreign key (`gruppo_oid`) references `gruppo` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `utente_oid`  integer not null,
   `gruppo_oid`  integer not null,
  primary key (`utente_oid`, `gruppo_oid`)
);
alter table `user_group`   add index fk_user_group_utente (`utente_oid`), add constraint fk_user_group_utente foreign key (`utente_oid`) references `utente` (`oid`);
alter table `user_group`   add index fk_user_group_gruppo (`gruppo_oid`), add constraint fk_user_group_gruppo foreign key (`gruppo_oid`) references `gruppo` (`oid`);


-- Evento_Ospite [rel1]
alter table `ospite`  add column  `evento_oid`  integer;
alter table `ospite`   add index fk_ospite_evento (`evento_oid`), add constraint fk_ospite_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- Azienda_Indirizzo [rel11]
alter table `indirizzo`  add column  `azienda_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_azienda (`azienda_oid`), add constraint fk_indirizzo_azienda foreign key (`azienda_oid`) references `azienda` (`utente_oid`);


-- Staff_RaccoltaFondi [rel13]
alter table `raccoltafondi`  add column  `staff_oid`  integer;
alter table `raccoltafondi`   add index fk_raccoltafondi_staff (`staff_oid`), add constraint fk_raccoltafondi_staff foreign key (`staff_oid`) references `staff` (`utenteinterno_oid`);


-- RaccoltaFondi_Donazione [rel14]
alter table `donazione`  add column  `raccoltafondi_oid`  integer;
alter table `donazione`   add index fk_donazione_raccoltafondi (`raccoltafondi_oid`), add constraint fk_donazione_raccoltafondi foreign key (`raccoltafondi_oid`) references `raccoltafondi` (`oid`);


-- Utente_Evento [rel18]
create table `utente_evento` (
   `utente_oid`  integer not null,
   `evento_oid`  integer not null,
  primary key (`utente_oid`, `evento_oid`)
);
alter table `utente_evento`   add index fk_utente_evento_utente (`utente_oid`), add constraint fk_utente_evento_utente foreign key (`utente_oid`) references `utente` (`oid`);
alter table `utente_evento`   add index fk_utente_evento_evento (`evento_oid`), add constraint fk_utente_evento_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- Amministratore_Utente [rel19]
alter table `utente`  add column  `amministratore_oid`  integer;
alter table `utente`   add index fk_utente_amministratore (`amministratore_oid`), add constraint fk_utente_amministratore foreign key (`amministratore_oid`) references `amministratore` (`utenteinterno_oid`);


-- Evento_Fotografia [rel2]
alter table `fotografia`  add column  `evento_oid`  integer;
alter table `fotografia`   add index fk_fotografia_evento (`evento_oid`), add constraint fk_fotografia_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- Posizione_Indirizzo [rel20]
alter table `indirizzo`  add column  `posizione_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_posizione (`posizione_oid`), add constraint fk_indirizzo_posizione foreign key (`posizione_oid`) references `posizione` (`oid`);


-- Alumno_Indirizzo [rel21]
alter table `indirizzo`  add column  `alumno_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_alumno (`alumno_oid`), add constraint fk_indirizzo_alumno foreign key (`alumno_oid`) references `alumno` (`utenteinterno_oid`);


-- Tipologia Evento_Evento [rel3]
alter table `evento`  add column  `tipologiaevento_oid`  integer;
alter table `evento`   add index fk_evento_tipologiaevento (`tipologiaevento_oid`), add constraint fk_evento_tipologiaevento foreign key (`tipologiaevento_oid`) references `tipologiaevento` (`oid`);


-- Staff_Evento [rel4]
alter table `evento`  add column  `staff_oid`  integer;
alter table `evento`   add index fk_evento_staff (`staff_oid`), add constraint fk_evento_staff foreign key (`staff_oid`) references `staff` (`utenteinterno_oid`);


-- RaccoltaFondi_Evento [rel5]
alter table `raccoltafondi`  add column  `evento_oid`  integer;
alter table `raccoltafondi`   add index fk_raccoltafondi_evento (`evento_oid`), add constraint fk_raccoltafondi_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- Indirizzo_Nazione [rel6]
alter table `indirizzo`  add column  `nazione_oid`  integer;
alter table `indirizzo`   add index fk_indirizzo_nazione (`nazione_oid`), add constraint fk_indirizzo_nazione foreign key (`nazione_oid`) references `nazione` (`oid`);


-- Qualifica_Alumno [rel7]
alter table `qualifica`  add column  `alumno_oid`  integer;
alter table `qualifica`   add index fk_qualifica_alumno (`alumno_oid`), add constraint fk_qualifica_alumno foreign key (`alumno_oid`) references `alumno` (`utenteinterno_oid`);


-- Posizione_Alumno [rel8]
alter table `posizione`  add column  `alumno_oid`  integer;
alter table `posizione`   add index fk_posizione_alumno (`alumno_oid`), add constraint fk_posizione_alumno foreign key (`alumno_oid`) references `alumno` (`utenteinterno_oid`);


-- GEN FK: Staff --> UtenteInterno
alter table `staff`   add index fk_staff_utenteinterno (`utenteinterno_oid`), add constraint fk_staff_utenteinterno foreign key (`utenteinterno_oid`) references `utenteinterno` (`utente_oid`);


-- GEN FK: Alumno --> UtenteInterno
alter table `alumno`   add index fk_alumno_utenteinterno (`utenteinterno_oid`), add constraint fk_alumno_utenteinterno foreign key (`utenteinterno_oid`) references `utenteinterno` (`utente_oid`);


-- GEN FK: Amministratore --> UtenteInterno
alter table `amministratore`   add index fk_amministratore_utenteintern (`utenteinterno_oid`), add constraint fk_amministratore_utenteintern foreign key (`utenteinterno_oid`) references `utenteinterno` (`utente_oid`);


-- GEN FK: EventoInEvidenza --> EventoPubblico
alter table `eventoinevidenza`   add index fk_eventoinevidenza_eventoinev (`eventoinevidenza_oid`), add constraint fk_eventoinevidenza_eventoinev foreign key (`eventoinevidenza_oid`) references `eventoinevidenza` (`evento_oid`);


-- GEN FK: EventoPubblico --> Evento
alter table `eventoinevidenza`   add index fk_eventoinevidenza_evento (`evento_oid`), add constraint fk_eventoinevidenza_evento foreign key (`evento_oid`) references `evento` (`oid`);


-- GEN FK: UtenteInterno --> Utente
alter table `utenteinterno`   add index fk_utenteinterno_utente (`utente_oid`), add constraint fk_utenteinterno_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- GEN FK: EventoRiservatoAlumni --> Evento
alter table `eventoriservatoalumni`   add index fk_eventoriservatoalumni_event (`evento_oid`), add constraint fk_eventoriservatoalumni_event foreign key (`evento_oid`) references `evento` (`oid`);


-- GEN FK: EventoRiservatoAziende --> Evento
alter table `eventoriservatoaziende`   add index fk_eventoriservatoaziende_even (`evento_oid`), add constraint fk_eventoriservatoaziende_even foreign key (`evento_oid`) references `evento` (`oid`);


-- GEN FK: Azienda --> Utente
alter table `azienda`   add index fk_azienda_utente (`utente_oid`), add constraint fk_azienda_utente foreign key (`utente_oid`) references `utente` (`oid`);


-- RaccoltaFondi.totale_raccolto [ent17#att41]
create view `raccoltafondi_totale_raccolto` as
select AL1.`oid` as `oid`, sum(AL2.`ammontare`) as `der_attr`
from  `raccoltafondi` AL1 
               left outer join `donazione` AL2 on AL1.`oid`=AL2.`raccoltafondi_oid`
group by AL1.`oid`;


