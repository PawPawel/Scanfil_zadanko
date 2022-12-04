Celem zadania było stworzenie prostej aplikacji w .NET 6 i przygotowanie dockerowego obrazu uruchomieniowego.  
Aplikacja to proste API z jednym kontrolerem.  
Wykorzystana jest baza danych w pamięci, przechowujemy w niej kandydatów, mających ID, imię i informacje o tym czy zostali zatrudnieni.  
W projekcie znajduje sie wieloetapowy dockerfile. Do repozytorium zlinkowany jest uruchomieniowy obraz dockerowy.

### Pobranie obrazu:
```
docker pull ghcr.io/pawpawel/scanfil_zadanko:latest
```
### uruchomienie kontenera:
```
docker run --rm -p 80:80 -p 433:433 ghcr.io/pawpawel/scanfil_zadanko
```
### Przykładowe zapytania do API:
```
curl -X 'GET' \
  'http://localhost:80/api/Candidates' \
  -H 'accept: text/plain'
  
curl -X 'POST' \
  'http://localhost:80/api/Candidates' \
  -H 'accept: text/plain' \
  -H 'Content-Type: application/json' \
  -d '{
  "name": "Pawel",
  "hired": false
}'

curl -X 'GET' \
  'http://localhost:80/api/Candidates/1' \
  -H 'accept: text/plain'
  
  curl -X 'PUT' \
  'http://localhost:80/api/Candidates/1' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "id": 1,
  "name": "Pawel",
  "hired": true
}'

curl -X 'DELETE' \
  'http://localhost:80/api/Candidates/1' \
  -H 'accept: */*'
