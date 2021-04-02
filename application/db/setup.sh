psql -f install.sql -U postgres
PGPASSWORD=marcus psql -d application -f structure.sql -U imnetcat
PGPASSWORD=marcus psql -d application -f data.sql -U imnetcat
