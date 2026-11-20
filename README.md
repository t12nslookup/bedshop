# Bedshop

A deliberately small Rails demo: two application tables, `shops` and `mattresses`, joined by a one-to-many association. It uses Haml views, SQLite, Bootstrap, Rails 8.1, and Ruby 4.0.

## Requirements

- Ruby 4.0.10 (see `.ruby-version`)
- Bundler
- Graphviz and `ruby-graphviz` are optional for PDF/PNG exports; Mermaid is the default.

With rbenv, install the pinned Ruby and then install the app dependencies:

```sh
rbenv install 4.0.10
bundle install
bin/rails db:prepare
bin/rails db:seed
bin/rails server
```

Open [http://localhost:3000](http://localhost:3000). The seed command is safe to rerun: it ensures five sample shops have between one and three mattresses each, topping up counts without deleting existing data.

## Tests and code quality

```sh
bin/rails test
bundle exec rubocop
bundle exec haml-lint
```

The test suite uses Rails' built-in Minitest runner and covers model relationships, validation, shop deletion, and catalog create/list flows.

## Demo tooling

```sh
bundle exec erd     # writes the two-model diagram to erd.mmd
bundle exec annotaterb models -k --simple-indexes
bundle exec annotaterb routes
```

Rails ERD's Mermaid output keeps the diagram lightweight. Add Graphviz and `ruby-graphviz` for PDF/PNG exports. AnnotateRb keeps model schema comments in sync with the database.
The checked-in [erd.mmd](./erd.mmd) shows only the two application models.

The UI loads Bootstrap's stylesheet from jsDelivr. This app has no client-side JavaScript: its pages and forms use native Rails HTML responses.

## Data model

- A shop has many mattresses.
- A mattress belongs to one shop.
- Deleting a shop also deletes its mattresses.

Run `bin/rails routes` to explore the generated resource routes, or use `bin/rails console` (or `irb`) to inspect the models.

## License

This project is released under the [Unlicense](./LICENSE), with no attribution requirement.
