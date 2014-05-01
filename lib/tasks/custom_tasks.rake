desc "Delete items that are older than 7 days"
task delete_items: :environment do
	#For Testing
	#Todo.create(description: "Rake created", created_at: 8.days.ago)
	#Todo.create(description: "Rake created", created_at: 8.days.ago)
	#Todo.create(description: "Rake created", created_at: 8.days.ago)
	#Todo.create(description: "Rake created", created_at: 8.days.ago)

	print "\nVerifying #{Todo.all.count} tasks: "
  count = 0
	
	Todo.all.each do |task|
		if task.expired?
			print 'D'
			count += 1 if task.destroy
		else
			print "."
		end
	end
	puts "\n#{count} task(s) were destroyed.\n\n"
end
