require 'csv'
text = ''


list_of_users = CSV.read('list_of_users.csv').flatten.compact

text = ''
count = 0

csv = CSV.read('useful_user_friends.2.csv')
csv.each do |user|
	count = count + 1
	puts user[0]
	if ((!user[1].nil?) && (list_of_users.include?(user[0])))
		user[1].split(" ").each do |friend|
			if list_of_users.include? friend
				text << user[0]
				text << ", "
				text << friend
				text << "\n"
			end
		end
	end
	if count % 1000 == 0
		puts count
	end
end

File.open('fixed.reduced_useful_user_friends.2.csv', 'w') {|f| f.write(text)}



# text=File.open('short_expanded_user_friends.csv').read
# output_of_gsub = text.gsub!(/,/, "")
# File.open('test_file', "w") {|file| file.puts output_of_gsub}