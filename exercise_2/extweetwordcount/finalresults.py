#!/usr/bin/python

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import sys

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

cur = conn.cursor()
if len(sys.argv)==1:
   cur.execute("SELECT word, count from tweetwordcount")
else:
   cur.execute("SELECT word, count from tweetwordcount where word=%s",(sys.argv[1],))
records = cur.fetchall()
for rec in records:
   print (rec)


conn.close()
