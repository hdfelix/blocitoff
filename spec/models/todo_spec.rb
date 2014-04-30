require 'spec_helper'

describe Todo do
	it 'is valid with a description' do
		expect(create(:todo)).to be_valid
	end

	it 'is invalid without a description' do
		expect(Todo.new).to_not be_valid
	end

	describe '.expired_todo?' do
		it 'returns false for a new todo item' do
			todo = create(:todo)
			expect(todo.expired_todo?).to be_false
		end

		it 'returns true for a todo item created 7 days ago exactly' do
			todo = create(:todo, description: 'Old item', created_at: 7.days.ago)
			expect(todo.expired_todo?).to be_true
		end	
		
		it 'returns true for a todo item created over 7 days ago' do
			todo = create(:todo, description: 'Old item', created_at: 8.days.ago)
			expect(todo.expired_todo?).to be_true
		end
	end
end
