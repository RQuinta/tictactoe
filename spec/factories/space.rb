FactoryBot.define  do
  factory :space, class: Model::Space do
    row  Faker::Number.between(0, 2)
    column Faker::Number.between(0, 2)
    skip_create
    initialize_with { new(attributes) }
  end
end
