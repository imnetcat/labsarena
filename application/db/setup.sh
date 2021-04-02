psql -U postgres -f ./install.sql
PGPASSWORD=imnetcat psql -d application -f structure.sql -U imnetcat
PGPASSWORD=imnetcat psql -d application -f data.sql -U imnetcat
