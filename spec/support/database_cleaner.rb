RSpec.configure do |config|
  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :deletion : :transaction
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
