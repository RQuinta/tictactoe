FactoryBot.define  do
  factory :action, class: Model::Action do
    performer
    space { FactoryBot.build(:space) }
    skip_create
    initialize_with { new(attributes) }
  end
end
