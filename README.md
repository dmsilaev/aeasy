# Adminos::Auth

Кастомизированная регистрация, авторизация, модель пользователя для гема adminos.

## Installation

Добавьте следующую строку в ваш Gemfile:

```ruby
gem 'adminos-auth'
```

После чего выполните:

    $ bundle
    $ rails g adminos_auth:install

Это сгенерирует необходимые файлы и маршруты.

## Использование

### Модель User

Модель пользователя представляет собой модель в ORM active_record, находящаяся по-пути app/models/user.rb
После установки гема, генератор генерирует следующие файлы, связанные с моделью:

- app/models/user.rb (сама модель)
- app/models/guest.rb (модель гостя)
- db/migration/*_create_users.rb (миграция)

Модель пользователя содержит следующие аттрибуты:

- email - Электронная почта пользователя
- state - Состояние пользователя, может принимать значения:
   waiting_confirmation - ожидает подтверждения по email
   inactive - неактивный
   active - активный
- password_digest - Хеш пароля
- first_name - Имя пользователя
- last_name - Фамилия пользователя
- confirmation_token - Токен, для подтверждения по email
- reset_password_token - Токен, для восстановления пароля
- avatar - Аватар пользователя

Для реализации состояний пользователя используется конечный автомат https://github.com/pluginaweek/state_machine
Для валидации полей пользователя используется https://github.com/kaize/validates
Для работы с паролем используется https://github.com/codahale/bcrypt-ruby

## Contributing

1. Fork it ( https://github.com/[my-github-username]/adminos-auth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
