require 'rails_helper'
  describe "edits user info" do
    it "visits user page" do
      avatar_file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/features/l.jpeg", "image/jpg")
      user = User.create(email: "a@a.com", password: "a", password_confirmation: "a", id: 1, avatar: avatar_file)
      visit('/users/1/edit')
      click_on 'Delete Avatar'
      expect(page).to have_content "Avatar Destroyed!"
    end
  end
