require 'csv'
text = ''

list_of_users = []

csv = CSV.read('train.csv')
csv.each do |user|
	if !user[1].nil?

		if !list_of_users.include? user[0]
			list_of_users << user[0]
		end
	end
end



File.open('list_of_users.csv', 'w') {|f| f.write(list_of_users.join(",\n"))}



# text=File.open('short_expanded_user_friends.csv').read
# output_of_gsub = text.gsub!(/,/, "")
# File.open('test_file', "w") {|file| file.puts output_of_gsub}