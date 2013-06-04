module UsersHelper
  def my_name
    if current_user == @user
      my_name = 'My '
    else
      my_name = (@user.name + "'s ").capitalize
    end

  end
end
