ActiveAdmin.register Contest do
  menu :label => "Concursos"


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :active, entries_attributes: [:id, :team_a_name, :team_b_name, :team_a_score, :team_b_score, :game_id, :user_id]
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
