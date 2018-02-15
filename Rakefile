require 'pg'

task :seed_test_db do
  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec ('TRUNCATE TABLE links;')
  connection.exec ("INSERT INTO links (url) VALUES ('http://www.makersacademy.com');")
  connection.exec ("INSERT INTO links (url) VALUES ('http://www.google.com');")
end

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE bookmark_manager;')
  connection.exec('CREATE DATABASE bookmark_manager_test;')

  connection = PG.connect :dbname => 'bookmark_manager'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60));')

  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60));')
end
