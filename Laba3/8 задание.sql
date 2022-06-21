Use master;
go 
create database UNIVERS
on primary
(name = N'UNIVERS_mdf',filename = N'E:\Education\2 курс 2 сем\База Данных 2 сем\3 лаба\UNIVER_mdf.mdf',
size = 10240Kb,maxsize=UNLIMITED,filegrowth=1024Kb),
(name = N'UNIVERS_ndf',filename = N'E:\Education\2 курс 2 сем\База Данных 2 сем\3 лаба\UNIVER_ndf.ndf',
size = 10240Kb,maxsize=1Gb,filegrowth=25%),
filegroup FG1
(name = N'UNIVERS_fg1_1',filename = N'E:\Education\2 курс 2 сем\База Данных 2 сем\3 лаба\UNIVER_fgb-1.ndf',
size = 10240Kb,maxsize=1Gb,filegrowth=25%),
(name = N'UNIVERS_fgb-1_2',filename = N'E:\Education\2 курс 2 сем\База Данных 2 сем\3 лаба\UNIVER_fgb-2.ndf',
size = 10240Kb,maxsize=1Gb,filegrowth=25%)
log on
(name = N'UNIVERS_log',filename = N'E:\Education\2 курс 2 сем\База Данных 2 сем\3 лаба\UNIVER_log.ldf',
size = 10240Kb,maxsize=2048Gb,filegrowth=10%)
go