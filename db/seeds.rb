require 'faker'

User.destroy_all

User.create({
  password: 'password',
  password_confirmation: 'password',
  salt: 'asdasdastr4325234324sdfds',
  crypted_password: Sorcery::CryptoProviders::BCrypt.encrypt('password', 'asdasdastr4325234324sdfds'),
  email: 'admin@example.com',
  roles: ['admin']
})



