module NgosHelper
  def require_user_owner_ngo(ngo)
    return true if current_user.ngo.id == ngo.id
  end
end
