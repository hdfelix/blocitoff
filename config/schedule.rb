#Delete all expired items from TODO lists
every 24.hours do
	rake "delete_items", environment: 'development'
end
