-- Parse::SQL::Dia     version 0.30                              
-- Documentation       http://search.cpan.org/dist/Parse-Dia-SQL/
-- Environment         Perl 5.026001, /usr/bin/perl              
-- Architecture        x86_64-linux-gnu-thread-multi             
-- Target Database     sqlite3                                   
-- Input file          cwl-gk-thermal.dia                        
-- Generated at        Fri Mar 25 02:30:06 2022                  
-- Typemap for sqlite3 found in input file                       

-- get_constraints_drop 

-- get_permissions_drop 

-- get_view_drop

-- get_schema_drop
drop table if exists pseudo;
drop table if exists input;
drop table if exists project;
drop table if exists code;
drop table if exists atomlist;
drop table if exists snapshot;
drop table if exists current;
drop table if exists result;

-- get_smallpackage_pre_sql 

-- get_schema_create

create table pseudo (
   code_title text(128) not null,
   kind       text(128) not null,
   data       text              
)   ;

create table input (
   code_title text(128) not null,
   data       text              
)   ;

create table project (
   name         text(255) not null,
   description  text              ,
   input_units  text(255) not null,
   result_units text(255) not null
)   ;

create table code (
   title      text(128) not null,
   version    text(255)         ,
   command    text              ,
   pseudo_ext text(128)         ,
   constraint pk_code primary key (title)
)   ;

create table atomlist (
   atom_id integer   not null,
   kind    text(128) not null,
   constraint pk_atomlist primary key (atom_id)
)   ;

create table snapshot (
   step    integer not null,
   atom_id integer not null,
   pos_x   real    not null,
   pos_y   real    not null,
   pos_z   real    not null,
   vel_x   real    not null,
   vel_y   real    not null,
   vel_z   real    not null
)   ;

create table current (
   title        text(128) not null,
   code_title   text(128) not null,
   parse_string text              ,
   constraint pk_current primary key (title)
)   ;

create table result (
   current_title text(128)         ,
   step          integer   not null,
   sp_x          real      not null,
   sp_y          real      not null,
   sp_z          real      not null
)   ;

-- get_view_create

-- get_permissions_create

-- get_inserts
insert into code (title,version,command,pseudo_ext) values('siesta','develop','siesta','psml') ;
insert into code (title,version,command,pseudo_ext) values('qeheat','develop','all_currents.x','upf') ;
insert into current (title,code_title,parse_string) values('jks','siesta','gk:\.Jks\.') ;
insert into current (title,code_title,parse_string) values('jks-a','siesta','gk:\.Jks-A') ;
insert into current (title,code_title,parse_string) values('jks-b','siesta','gk:\.Jks-B') ;
insert into current (title,code_title,parse_string) values('jele','siesta','gk:\.Jele') ;
insert into current (title,code_title,parse_string) values('jxc','siesta','gk:\.Jxc') ;
insert into current (title,code_title,parse_string) values('jhart','siesta','gk:\.Jhart') ;
insert into current (title,code_title,parse_string) values('jion','siesta','gk:\.Jion\.') ;
insert into current (title,code_title,parse_string) values('jion-a','siesta','gk:\.Jion-A') ;
insert into current (title,code_title,parse_string) values('jion-b','siesta','gk:\.Jion-B') ;
insert into current (title,code_title,parse_string) values('jion-c','siesta','gk:\.Jion-C') ;
insert into current (title,code_title,parse_string) values('jion-d','siesta','gk:\.Jion-D') ;
insert into current (title,code_title,parse_string) values('jion-e','siesta','gk:\.Jion-E') ;
insert into current (title,code_title,parse_string) values('jzero','siesta','gk:\.Jzero') ;
insert into current (title,code_title,parse_string) values('jzloc','siesta','gk:\.Jzloc') ;
insert into current (title,code_title,parse_string) values('jznl','siesta','gk:\.Jznl') ;
insert into current (title,code_title,parse_string) values('jtotal','siesta','gk:\.Jtotal') ;
insert into current (title,code_title,parse_string) values('qks','qeheat','h&K-K') ;
insert into current (title,code_title,parse_string) values('qks-a','qeheat','h&K-K_a') ;
insert into current (title,code_title,parse_string) values('qks-b','qeheat','h&K-K_b') ;
insert into current (title,code_title,parse_string) values('qele','qeheat','h&K-ELE') ;
insert into current (title,code_title,parse_string) values('qxc','qeheat','h&K-XC') ;
insert into current (title,code_title,parse_string) values('qhart','qeheat','h&K-H') ;
insert into current (title,code_title,parse_string) values('qion','qeheat','ionic:') ;
insert into current (title,code_title,parse_string) values('qion-a','qeheat','ionic_a:') ;
insert into current (title,code_title,parse_string) values('qion-b','qeheat','ionic_b:') ;
insert into current (title,code_title,parse_string) values('qion-c','qeheat','ionic_c:') ;
insert into current (title,code_title,parse_string) values('qion-d','qeheat','ionic_d:') ;
insert into current (title,code_title,parse_string) values('qion-e','qeheat','ionic_e:') ;
insert into current (title,code_title,parse_string) values('qzero','qeheat','zero:') ;
insert into current (title,code_title,parse_string) values('qtotal','qeheat','total:') ;
insert into project (name,description,input_units,result_units) values('gk_thermal', 'Green-Kubo Thermal Transport DFT Calculation Database', 'siesta', 'qeheat') ;

-- get_smallpackage_post_sql

-- get_associations_create
