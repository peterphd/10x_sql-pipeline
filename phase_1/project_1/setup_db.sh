#!/bin/bash

# Exit immediately if any command fails
set -e

# Define variables for clean maintenance
DB_NAME="ecommerce_core"
DB_USER="c"

echo "=== 1. Cleaning existing database environment ==="
dropdb -U $DB_USER --if-exists $DB_NAME
createdb -U $DB_USER $DB_NAME

echo "=== 2. Initializing database schema ==="
psql -U $DB_USER -d $DB_NAME <<EOF
CREATE TABLE IF NOT EXISTS system_health_check (
    id SERIAL PRIMARY KEY,
    checked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL
);
EOF

echo "=== 3. Seeding initial configuration metrics ==="
psql -U $DB_USER -d $DB_NAME <<EOF
INSERT INTO system_health_check (status) VALUES ('ONLINE');
EOF

echo "=== 4. Verifying deployment ==="
psql -U $DB_USER -d $DB_NAME -c "SELECT * FROM system_health_check;"
