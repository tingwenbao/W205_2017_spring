from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
# Added load library
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        # Added create database and table
        conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
        #Create the Database                                                                               
        try:
        # CREATE DATABASE can't run inside a transaction                                                 
            conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            cur = conn.cursor()
            cur.execute("CREATE DATABASE tcount")
            cur.close()
            conn.close()
        except:
            print ("Could not create tcount")
        #Connecting to tcount                                                                                     
        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        #Create a Table                                                                                            
        try:
        #The first step is to create a cursor.                                                                           
            cur = conn.cursor()
            cur.execute('''CREATE TABLE tweetwordcount                                           
            (word TEXT PRIMARY KEY     NOT NULL,                                                   
            count INT     NOT NULL);''')
            conn.commit()
            conn.close()
        except:
            print ("Could not create table tweetwordcount")

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.

        # Increment the local count
        self.counts[word] +=1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))

        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        cur.execute("SELECT word, count from tweetwordcount where word=%s", (word,))
        record = cur.fetchone()
        conn.commit()

        cur = conn.cursor()
        if (not record):
            cur.execute("INSERT INTO Tweetwordcount (word,count) VALUES (%s, %s)",(word, 1))
        else:
            cur.execute("UPDATE Tweetwordcount SET count=%s WHERE word=%s", (self.counts[word], word))
        conn.commit()

        conn.close()
