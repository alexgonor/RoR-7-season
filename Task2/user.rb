require_relative 'export'
#require_relative 'post'

class User
  attr_accessor :name, :age, :email
  include ExportCsv

  def initialize(name:, age:, email:)
    @name = name
    @age = age
    @email = email
  end

  def create
    @users = [@name, @age, @email]
  end

  def update(name:, age:, email:)
    @name = name
    @age = age
    @email = email
  end

  def remove
    @name = nil
    @age = nil
    @email = nil
  end

  def self.all
   ObjectSpace.each_object(self).map(&:create)
  end

  def generate(title:, body:, owner_email:)
    Post.new
  end
end

user1 = User.new(name:"Alex", age: "31", email: "my_mail")
user2 = User.new(name:"Ivan", age: "32", email: "his_mail")
#puts user1.create
#user2.remove
#user_updated = user1.update(name:"Marina", age: "28", email: "her_mail")
#puts User.all
#User.save_to_csv

class Post

  def initialize(title:, body:, owner_email:)
    @title = title
    @body = body
    @owner_email = owner_email
  end

  def create#(title:, body:, owner_email:)
    @posts = [@title, @body, @owner_email]
  end

  def update(title:, body:, owner_email:)
    @title = title
    @body = body
    @owner_email = owner_email
  end

  def remove
    @title = nil
    @body = nil
    @owner_email = nil
  end

end

#post = User.new(name:"Igor", age: "40", email: "igor_mail")
user1.generate(title: "post", body: "post_body", owner_email: "owner_email")
