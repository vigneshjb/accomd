require 'faker'
namespace :db do
  desc "Fill database with sample data" 
    task :populate => :environment do
      Rake::Task['db:reset'].invoke
      make_users
      make_accomadations
  end 
end

def make_users
  User.create!(:username => "first", :password => "abcd",
                        :password_confirmation => "abcd", :admin => true)
  99.times do |n|
    name = Faker::Internet.user_name
    name = "#{name}_#{n}" 
    password = "password"
    User.create!(:username => name,
                     :password => password,
                     :password_confirmation => password,
                     :admin => false)
  end 
end


def make_accomadations
  User.all(:limit => 6).each do |user|
    50.times do
      content = Faker::Address.street_name
      user.properties.create!(:location => content)
    end 
  end
end
