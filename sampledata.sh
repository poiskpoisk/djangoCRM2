#!/bin/bash
dropdb scrm
createdb scrm
psql scrm < scrmdb.sql
pmmm
pm migrate_schemas













