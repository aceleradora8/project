#listar todas as oportunidades (nome op, nome ong, loc, causa, descr)
Opportunity.all.each do |op|
	ong = Ngo.find(op.ngo_id).name
	endereco = Address.find(op.address_id).address
	causa = Cause.find(op.cause_id).name
	puts "oportunidade = #{op.title}"
	puts "ong = #{ong}"
	puts "endereco = #{endereco}"
	puts "causa = #{causa}"
	puts "descricao = #{op.description}"
end
