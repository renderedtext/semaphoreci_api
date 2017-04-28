require 'heroics'

Heroics.default_configuration do |config|
  config.base_url = 'https://semaphoreci.com/api/v2'
  config.module_name = 'SemaphoreciApi'
  config.schema_filepath = 'schema.json'

  config.headers = { 'Accept' => 'application/vnd.semaphoreci+json; version=1' }

  # Note: Don't use doublequotes below -- we want to interpolate at runtime,
  # not when the client is generated
  config.cache_path = '#{Dir.home}/.heroics/example'
end
