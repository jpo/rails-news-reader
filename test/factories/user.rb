FactoryGirl.define do
  factory :josh, class: User do
    first_name 'Josh'
    last_name 'O\'Rourke'
    email 'josh@example.org'
    password 'p@ssw0rd'
    encrypted_password { User.new.send(:password_digest, 'p@ssw0rd') }
  end
end
