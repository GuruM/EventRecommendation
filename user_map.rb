require 'csv'
text = ''


#list_of_users = CSV.read('list_of_users.csv').flatten.compact

count = 0
user_count = 0

user_map = {}

puts 'reading'
csv = CSV.table('fixed.reduced_useful_user_friends.2.csv')
puts 'done'
csv.each do |line|
	count = count + 1
	if !line[:friend].nil?
		if !user_map.has_key?("A#{line[:user]}")
			user_count = user_count + 1
			user_map["A#{line[:user]}"] = "U#{user_count}"
		end
		if !user_map.has_key?("A#{line[:friend]}")
			user_count = user_count + 1
			user_map["A#{line[:friend]}"] = "U#{user_count}"
		end

		text << user_map["A#{line[:user]}"]
		text << ", "
		text << user_map["A#{line[:friend]}"]
		text << "\n"
	end
	if user_count % 1000 < 2
		puts user_count
	end
end

reverse_map = user_map.invert
text2 = ''
(1..user_count).each do |u|
	text2 << "U#{u}"
	text2 << ","
	text2 << reverse_map["U#{u}"]
	text2 << "\n"
end

text3 = text.gsub(",", "")
File.open('user_mapped.new.3.csv', 'w') {|f| f.write(text)}
File.open('user_map.new.3.csv', 'w') {|f| f.write(text2)}
File.open('edgelist.new.3.txt', 'w') {|f| f.write(text3)}



# text=File.open('short_expanded_user_friends.csv').read
# output_of_gsub = text.gsub!(/,/, "")
# File.open('test_file', "w") {|file| file.puts output_of_gsub}