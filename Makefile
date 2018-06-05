SHELL=/bin/bash
DATE=`date +%Y-%m-%d`
PYTHON=python
PROCESSED=./data/processed
RAW=./data/raw

SQLITE_DB=macrosystems.sqlite.db
SQLITE_SRC="$(PROCESSED)/$(SQLITE_DB)"
SQLITE_DST="$(PROCESSED)/$(basename $(SQLITE_DB))_$(DATE).db"
SQLITE_MAPS_DB=$(RAW)/maps/maps.sqlite.db

all: clean sqlite bbs maps ebird

sqlite:
	$(PYTHON) ./src/sqlite_01_create_db.py

bbs:
	$(PYTHON) ./src/sqlite_02_ingest_bbs.py

maps:
	$(PYTHON) ./src/sqlite_03_ingest_maps.py

ebird:
	$(PYTHON) ./src/sqlite_04_ingest_ebird.py

backup:
	cp $(SQLITE_SRC) $(SQLITE_DST)

clean:
	rm -f $(SQLITE_MAPS_DB)
	rm -f $(SQLITE_SRC)
