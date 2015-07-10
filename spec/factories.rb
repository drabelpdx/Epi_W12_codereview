FactoryGirl.define do
  factory :admin do
    email 'admin@example.com'
    password 'f4k3p455w0rd'

  end

  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'

  end

  factory :category do
    name 'My category'
    description 'My description'

  end

  factory :project do
    name 'pizza'
    description 'Describe it'
    link 'Git'

  end

end
