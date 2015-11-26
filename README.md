# Ongarium [![Build Status](https://snap-ci.com/aceleradora8/ongarium-rails/branch/master/build_image)](https://snap-ci.com/aceleradora8/ongarium-rails/branch/master) [![Code Climate](https://codeclimate.com/github/aceleradora8/ongarium-rails/badges/gpa.svg)](https://codeclimate.com/github/aceleradora8/ongarium-rails) [![Test Coverage](https://codeclimate.com/github/aceleradora8/ongarium-rails/badges/coverage.svg)](https://codeclimate.com/github/aceleradora8/ongarium-rails/coverage)

## Criando o projeto
* git clone `https://github.com/aceleradora8/ongarium-rails.git`
* cd ongarium-rails

## Configurando o Ambiente

### Criando as variáveis de ambiente
* `sh ./script-varenv.sh`

### Populando banco com registros para testes
* `bundle exec rake db:seed

### Ubuntu
* `sh ./script-db.sh`
* `bundle exec rake db:create`
* `bundle exec rake db:migrate`



## Rodando o servidor:
* `bundle exec rails server`
