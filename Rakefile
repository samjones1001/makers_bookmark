require 'pg'

task :seed_test_db do
  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec ('TRUNCATE TABLE links;')
  connection.exec ("INSERT INTO links (id, url, title) VALUES (1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec ("INSERT INTO links (id, url, title) VALUES (2, 'http://www.google.com', 'Google');")
end

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE bookmark_manager;')
  connection.exec('CREATE DATABASE bookmark_manager_test;')

  connection = PG.connect :dbname => 'bookmark_manager'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));')

  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));')
end
