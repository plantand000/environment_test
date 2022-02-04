# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'JK Rowling'
        fill_in 'Price', with: '1.99'
        select '2017', from: 'book_published_date_1i'
        select 'May', from: 'book_published_date_2i'
        select '7', from: 'book_published_date_3i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
        click_on 'Show'
        expect(page).to have_content('harry potter')
        expect(page).to have_content('JK Rowling')
        expect(page).to have_content('1.99')
        expect(page).to have_content('2017-05-07')
    end
end