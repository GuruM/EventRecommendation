require 'csv'
text = ''


#list_of_users = CSV.read('list_of_users.csv').flatten.compact

count = 0

puts 'reading'
csv = CSV.table('train.csv')
puts 'done'
csv.each do |line|
	count = count + 1
	if !line[:user].nil?
		if line[:interested] == 1
			text << line[:user].to_s
			text << ", "
			text << line[:event].to_s
			text << "\n"
		end
	end
	if count % 1000 < 2
		puts count
	end
end

File.open('interested_user_events.csv', 'w') {|f| f.write(text)}



# text=File.open('short_expanded_user_friends.csv').read
# output_of_gsub = text.gsub!(/,/, "")
# File.open('test_file', "w") {|file| file.puts output_of_gsub}