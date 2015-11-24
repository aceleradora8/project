# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task["db:reset"]
##variaveis

#populando enderecos para ongs/oportunidades
address = Address.new(address:"Av Ipiranga",cep:"90619-900",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Partenon", complement: "6681")
address.save
address = Address.new(address:"Av Bento Gonçalves",cep:"90600-900",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Partenon", complement: "666")
address.save
address = Address.new(address:"Av Osvaldo Aranha",cep:"90300-666",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Bomfim", complement: "333")
address.save
address = Address.new(address:"Av Paulista",cep:"30200-126",city:"São Paulo", state:"São Paulo",country:"Brasil", neighbourhood: "Consolação", complement: "76")
address.save
address = Address.new(address:"Rua Augusta",cep:"30200-112",city:"São Paulo", state:"São Paulo",country:"Brasil", neighbourhood: "Consolação", complement: "11")
address.save
address = Address.new(address:"Av Rio Branco",cep:"60220-152",city:"Rio De Janeiro", state:"Rio de Janeiro",country:"Brasil", neighbourhood: "Centro", complement: "98")
address.save
address = Address.new(address:"Rua Humaitá",cep:"60170-152",city:"Rio De Janeiro", state:"Rio de Janeiro",country:"Brasil", neighbourhood: "Humaitá", complement: "125")
address.save
address = Address.new(address:"Av Osório",cep:"90570-322",city:"Imbé", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "João Clemente", complement: "21")
address.save
address = Address.new(address:"Av Assis Brasil",cep:"90670-385",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Passo d'Areia", complement: "781")
address.save
address = Address.new(address:"Av Júlio de Castilhos",cep:"90143-235",city:"Caxias do Sul", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "São Pelegrino", complement: "14")
address.save

#populando causas
cause = Cause.new(name:"Animal")
cause.save
cause = Cause.new(name:"Ajudar idosos")
cause.save
cause = Cause.new(name:"Doação de alimentos")
cause.save
cause = Cause.new(name:"Doação de cobertores")
cause.save
cause = Cause.new(name:"Educação")
cause.save
cause = Cause.new(name:"Fazer comida")
cause.save
cause = Cause.new(name:"Meio ambiente")
cause.save
cause = Cause.new(name:"Saúde")
cause.save
cause = Cause.new(name:"Trânsito")
cause.save

#populando ongs
ngo = Ngo.new(name:"Patas Dadas",description:"O Patas Dadas surgiu em 2009, em resposta ao envenenamento de diversos cães em Porto Alegre. Atualmente, o projeto é responsável por cerca de 80 cães e sempre busca dar a melhor qualidade de vida possível a eles, oferecendo boa ração, vacinações em dia, castração aos animais saudáveis e todo atendimento veterinário que for necessário.",address_id:1, email: "pd@ongarium.com")
ngo.save
ngo = Ngo.new(name:"Vida Urgente",description:"O Vida Urgente possui um conjunto de programas, projetos e ações que visam promover a preservação e valorização da vida, mobilizando a sociedade através de ações educativas e culturais para uma mudança de comportamento que resulte em um trânsito mais humano e seguro.",address_id:2, email: "vidaurgente@ongarium.com")
ngo.save
ngo = Ngo.new(name:"Doutores da Alegria",description:"Doutores da Alegria é uma organização da sociedade civil sem fins lucrativos que há 24 anos promove as relações humanas e qualifica a experiência de internação em hospitais por meio da visita contínua de palhaços profissionais especialmente treinados em São Paulo e no Recife. Fundada por Wellington Nogueira em 1991, a ONG foi inspirada no trabalho do Clown Care Unit, criada por Michael Christensen, diretor do Big Apple Circus de Nova York. Wellington integrou a trupe de palhaços em 1988, satirizando as rotinas médicas e hospitalares mais conhecidas. Ao retornar ao Brasil, decidiu implantar um programa semelhante. Vinte e três anos depois, a ONG já realizou mais de um milhão de visitas a crianças hospitalizadas, seus acompanhantes e profissionais de saúde. A base do trabalho é o resgate do lado saudável da vida e todos os seus projetos se utilizam da arte para potencializar as relações.",address_id:3, email: "doutores@ongarium.com")
ngo.save
ngo = Ngo.new(name:"Bicho de Rua",description:"O Projeto Bicho de Rua foi fundado em 10/05/2004 por um grupo de amigos que, já trabalhando voluntariamente na causa de proteção, apoio e promoção do bem-estar animal, decidiu juntar forças e potencializar essa atividade.",address_id:4, email: "bichoderua@ongarium.com")
ngo.save
ngo = Ngo.new(name:"Amigos da Escola",description:"Somos amigos da escola",address_id:5, email: "amigos@ongarium.com")
ngo.save
ngo = Ngo.new(name:"ONG Construtores",description:"Gostamos de obra",address_id:6, email: "construtores@ongarium.com")
ngo.save

#populando skills
skill = Skill.new(name:"Computação")
skill.save
skill = Skill.new(name:"Conhecimentos de saúde")
skill.save
skill = Skill.new(name:"Cozinhar")
skill.save
skill = Skill.new(name:"Engenharia")
skill.save
skill = Skill.new(name:"Gostar de animais")
skill.save
skill = Skill.new(name:"Gostar de crianças")
skill.save
skill = Skill.new(name:"Gostar de idosos")
skill.save
skill = Skill.new(name:"Licenciatura")
skill.save
skill = Skill.new(name:"Trabalho manual")
skill.save
skill = Skill.new(name:"Trabalho em equipe")
skill.save

#populando oportunidades
opportunity = Opportunity.new(title:"Evento de doação de cachorros e gatos",description:"texto de descrição",address_id:1,ngo_id:1,cause_id:1,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))

opportunity = Opportunity.new(title:"Ajuda com grupo de estudos",description:"texto de descrição",address_id:2,ngo_id:5,cause_id:5,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(6))
opportunity.skills.push(Skill.find(8))

opportunity = Opportunity.new(title:"Ajuda Patas Dadas",description:"texto de descrição",address_id:8,ngo_id:1,cause_id:1,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))

opportunity = Opportunity.new(title:"Ajudar moradores de rua",description:"texto de descrição",address_id:3,ngo_id:1,cause_id:3,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(3))

opportunity = Opportunity.new(title:"Ajuda Patas Dadas",description:"texto de descrição",address_id:1,ngo_id:1,cause_id:1,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))

opportunity = Opportunity.new(title:"Cursos voluntários de computação",description:"texto de descrição",address_id:2,ngo_id:4,cause_id:5,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(1))
opportunity.skills.push(Skill.find(6))
opportunity.skills.push(Skill.find(8))


opportunity = Opportunity.new(title:"Ajuda Patas Dadas",description:"texto de descrição",address_id:4,ngo_id:1,cause_id:1,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))

opportunity = Opportunity.new(title:"Precisa-se de professor de Inglês",description:"texto de descrição",address_id:5,ngo_id:5,cause_id:5,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(8))

opportunity = Opportunity.new(title:"Ajuda Patas Dadas",description:"texto de descrição",address_id:8,ngo_id:1,cause_id:1,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))

opportunity = Opportunity.new(title:"Ajuda com construção de casas",description:"texto de descrição",address_id:7,ngo_id:6,cause_id:7,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(4))
opportunity.skills.push(Skill.find(9))

opportunity = Opportunity.new(title:"Precisa-se de ajuda para limpar terreno",description:"texto de descrição",address_id:8,ngo_id:6,cause_id:7,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(9))


opportunity = Opportunity.new(title:"Precisa-se de profissional de saúde",description:"texto de descrição",address_id:9,ngo_id:3,cause_id:8,vacancies:30, start_date:"2015-10-12", finish_date:"2015-10-24")
opportunity.save
opportunity.skills.push(Skill.find(2))

opportunity = Opportunity.new(title:"Precisa-se de cozinheiro",description:"texto de descrição",address_id:10,ngo_id:2,cause_id:6,vacancies:30, start_date:"2015-11-19", finish_date:"2015-11-23")
opportunity.save
opportunity.skills.push(Skill.find(3))

#populando volunteers
volunteer = Volunteer.new(email:"joao@gmail.com", name:"Joao", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"pedrofontoura@gmail.com", name:"Pedro Fontoura", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"gabriel@gmail.com", name:"Gabriel", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"felipe@gmail.com", name:"Felipe", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"ghilherme@gmail.com", name:"Ghilherme", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"guilherme@gmail.com", name:"Guilherme", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"paula@gmail.com", name:"Paula", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"amanda@gmail.com", name:"Amanda", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"michele@gmail.com", name:"Michele", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save
volunteer = Volunteer.new(email:"andriele@gmail.com", name:"Andriele", phone:"123456", observations:"Sou uma pessoa legal!")
volunteer.save


=begin
#buscando oportunidade do banco
#op1 = Opportunity.first

#criando relacao  oportunidade e skill
#Skill.all.each do |skill|
#	op1.skills.push(skill) 
#end

#criando relacao oportunidade e voluntário (na interest)
#vo = Volunteer.first

#interesse = Interest.create!(volunteer_id:vo.id,opportunity_id:op1.id,confirmed: false,presence: nil)
=end

#Comando para executar o script: rake db:seed