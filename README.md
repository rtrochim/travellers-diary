# Travellers Diary

Simple app for travellers to write notes about places they visited.

Create the databases using
```
script/create_db
```

Set up tables with
```
bin/rails db:migrate
```

Load static data with
```
bin/rails db:load_static
```
Seed database with sample data
```
bin/rails db:seed
```

Run tests with
```
bin/rspec
```

Code coverage gets generated after tests are run and can be opened with
```
xdg-open coverage/index.html
```
or on a Mac
```
open coverage/index.html
```
