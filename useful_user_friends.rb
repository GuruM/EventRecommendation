require 'csv'
text = ''


list_of_users = CSV.read('list_of_users.csv').flatten.compact

text = ''
count = 0

csv = CSV.read('user_friends.csv')
csv.each do |user|
	count = count + 1
	if !user[0].nil?
		if list_of_users.include?(user[0])
			text << user[0]
			text << ", "
			text << user[1]
			text << "\n"
		end
	end
	if count % 1000 == 0
		puts count
	end
end

File.open('useful_user_friends.2.csv', 'w') {|f| f.write(text)}



# text=File.open('short_expanded_user_friends.csv').read
# output_of_gsub = text.gsub!(/,/, "")
# File.open('test_file', "w") {|file| file.puts output_of_gsub}