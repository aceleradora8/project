Address.delete_all
Cause.delete_all
Ngo.delete_all
Opportunity.delete_all
Phone.delete_all
Skill.delete_all

##variaveis
address_size = 5
cause_size = 5
ngo_size = 5
opportunity_size = 5
skill_size = 5

#populando enderecos para ongs
(1..address_size).each do |index|
	address_ong = Address.new(address:"Rua Abcde",cep:"12123-123",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil")
	address_ong.save
end

#populando enderecos para oportunidades
(1..address_size).each do |index|
	address_op = Address.new(address:"Rua oportunidades",cep:"12323-333",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil")
	address_op.save
end

#populando causas
(1..cause_size).each do |index|
	cause = Cause.new(name:"causa #{index}")
	cause.save
end

#populando ongs
(1..ngo_size).each do |index|
	ngo = Ngo.new(name:"Ong #{index}",description:"descr",address_id:index)
	ngo.save
end

#populando oportunidades
(1..opportunity_size).each do |index|
	opportunity = Opportunity.new(title:"oportunidade #{index}",description:"descr",address_id:index+5,ngo_id:index,cause_id:index,vacancies:666)
	opportunity.save
end

#populando skills
(1..skill_size).each do |index|
	skill = Skill.new(name:"nome skill #{index}")
	skill.save
end

#criando relacao  oportunidade e skill
op1 = Opportunity.first
sk1 = Skill.first
op1.skills.push(sk1) 