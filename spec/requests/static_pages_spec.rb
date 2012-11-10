require 'spec_helper'

describe "StaticPages" do
  
  let (:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(title)) }
  end
  
  describe "Home Page" do
    before { visit root_path }
    let (:heading) { 'Sample App' }
    let (:title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text:"| Home") }
  end

  describe "Help Page" do
    before { visit help_path }
    let (:heading) { 'Help' }
    let (:title) { 'Help' }

    it_should_behave_like "all static pages"
  end
  
  describe "About Page" do
    before { visit about_path }
    let (:heading) { 'About Us' }
    let (:title) { 'About Us' }

    it_should_behave_like "all static pages"
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    let (:heading) { 'Contact' }
    let (:title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact')
      click_link "Help"
      page.should have_selector 'title', text: full_title('Help')
      click_link "Home"
      click_link "Sign up now"
      page.should have_selector 'title', text: full_title('Sign up')
      click_link "sample app"
      page.should have_selector 'title', text: full_title('')
  end
end
