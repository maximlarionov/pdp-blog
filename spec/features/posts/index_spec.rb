require 'rails_helper'

feature 'See Posts' do
  let(:user) { create(:user, :confirmed) }
  let(:another_user) { create(:user, :confirmed) }

  let!(:post) { create(:post, user: user, title: "My Post") }
  let!(:my_private_post) { create(:private_post, user: user, title: "Others don't see") }
  let!(:another_private_post) { create(:private_post, user: another_user, title: "U don't see") }

  before do
    login_as user

    visit posts_path
  end

  scenario "I see posts#index page" do
    expect(current_path).to eq posts_path
    expect(page).to have_content("My Post")
  end

  scenario "And I don't see other users private posts" do
    expect(page).not_to have_content("U don't see")
  end

  scenario "And I can see my private posts" do
    expect(page).to have_content("Others don't see")
  end

  describe ".pagination" do
    context "when there are more than 3 posts" do
      let!(:posts) { create_list(:post, 4, user: user) }

      scenario "I can see pagination" do
        visit posts_path

        within('.paginator') do
          expect(page).to have_css(".pagination")
        end
      end
    end

    context "when there are 3 or less posts" do
      scenario "I don't see pagination" do
        within('.paginator') do
          expect(page).not_to have_css(".pagination")
        end
      end
    end
  end
end
