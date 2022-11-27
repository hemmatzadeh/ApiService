#!/bin/bash

# Check System Admin password
if [[ -z "${SA_PASSWORD}" ]]; then
    echo "System admin password not passed as argument!"
    exit 1
else
    echo "System admin password: ${SA_PASSWORD}"
fi

initialize_databases() {
    # Try until server is ready
    until /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -Q "SELECT * FROM sys.databases"; do
      sleep 1
    done

    # Initialize databases
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${SA_PASSWORD}" -i ./Floward.sql
}

# Wait for sql server initialization
initialize_databases &

# Initialize sql server
/opt/mssql/bin/sqlservr
