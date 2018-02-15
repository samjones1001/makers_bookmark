require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'attempts to connect to a database' do
      expect(PG).to receive(:connect).with(:dbname => 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'maintains the connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.current_connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'sends a query to the database' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM links')
      DatabaseConnection.query('SELECT * FROM links')
    end
  end
end
