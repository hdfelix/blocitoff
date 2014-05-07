desc "Delete items that are older than 7 days"
task delete_items: :environment do
	#For Testing 2 of these should delete
#	Todo.create(description: "Rake created", created_at: 5.days.ago)
#	Todo.create(description: "Rake created", created_at: 6.days.ago)
#	Todo.create(description: "Rake created", created_at: 9.days.ago)
#	Todo.create(description: "Rake created", created_at: 10.days.ago)

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
