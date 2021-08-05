require 'rails_helper'

RSpec.describe 'Schools Management', type: :system do
  describe 'visiting the index page' do
    let!(:school_1) { create(:school) }
    let!(:school_2) { create(:school) }

    specify do
      visit schools_url

      expect(page).to have_text('Schools')
      expect(page).to have_text(school_1.name)
      expect(page).to have_text(school_2.name)
    end
  end

  describe 'creating a school' do
    let(:school_name) { 'Great school' }
    let!(:school) { create(:school) }

    specify do
      visit schools_url
      click_on 'New School'

      fill_in 'Name', with: school_name
      fill_in 'Description', with: 'Nice school with great students'
      fill_in 'Location', with: '123 Main St, Burke, VA 22015'
      click_on 'Create School'

      expect(page).to have_text('School was successfully created')
      expect(page).to have_text(school_name)
    end
  end

  describe 'updating a school' do
    let!(:school) { create(:school) }
    let(:new_school_name) { 'New school name' }

    specify do
      visit schools_url
      click_on 'Edit', match: :first

      fill_in 'Name', with: new_school_name
      click_on 'Update School'

      expect(page).to have_text('School was successfully updated')
      expect(page).to have_text(new_school_name)
    end
  end

  describe 'destroying a school', js: true do
    let!(:school) { create(:school) }
    let!(:student) { create(:student, school: school) }

    specify do
      visit schools_url

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('School was successfully destroyed')
    end
  end
end
