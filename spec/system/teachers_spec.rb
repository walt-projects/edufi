require 'rails_helper'

RSpec.describe 'Teachers Management', type: :system do
  describe 'visiting the index page' do
    let!(:teacher_1) { create(:teacher) }
    let!(:teacher_2) { create(:teacher) }

    specify do
      visit teachers_url

      expect(page).to have_text('Teachers')
      expect(page).to have_text(teacher_1.full_name)
      expect(page).to have_text(teacher_2.full_name)
    end
  end

  describe 'creating a teacher' do
    let!(:school) { create(:school) }

    specify do
      visit teachers_url
      click_on 'New Teacher'

      fill_in 'First name', with: 'Nice'
      fill_in 'Last name', with: 'Teacher'
      fill_in 'School', with: school.id
      click_on 'Create Teacher'

      expect(page).to have_text('Teacher was successfully created')
      expect(page).to have_text('First name: Nice')
      expect(page).to have_text('Last name: Teacher')
    end
  end

  describe 'updating a teacher' do
    let!(:teacher) { create(:teacher) }
    let(:new_teacher_first_name) { 'Better' }

    specify do
      visit teachers_url
      click_on 'Edit', match: :first

      fill_in 'First name', with: new_teacher_first_name
      click_on 'Update Teacher'

      expect(page).to have_text('Teacher was successfully updated')
      expect(page).to have_text('First name: Better')
      expect(page).to have_text("Last name: #{teacher.last_name}")
    end
  end

  describe 'destroying a teacher', js: true do
    let!(:teacher) { create(:teacher) }

    specify do
      visit teachers_url

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('Teacher was successfully destroyed')
    end
  end
end
