require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
  
  
  def setup
    @user = User.new(name: "John Cena", email: "wwe@hotmail.com", password: "catmab", password_confirmation: "catmab")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "name should be present" do
    @user.name = "    "
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end
  
  test "name should be 50 chars or less" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email 255 chars or less" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "emails should be valid" do 
    valid_emails = %w[fintansn@gmail.com dog+-_@eircom.net maSSgy44.ca@dog.ie]
      valid_emails.each do |emails|
        @user.email = emails
        assert @user.valid?, "#{valid_emails.inspect} not valid"
      end
    end
    
    test "emails that are not valid" do
      invalid_emails = %w[cat@dog fintan@mat+cat.com hello@man,com superslooper.com, dog@gmail..com]
      invalid_emails.each do |invalid|
        @user.email = invalid
        assert_not @user.valid?, "#{invalid_emails.inspect} is invalid"
      end
    end
    
      test "ensure email is unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "password must be certain length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
  test "password cant be empty spaces" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  
    
  
  
  

  
end
