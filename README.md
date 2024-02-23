_tạo bảng dữ liệu
migrate -path db/migration -database "postgresql://root:secret@localhost:5432/trungdev?sslmode=disable" -verbose up_
docker run --rm -v "${PWD}:/src" -w /src sqlc/sqlc generate
tạo file migration
migrate create -ext sql -dir db/migration -seq add_users
