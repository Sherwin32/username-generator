# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.

def format_name(first, last)
	f_return = ""
	l_return = ""
	if first[0]
		f_return = first.gsub(" ", "")
		f_return =f_return.gsub(/[^A-Za-z]/, '')
		f_return = f_return[0].downcase
	else
		f_return = ""
	end
	if last[0]
		l_return = last.gsub(" ", "")
		l_return = l_return.gsub(/[^A-Za-z]/, '')
		l_return.downcase!
	else
		last = ""
	end
  if f_return[0] && l_return[0]
  	return f_return+l_return
  else
  	return nil
  end
end

def format_year year_in
	if year_in.to_s.length == 4
	  return year_in.to_s.sub(/\d{2}/, '')
	else
		return nil
	end
end

def check_privilege i=0
	user_type = ["user", "seller", "manager", "admin"]
	i > 3 ? i=3 : i=i.floor
	return user_type[i]
end

def user_type_prefix i=0
	user_type = ["user", "seller", "manager", "admin"]
	user_prefix = ""
	i == 0 ? user_prefix="" : user_prefix=user_type[i] << "-"
	return user_prefix
end

def build_username(user_first, user_last, user_year, user_prefix=0)
  return username_format = user_type_prefix(user_prefix) << format_name(user_first, user_last) << format_year(user_year)
end

$user_list = []

def generate_username(user_first, user_last, user_year)
	new_username = build_username(user_first, user_last, user_year)
	count = 1
	return_username = new_username
	while true
		if !$user_list.include? return_username
			$user_list.push(return_username)
			break
		else
			return_username = new_username + "_#{count}"
			count += 1
		end
	end
	return return_username
end
