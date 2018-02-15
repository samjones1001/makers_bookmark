require 'pg'

connection = PG.connect :dbname => 'bookmark_manager_test'
connection.exec ('TRUNCATE TABLE links;')
connection.exec ("INSERT INTO links (url) VALUES ('http://www.makersacademy.com');")
connection.exec ("INSERT INTO links (url) VALUES ('http://www.google.com');")
