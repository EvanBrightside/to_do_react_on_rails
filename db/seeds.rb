if Rails.env.development?
  if User.find_by(email: 'customer@example.com').nil?
    User.create!(email: 'customer@example.com', password: 'password', password_confirmation: 'password')
  end

  u = User.find_by(email: 'customer@example.com')
  10.times do |i|
    u.todo_items.create(title: "To Do Item #{i + 1} for #{u.email}", complete: (i % 3).zero? ? true : false)
  end
end
