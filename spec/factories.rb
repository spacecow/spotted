Factory.define :user do |f|
  f.sequence(:name){|n| "test#{n}" }
  f.password "secret"
end
