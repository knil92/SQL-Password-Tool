echo create LOGIN %3 with PASSWORD=^"%4^">user.sql
echo go>>user.sql
echo SP_ADDSRVROLEMEMBER %3^, ^"SYSADMIN^">>user.sql
echo go>>user.sql

net stop SQLBrowser
net stop MSSQL$%2
net start MSSQL$%2 -m
sqlcmd -S %1\%2 -d master -i "%cd%\user.sql"
net stop MSSQL$%2
net start MSSQL$%2
net start SQLBrowser
del "%CD%user.sql"
del "%CD%NothingAtAll.bat"
