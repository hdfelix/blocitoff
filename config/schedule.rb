#Delete all expired items from TODO lists
every 2.hours do
	rake "delete_items"
end
