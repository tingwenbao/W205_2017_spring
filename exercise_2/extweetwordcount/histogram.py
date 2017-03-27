#!/usr/bin/python

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word, count from tweetwordcount where count>=%s and count <=%s",(sys.argv[1],sys.argv[2]))
records = cur.fetchall()
for rec in records:
   print (rec)


conn.close()
