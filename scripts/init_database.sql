/*
==============================================================
Create Database and Schemas
==============================================================

Script Purpose:
This script creates a new database called 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas withi


WARNING:
Running this script will drop the entire 'DataWarehouse' after checking if it already exists.
All data in the db will be permanently deleted. Proceeed with caution and ensure you have proper backups before running this script.
*/


USE master;
go

-- Drop and recreate the 'DataWarehouse' db
if exists (select 1 
from sys.databases 
where name = 'DataWarehouse')
begin
	alter database DataWarehouse 
	set single_user 
	with rollback immediate;
	drop database DataWarehouse;
end;
go

--Create the 'DataWarehouse' db
Create database DataWarehouse;
go

use DataWarehouse;
go


--Create Schemas
create schema bronze;
go
create schema silver;
go
create schema gold;
go
