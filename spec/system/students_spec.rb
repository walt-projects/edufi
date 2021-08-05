require 'rails_helper'

RSpec.describe 'Students Management', type: :system do
  describe 'visiting the index page' do
    let!(:student_1) { create(:student) }
    let!(:student_2) { create(:student) }

    specify do
      visit students_url

      expect(page).to have_text('Students')
      expect(page).to have_text(student_1.full_name)
      expect(page).to have_text(student_2.full_name)
    end
  end

  describe 'creating a student' do
    let!(:school) { create(:school) }

    specify do
      visit students_url
      click_on 'New Student'

      fill_in 'First name', with: 'Nice'
      fill_in 'Last name', with: 'Student'
      fill_in 'School', with: school.id
      click_on 'Create Student'

      expect(page).to have_text('Student was successfully created')
      expect(page).to have_text('First name: Nice')
      expect(page).to have_text('Last name: Student')
    end
  end

  describe 'updating a student' do
    let!(:student) { create(:student) }
    let(:new_student_first_name) { 'Better' }

    specify do
      visit students_url
      click_on 'Edit', match: :first

      fill_in 'First name', with: new_student_first_name
      click_on 'Update Student'

      expect(page).to have_text('Student was successfully updated')
      expect(page).to have_text('First name: Better')
      expect(page).to have_text("Last name: #{student.last_name}")
    end
  end

  describe 'destroying a student', js: true do
    let!(:student) { create(:student) }

    specify do
      visit students_url

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('Student was successfully destroyed')
    end
  end
end
