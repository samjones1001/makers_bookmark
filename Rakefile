require 'pg'

task :seed_test_db do
  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec ('TRUNCATE TABLE links, comments;')
  connection.exec ("INSERT INTO links VALUES (1, 'http://www.makersacademy.com', 'Makers Academy');")
  connection.exec ("INSERT INTO links VALUES (2, 'http://www.google.com', 'Google');")
end

task :setup do
  connection = PG.connect
  connection.exec('CREATE DATABASE bookmark_manager;')
  connection.exec('CREATE DATABASE bookmark_manager_test;')

  connection = PG.connect :dbname => 'bookmark_manager'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));')
  connection.exec('CREATE TABLE comments (id SERIAL PRIMARY KEY, link_id INTEGER REFERENCES links(id), text VARCHAR(240));')

  connection = PG.connect :dbname => 'bookmark_manager_test'
  connection.exec('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(50));')
  connection.exec('CREATE TABLE comments (id SERIAL PRIMARY KEY, link_id INTEGER REFERENCES links(id), text VARCHAR(240));')
end

task :teardown do
  connection = PG.connect
  connection.exec('DROP DATABASE bookmark_manager;')
  connection.exec('DROP DATABASE bookmark_manager_test')
end
