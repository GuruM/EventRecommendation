require 'csv'
require 'pp'
text = ''

count = 0

events = {}
users = {}




puts 'reading'
csv = CSV.table('interested_user_events.csv')
puts 'done'
csv.each do |line|
	count += 1
	if !line[:user].nil?
		(events[line[:event]] ||= []) << line[:user]
		(users[line[:user]] ||= []) << line[:event]
	end
	if count % 1000 < 1
		puts count
	end
end

### CLUSTER A

puts 'reading'
csv = CSV.table('cluster_A.csv')
puts 'done'

count = 0

cluster_A_events = {};
cluster_A_user_data = {};

csv.each do |line|
	if !line[:shortname].nil?
		cluster_A_user_data[line[:refname]] = {}
		cluster_A_user_data[line[:refname]][:events] = {}

		users[line[:refname]].each do |event|
			if !cluster_A_events.has_key?(event)
				cluster_A_events[event] = 0
			end
			cluster_A_events[event] += 1
		end
	end
end


cluster_A_user_data.each_key do |user|
	sum = 0.0
	users[user].each do |event|
		sum += cluster_A_events[event]
		cluster_A_user_data[user][:events][event] = cluster_A_events[event]
	end
	cluster_A_user_data[user][:representativeness] = sum
end


# output
text = ''

text << "user, betweenness, representativeness, events,,,"
text << "\n"
text << "-,-,-"
cluster_A_events.each_key do |event|
	text << ","
	text << event.to_s
end
text << "\n"


csv.each do |line|
	text << line[:refname].to_s
	text << ", "
	text << line[:betweenness].to_s
	text << ", "
	text << cluster_A_user_data[line[:refname]][:representativeness].to_s

	cluster_A_events.each_key do |event|
		text << ","
		text << (cluster_A_user_data[line[:refname]][:events][event]||="0").to_s
	end
	text << "\n"
end

File.open('subgroup_A.analysis.csv', 'w') {|f| f.write(text)}




### CLUSTER B

puts 'reading'
csv = CSV.table('cluster_B.csv')
puts 'done'

count = 0

cluster_B_events = {};
cluster_B_user_data = {};

csv.each do |line|
	if !line[:shortname].nil?
		cluster_B_user_data[line[:refname]] = {}
		cluster_B_user_data[line[:refname]][:events] = {}

		users[line[:refname]].each do |event|
			if !cluster_B_events.has_key?(event)
				cluster_B_events[event] = 0
			end
			cluster_B_events[event] += 1
		end
	end
end


cluster_B_user_data.each_key do |user|
	sum = 0.0
	users[user].each do |event|
		sum += cluster_B_events[event]
		cluster_B_user_data[user][:events][event] = cluster_B_events[event]
	end
	cluster_B_user_data[user][:representativeness] = sum
end


# output
text = ''

text << "user, betweenness, representativeness, events,,,"
text << "\n"
text << "-,-,-"
cluster_B_events.each_key do |event|
	text << ","
	text << event.to_s
end
text << "\n"


csv.each do |line|
	text << line[:refname].to_s
	text << ", "
	text << line[:betweenness].to_s
	text << ", "
	text << cluster_B_user_data[line[:refname]][:representativeness].to_s

	cluster_B_events.each_key do |event|
		text << ","
		text << (cluster_B_user_data[line[:refname]][:events][event]||="0").to_s
	end
	text << "\n"
end

File.open('subgroup_B.analysis.csv', 'w') {|f| f.write(text)}



