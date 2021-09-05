Trestle.resource(:users) do
  menu do
    item :users, icon: 'fa fa-star'
  end

  # Customize the table columns shown on the index view.

  table do
    column :email
    column :role
    column :created_at, align: :center
    actions
  end

  # Customize the form fields shown on the new/edit views.

  form do
    text_field :email

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end

  # params do |params|
  #   params.require(:user).permit(:email, ...)
  # end
end
