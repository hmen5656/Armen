#!/bin/sh

# https://gronska.atlassian.net/browse/GOSW-115
# Drops all logs and Haga 5–20 metrics from InfluxDB
# Requires InfluxDB CLI and setting up an API key

influx delete --bucket "john's Bucket" --predicate '_measurement="tail"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'

influx delete --bucket "john's Bucket" --predicate 'host="hagastaden05"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden06"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden07"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden08"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden09"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden10"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden11"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden12"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden13"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden14"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden15"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden16"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden17"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden18"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden19"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
influx delete --bucket "john's Bucket" --predicate 'host="hagastaden20"' -o Gronska --start '1970-01-01T00:00:00Z' --stop '2025-12-31T23:59:00Z'
