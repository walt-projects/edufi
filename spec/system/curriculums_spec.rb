require 'rails_helper'

RSpec.describe 'Curriculums Management', type: :system do
  describe 'visiting the index page' do
    let!(:curriculum_1) { create(:curriculum) }
    let!(:curriculum_2) { create(:curriculum) }

    specify do
      visit curriculums_url

      expect(page).to have_text('Curriculums')
      expect(page).to have_text(curriculum_1.title)
      expect(page).to have_text(curriculum_2.title)
    end
  end

  describe 'creating a curriculum' do
    let(:curriculum_title) { 'Great curriculum' }
    let!(:curriculum) { create(:curriculum) }

    specify do
      visit curriculums_url
      click_on 'New Curriculum'

      fill_in 'Title', with: curriculum_title
      fill_in 'Description', with: 'Nice curiculum'
      fill_in 'Capacity', with: 5
      click_on 'Create Curriculum'

      expect(page).to have_text('Curriculum was successfully created')
      expect(page).to have_text(curriculum_title)
    end
  end

  describe 'updating a curriculum' do
    let!(:curriculum) { create(:curriculum) }
    let(:new_curriculum_title) { 'New curriculum title' }

    specify do
      visit curriculums_url
      click_on 'Edit', match: :first

      fill_in 'Title', with: new_curriculum_title
      click_on 'Update Curriculum'

      expect(page).to have_text('Curriculum was successfully updated')
      expect(page).to have_text(new_curriculum_title)
    end
  end

  describe 'destroying a curriculum', js: true do
    let!(:curriculum) { create(:curriculum) }

    specify do
      visit curriculums_url

      accept_confirm do
        click_on 'Destroy', match: :first
      end

      expect(page).to have_text('Curriculum was successfully destroyed')
    end
  end
end
