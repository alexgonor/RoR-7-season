#require_relative 'user'

class Post

  def declare
    puts "Did it"
  end

end

puts User.new(name:"Igor", age: "40", email: "igor_mail").generate.declare
