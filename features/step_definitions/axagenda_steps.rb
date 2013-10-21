

Then /^check axagenda$/ do
  visit "http://jobenfance.local"
  sleep 5
  within('#login') do
    fill_in 'username', :with => 'Maud'
    fill_in 'password', :with => 'Minnie75'
  end
  click_button 'Connexion'
  sleep 2
  visit 'http://jobenfance.local/axagenda'
  puts page.html
end
