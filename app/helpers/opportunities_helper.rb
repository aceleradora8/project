module OpportunitiesHelper
  def volunteer_is_interested(opportunity)
      return current_user.volunteer.interests.any? do |interest|
        interest.opportunity_id == opportunity.id
      end if !current_user.nil? && current_user.volunteer?
  end
end
