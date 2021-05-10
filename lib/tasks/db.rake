namespace :db do
  desc 'Load static data from .yml files in /app/db/static'
  task load_static: [:migrate] do
    records = YAML.safe_load(File.read("#{Rails.application.root}/db/static/locations.yml"), [Symbol])
    records.each { |record| Location.new(record).save(validate: false) }
  end
end
