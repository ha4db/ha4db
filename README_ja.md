![ha4db ci](https://github.com/ha4db/ha4db/workflows/ha4db%20ci/badge.svg)
![ha4db coverage](https://ha4db.github.io/coverage/coverage_badge_total.svg)

# Ha4db

橋梁マネージメントシステム

## Ha4 の意味は？

- Hashi means Bridge in Japanese.
- The Japanese pronounce the 4 as shi.
- Ha4 = The bridge.

## システム要件

- Ruby 2.7
- PostgreSQL
- PostGIS
- NodeJS + yarn
- Redis
- vips
- pdal
- docker

## 開発のための設定

```sh
bundle
yarn
export HA4DB_DEVELOPMENT_DATABASE_URL=postgis://myuser:mypass@localhost/ha4db_development
rails db:create RAILS_ENV=development
rails db:gis:setup RAILS_ENV=development
rails db:migrate RAILS_ENV=development
```

### redisサーバを起動

```sh
docker run --rm -p 6379:6379 redis
```

### 開発サーバの起動

２つのターミナルもしくはtmuxやGNU screenを開きます。

１つ目のターミナルで`webpack-dev-server`を実行します。

```sh
bin/webpack-dev-server
```

他のターミナルで`rails s`を実行します。

```sh
bin/rails s
```

`rails s`だけ実行しても良いですが、`webpack-dev-server`はバックグラウンドで実行され、何かが変更した瞬間にコンパイルされるため、`webpack-dev-server` と `rails s`の両方を実行するのをお勧めします。

### 管理者ユーザの作成

`AdminUser` を追加する必要があります。

最初に`rails console `を開きます。

```sh
bin/rails c
```

次に、コンソールでユーザを追加します。

```ruby
a = AdminUser.new
a.name = 'foo'
a.password = 'sp0mhamegg'
a.save
```

### 開発のエントリポイント

- [http://localhost:3000](http://localhost:3000)
- [http://localhost:3000/admin/sessions/index](http://localhost:3000/admin/sessions/index)

## テストスイートの実行

```sh
export HA4DB_TEST_DATABASE_URL=postgis://myuser:mypass@localhost/ha4db_test
rails db:create RAILS_ENV=test
rails db:gis:setup RAILS_ENV=test
rails db:migrate RAILS_ENV=test
bin/rspec
```

`rspec`の実行後に、`coverage/index.html`にカバレッジが作成されます。

### guard

このプロジェクトは [guard](https://github.com/guard/guard) をサポートしています。

```sh
bin/guard
```

## Lint

```sh
bin/rubocop
yarn eslint . --ext .js,.jsx,.ts,.tsx
```

## 翻訳

私達は[i18n_generators](https://github.com/amatsuda/i18n_generators)を利用しています。

現在では日本語と英語をサポートしています。

### 言語を追加する

```sh
rails g i18n <your_language>
```

### モデルの翻訳を更新

モデルの作成やスキーマの変更を行ったら、`config/locales/translation_*.yml`を次のタスクで再作成してください:

```sh
rails g i18n_translation en
rails g i18n_translation ja
# rails g i18n_translation <your_language>
```

`config/locales/translation_*.yml`は手動で確認をしてください。
