db_config = File.read(File.expand_path("../../bot_database.yml", __FILE__))
DB_CONFIG = YAML.load(ERB.new(db_config).result)
