"""Create the SQLite3 version of the sightings database."""

from lib.base_01_create_db import BaseCreateDb
from lib.sqlite import Connection


class SqliteCreateDb(BaseCreateDb):
    """Create a sightings database and input constant data."""


if __name__ == '__main__':
    SqliteCreateDb(Connection).create_database()
