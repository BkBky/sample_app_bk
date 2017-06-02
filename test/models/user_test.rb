require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # es clase sirve para validar 
  # configuración del bjeto user
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
    	             password: "foobar", password_confirmation: "foobar")
  end
  
  # valida @user
  test "should be valid" do
  	# assert es un metodo, y si es exitoso, regresa true, si no, false.
  	assert @user.valid?
  end
  
  # valida que nombre no esté en blanco
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  # valida que email no esté en blanco
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end


  test "email addresses should be unique" do
  	#esta es una validación extra para no duplicar los correos
    duplicate_user = @user.dup
    # .upcase pasa el correo a mayúsculas. en el modelo usamos uniqueness: { case_sensitive: false }, quien no permite correo con mayusculas y minusculas combinadas
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  

end
