Rake::Task["db:reset"]

##variaveis
address_size = 5
cause_size = 5
ngo_size = 5
opportunity_size = 5
skill_size = 5
volunteer_size = 5

#populando enderecos para ongs
(1..address_size).each do |index|
	address_ong = Address.new(address:"Av Ipiranga",cep:"90619-900",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Partenon", complement: "6681")
	address_ong.save
end

#populando enderecos para oportunidades
(1..address_size).each do |index|
	address_op = Address.new(address:"Rua oportunidades",cep:"12323-333",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil", neighbourhood: "Partenon", complement: "6681")
	address_op.save
end

#populando causas
(1..cause_size).each do |index|
	cause = Cause.new(name:"Animal #{index}")
	cause.save
end

#populando ongs
(1..ngo_size).each do |index|
	ngo = Ngo.new(name:"Patas Dadas #{index}",description:"descr",address_id:index, email: "ongarium@ongarium.com")
	ngo.save
end

#populando oportunidades
(1..opportunity_size).each do |index|
	opportunity = Opportunity.new(title:"Levar os pets para passear #{index}",description:"É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).",address_id:index+5,ngo_id:index,cause_id:index,vacancies:666, start_date: "2015-11-19", finish_date: "2015-11-25")
	opportunity.save
end

#populando skills
(1..skill_size).each do |index|
	skill = Skill.new(name:"Gostar de animais #{index}")
	skill.save
end

#populando volunteers
(1..volunteer_size).each do |index|
	volunteer = Volunteer.new(email:"email@ongarium", name:"Fulano #{index}", phone:"123456", observations:"Sou um cara legal!")
	volunteer.save
end

#buscando oportunidade do banco
op1 = Opportunity.first

#criando relacao  oportunidade e skill
Skill.all.each do |skill|
	op1.skills.push(skill) 
end

#criando relacao oportunidade e voluntário
vo = Volunteer.first
op1.volunteers.push(vo) 

#Comando para executar o script: rake db:seed