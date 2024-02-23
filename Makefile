postgres:
	docker	run	--name	postgres16	-p	5432:5432	-e	POSTGRES_USER=root	-e	POSTGRES_PASSWORD=secret	-d	postgres:16-alpine
createdb:
	docker	exec	-it	postgres16	createdb	--username=root	--owner=root	trungdev
dropdb:
	docker	exec	-it	postgres16	dropdb	trungdev
migrateup:
	migrate	-path	db/migration	-database	"postgresql://root:secret@localhost:5432/trungdev?sslmode=disable"	-verbose	up
migratedown:
	migrate	-path	db/migration	-database	"postgresql://root:secret@localhost:5432/trungdev?sslmode=disable"	-verbose	down
sqlc:
	docker	run	--rm	-v	"${PWD}:/src"	-w	/src	sqlc/sqlc	generate
.PHONY:createdb	postgres	dropdb	migrateup	migratedown	sqlc
