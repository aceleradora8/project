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

#populando enderecos
(1..address_size).each do |index|
	address = Address.new(id:index,address:"Rua Abcde",cep:"12123-123",city:"Porto Alegre", state:"Rio Grande do Sul",country:"Brasil")
	address.save
end

#populando causas
(1..cause_size).each do |index|
	cause = Cause.new(id:index,name:"causa #{index}")
	cause.save
end

#populando ongs
(1..ngo_size).each do |index|
	ngo = Ngo.new(id:index,name:"Ong #{index}",description:"descr",address_id:index)
	ngo.save
end

#populando oportunidades
(1..opportunity_size).each do |index|
	opportunity = Opportunity.new(id:index,title:"oportunidade #{index}",description:"descr",address_id:index,ngo_id:index,cause_id:index,vacancies:666)
	opportunity.save
end
