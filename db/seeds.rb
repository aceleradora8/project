# populando causas
cause = Cause.new(name:"Animais")
cause.save
cause = Cause.new(name:"Apoio Psicológico")
cause.save
cause = Cause.new(name:"Cultura")
cause.save
cause = Cause.new(name:"Crianças e Jovens")
cause.save
cause = Cause.new(name:"Dependentes Químicos")
cause.save
cause = Cause.new(name:"Desastres Naturais")
cause.save
cause = Cause.new(name:"Desabrigados")
cause.save
cause = Cause.new(name:"Doações")
cause.save
cause = Cause.new(name:"Educação")
cause.save
cause = Cause.new(name:"Esportes")
cause.save
cause = Cause.new(name:"Etnias")
cause.save
cause = Cause.new(name:"Idosos")
cause.save
cause = Cause.new(name:"LGBT")
cause.save
cause = Cause.new(name:"Meio ambiente")
cause.save
cause = Cause.new(name:"Mulheres")
cause.save
cause = Cause.new(name:"Pobreza e Fome")
cause.save
cause = Cause.new(name:"Portadores de Deficiências")
cause.save
cause = Cause.new(name:"Saúde")
cause.save
cause = Cause.new(name:"Tecnologia")
cause.save
cause = Cause.new(name:"Trânsito")
cause.save

# populando skills
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
skill = Skill.new(name:"Facilidade com crianças")
skill.save
skill = Skill.new(name:"Gostar de idosos")
skill.save
skill = Skill.new(name:"Licenciatura")
skill.save
skill = Skill.new(name:"Trabalho manual")
skill.save
skill = Skill.new(name:"Trabalho em equipe")
skill.save

Shift.create(name:"A combinar")
Shift.create(name:"Manhã")
Shift.create(name:"Tarde")
Shift.create(name:"Noite")

Weekday.create(name:"Segunda-feira")
Weekday.create(name:"Terça-feira")
Weekday.create(name:"Quarta-feira")
Weekday.create(name:"Quinta-feira")
Weekday.create(name:"Sexta-feira")
Weekday.create(name:"Sábado")
Weekday.create(name:"Domingo")

case Rails.env
when "development", "staging"
# populando enderecos para ongs/oportunidades
address = Address.new(address:"Av Ipiranga", zipcode:"90619-900", city:"Porto Alegre", state:"RS", country:"Brasil", neighborhood: "Partenon", complement: "6681")
address.save
address = Address.new(address:"Av Bento Gonçalves", zipcode:"90600-900", city:"Porto Alegre", state:"RS", country:"Brasil", neighborhood: "Partenon", complement: "666")
address.save
address = Address.new(address:"Av Osvaldo Aranha", zipcode:"90300-666", city:"Porto Alegre", state:"RS", country:"Brasil", neighborhood: "Bomfim", complement: "333")
address.save
address = Address.new(address:"Av Paulista", zipcode:"30200-126", city:"São Paulo", state:"SP", country:"Brasil", neighborhood: "Consolação", complement: "76")
address.save
address = Address.new(address:"Rua Augusta", zipcode:"30200-112", city:"São Paulo", state:"SP", country:"Brasil", neighborhood: "Consolação", complement: "11")
address.save
address = Address.new(address:"Av Rio Branco", zipcode:"60220-152", city:"Rio De Janeiro", state:"RJ", country:"Brasil", neighborhood: "Centro", complement: "98")
address.save
address = Address.new(address:"Rua Humaitá", zipcode:"60170-152", city:"Rio De Janeiro", state:"RJ", country:"Brasil", neighborhood: "Humaitá", complement: "125")
address.save
address = Address.new(address:"Av Osório", zipcode:"90570-322", city:"Imbé", state:"RS", country:"Brasil", neighborhood: "João Clemente", complement: "21")
address.save
address = Address.new(address:"Av Assis Brasil", zipcode:"90670-385", city:"Porto Alegre", state:"RS", country:"Brasil", neighborhood: "Passo d'Areia", complement: "781")
address.save
address = Address.new(address:"Av Júlio de Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Júliao de Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Júlio de julhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Júlio de ruas", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Ruas de Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Ruas de Rua", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Rua Júlio de Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Rua Ruas de Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Rua Júlio de Ruas", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Júlio Ruas Castilhos", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save
address = Address.new(address:"Av Júlio Ruas rua", zipcode:"90143-235", city:"Caxias do Sul", state:"RS", country:"Brasil", neighborhood: "São Pelegrino", complement: "14")
address.save

# populando users
user = User.new(email:"teste@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

user = User.new(email:"testf@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

user = User.new(email:"testg@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

user = User.new(email:"testh@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

user = User.new(email:"testi@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

user = User.new(email:"testj@teste.com", password:"123", confirmed: true, auth_token: "esseehmeutoken", role:"ngo")
user.save

# populando ongs
ngo = Ngo.new(name:"Patas Dadas", phone1: "123456789", description:"O Patas Dadas surgiu em 2009, em resposta ao envenenamento de diversos cães em Porto Alegre. Atualmente, o projeto é responsável por cerca de 80 cães e sempre busca dar a melhor qualidade de vida possível a eles, oferecendo boa ração, vacinações em dia, castração aos animais saudáveis e todo atendimento veterinário que for necessário.", address_id:1, user_id:1)
ngo.causes.push(Cause.find(1))
ngo.save
ngo = Ngo.new(name:"Vida Urgente", phone1: "123456789", description:"O Vida Urgente possui um conjunto de programas, projetos e ações que visam promover a preservação e valorização da vida, mobilizando a sociedade através de ações educativas e culturais para uma mudança de comportamento que resulte em um trânsito mais humano e seguro.", address_id:2, user_id:2)
ngo.causes.push(Cause.find(2))
ngo.save
ngo = Ngo.new(name:"Doutores da Alegria", phone1: "123456789", description:"Doutores da Alegria é uma organização da sociedade civil sem fins lucrativos que há 24 anos promove as relações humanas e qualifica a experiência de internação em hospitais por meio da visita contínua de palhaços profissionais especialmente treinados em São Paulo e no Recife. Fundada por Wellington Nogueira em 1991, a ONG foi inspirada no trabalho do Clown Care Unit, criada por Michael Christensen, diretor do Big Apple Circus de Nova York. Wellington integrou a trupe de palhaços em 1988, satirizando as rotinas médicas e hospitalares mais conhecidas. Ao retornar ao Brasil, decidiu implantar um programa semelhante. Vinte e três anos depois, a ONG já realizou mais de um milhão de visitas a crianças hospitalizadas, seus acompanhantes e profissionais de saúde. A base do trabalho é o resgate do lado saudável da vida e todos os seus projetos se utilizam da arte para potencializar as relações.", address_id:3, user_id:3)
ngo.causes.push(Cause.find(7))
ngo.save
ngo = Ngo.new(name:"Bicho de Rua", phone1: "123456789", description:"O Projeto Bicho de Rua foi fundado em 10/05/2004 por um grupo de amigos que, já trabalhando voluntariamente na causa de proteção, apoio e promoção do bem-estar animal, decidiu juntar forças e potencializar essa atividade.", address_id:4, user_id:4)
ngo.causes.push(Cause.find(1))
ngo.save
ngo = Ngo.new(name:"Amigos da Escola", phone1: "123456789", description:"Somos amigos da escola", address_id:5, user_id:5)
ngo.causes.push(Cause.find(3))
ngo.save
ngo = Ngo.new(name:"ONG Construtores", phone1: "123456789", description:"Gostamos de obra", address_id:6, user_id:6)
ngo.causes.push(Cause.find(8))
ngo.save


# populando oportunidades
opportunity = Opportunity.new(title:"Contar histórias para crianças", description:"Contar histórias para crianças ajuda no desenvolvimento da linguagem Se na hora de dormir, pais contarem uma história para os filhos, ao menos 2 vezes por semana, criança vai conhecer mais de 500 contos até os 5 anos. Contar histórias ajuda muito no desenvolvimento da linguagem. Você sabe qual a melhor forma de despertar o interesse das crianças? A atriz Flávia Alessandra convidou papais, mamães e um vovô para uma divertida expedição ao reino do faz de conta." , address_id:7, ngo_id:5, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(6))
opportunity.skills.push(Skill.find(8))
opportunity.causes.push(Cause.find(1))
opportunity.causes.push(Cause.find(2))
opportunity.causes.push(Cause.find(3))

opportunity = Opportunity.new(title:"Ajuda com grupo de estudos", description:"Suco de cevadiss, é um leite divinis, qui tem lupuliz, matis, aguis e fermentis. Interagi no mé, cursus quis, vehicula ac nisi. Aenean vel dui dui. Nullam leo erat, aliquet quis tempus a, posuere ut mi. Ut scelerisque neque et turpis posuere pulvinar pellentesque nibh ullamcorper.", address_id:20, ngo_id:5, vacancies:30, )
opportunity.save
opportunity.skills.push(Skill.find(6))
opportunity.skills.push(Skill.find(8))
opportunity.causes.push(Cause.find(4))
opportunity.causes.push(Cause.find(5))
opportunity.causes.push(Cause.find(6))

opportunity = Opportunity.new(title:"Resgatar gatos em árvores", description:"Casamentiss faiz malandris se pirulitá, Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer Ispecialista im mé intende tudis nuam golada, vinho, uiski, carirí, rum da jamaikis, só num pode ser mijis. Adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.", address_id:8, ngo_id:1, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))
opportunity.causes.push(Cause.find(1))
opportunity.causes.push(Cause.find(7))

opportunity = Opportunity.new(title:"Ajudar moradores de rua", description:"Forevis aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Copo furadis é disculpa de babadis, arcu quam euismod magna, bibendum egestas augue arcu ut est. Etiam ultricies tincidunt ligula, sed accumsan sapien mollis et. Delegadis gente finis.", address_id:9, ngo_id:1, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(3))
opportunity.causes.push(Cause.find(1))
opportunity.causes.push(Cause.find(2))
opportunity.causes.push(Cause.find(5))
opportunity.causes.push(Cause.find(8))

opportunity = Opportunity.new(title:"Dar banho em cachorros", description:"In sit amet mattis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis. Pellentesque viverra accumsan ipsum elementum gravida. Quisque vitae metus id massa tincidunt iaculis sed sed purus. Vestibulum viverra lobortis faucibus. Vestibulum et turpis.", address_id:10, ngo_id:1, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))
opportunity.causes.push(Cause.find(1))
opportunity.causes.push(Cause.find(5))

opportunity = Opportunity.new(title:"Cursos de computação", description:"Vitis e adipiscing enim. Nam varius eleifend orci, sed viverra nisl condimentum ut. Donec eget justo enim. Atirei o pau no gatis.", address_id:11, ngo_id:4, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(1))
opportunity.skills.push(Skill.find(6))
opportunity.skills.push(Skill.find(8))
opportunity.causes.push(Cause.find(4))
opportunity.causes.push(Cause.find(6))
opportunity.causes.push(Cause.find(8))

opportunity = Opportunity.new(title:"História de Cachorro", description:"O projeto nasceu da percepção do quanto os cães marcam nossas vidas e são capazes de transformar realidades com sua simples presença. Este é o espaço onde as pessoas poderão dividir e eternizar essas experiências que falam sobre isso: a relação entre cães, pessoas e amor.", address_id:12, ngo_id:1, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))
opportunity.causes.push(Cause.find(1))
opportunity.causes.push(Cause.find(2))
opportunity.causes.push(Cause.find(8))

opportunity = Opportunity.new(title:"Apoio Pedagógico", description:"A partir de uma análise do perfil de cada beneficiado, o voluntário deverá, junto à ONG e ao beneficiado, estruturar a trilha de desenvolvimento educacional a ser percorrida por este e realizar o acompanhamento periódico do desempenho e da frequência, mantendo-se em contato com os professores de cada curso (dos quais os beneficiados participam).", address_id:13, ngo_id:5, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(8))
opportunity.causes.push(Cause.find(1))

opportunity = Opportunity.new(title:"Cuidados Veterinários Felinos", description:"Ajude a Catland a conseguir realizar esse sonho de ver todos os gatos livres dos maus tratos e abandono! O voluntário de cuidados veterinários terá as seguintes atribuições: - Trabalho voluntario diurno e noturno. - Observação diária da saúde dos resgatinhos - Administração de Medicação oral - Administração de Medicação injetável - Realização de curativos.", address_id:14, ngo_id:1, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(5))
opportunity.skills.push(Skill.find(10))
opportunity.causes.push(Cause.find(2))

opportunity = Opportunity.new(title:"Ajuda com construção de casas", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mauris lectus, non scelerisque augue. Aenean justo massa.", address_id:15, ngo_id:6, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(4))
opportunity.skills.push(Skill.find(9))
opportunity.causes.push(Cause.find(5))
opportunity.causes.push(Cause.find(6))

opportunity = Opportunity.new(title:"Precisa-se de ajuda para limpar terreno", description:"Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.", address_id:16, ngo_id:6, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(9))
opportunity.causes.push(Cause.find(3))
opportunity.causes.push(Cause.find(4))

opportunity = Opportunity.new(title:"Precisa-se de profissional de saúde", description:"Paisis, filhis, espiritis santis. Mé faiz elementum girarzis. Pellentesque viverra accumsan ipsum elementum gravidis.", address_id:17, ngo_id:3, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(2))
opportunity.causes.push(Cause.find(8))

opportunity = Opportunity.new(title:"Precisa-se de cozinheiro", description:"Atirei o pau no gatis. Viva Forevis aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Copo furadis é disculpa de babadis, arcu quam euismod magna, bibendum egestas augue arcu ut est.", address_id:18, ngo_id:2, vacancies:30)
opportunity.save
opportunity.skills.push(Skill.find(3))
opportunity.causes.push(Cause.find(3))
opportunity.causes.push(Cause.find(1))


end