FactoryBot.define do
    factory :cat do
      name { 'boris' }
      description { 'just a cat' }
      image_url { 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg' }
      breed
    end
  end