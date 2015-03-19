require 'rails_helper'
  describe "edits user info" do
    it "visits user page" do
      create_a_new_user
      click_on 'Account Settings'
      expect(page).to have_content("Edit Your Account")
      click_on 'Delete Avatar'
      expect(page).to_not have_content('l.jpeg')
    end

    it "deletes an avatar" do
      create_a_new_user
      expect(page).to have_content("test")
      click_on 'Account Settings'
      expect(page).to have_content("Edit Your Account")
      click_on 'Delete Avatar'
      expect(page).to_not have_content('l.jpeg')
    end
  end

    def create_a_new_user
      visit ('/users/new')
      expect(page).to have_content("Sign Up")
      fill_in_forms
      click_link("Sign Up")
      expect(page).to have_content("test")
    end

    def fill_in_forms
      fill_in('Email', :with => "test")
      fill_in('Password', :with => "test")
      fill_in('Password confirmation', :with => "test")
      page.attach_file('user_avatar', File.absolute_path('spec/features/l.jpeg'))
    end
