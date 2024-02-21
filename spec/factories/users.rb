FactoryBot.define do
    factory :user do
      nickname {"ABC"}
      email {Faker::Internet.email}
      password                 { 'T1' + Faker::Internet.password(min_length: 4) }
      password_confirmation   { password }
      last_name{"山田"}
      first_name{"太郎"}
      ruby_last_name{"ヤマダ"}
      ruby_first_name{"タロウ"}
      birthday{"19890723"}
    end
  end 
  
