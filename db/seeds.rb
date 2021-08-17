# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Breeds from the faker gem
breeds = ["Abyssinian", "Aegean", "American Bobtail", "American Curl", "American Shorthair", "American Wirehair", "Arabian Mau", "Asian", "Asian Semi-longhair", "Australian Mist", "Balinese", "Bambino", "Bengal", "Birman", "Bombay", "Brazilian Shorthair", "British Longhair", "British Semipi-longhair", "British Shorthair", "Burmese", "Burmilla", "California Spangled", "Chantilly-Tiffany", "Chartreux", "Chausie", "Cheetoh", "Colorpoint Shorthair", "Cornish Rex", "Cymric, or Manx Longhair", "Cyprus", "Devon Rex", "Donskoy, or Don Sphynx", "Dragon Li", "Dwarf cat, or Dwelf", "Egyptian Mau", "European Shorthair", "Exotic Shorthair", "Foldex Cat", "German Rex", "Havana Brown", "Highlander", "Himalayan, or Colorpoint Persian", "Japanese Bobtail", "Javanese", "Khao Manee", "Korat", "Korean Bobtail", "Korn Ja", "Kurilian Bobtail", "Kurilian Bobtail, or Kuril Islands Bobtail", "LaPerm", "Lykoi", "Maine Coon", "Manx", "Mekong Bobtail", "Minskin", "Munchkin", "Napoleon", "Nebelung", "Norwegian Forest Cat", "Ocicat", "Ojos Azules", "Oregon Rex", "Oriental Bicolor", "Oriental Longhair", "Oriental Shorthair", "PerFold Cat (Experimental Breed - WCF)", "Persian (Modern Persian Cat)", "Persian (Traditional Persian Cat)", "Peterbald", "Pixie-bob", "Raas", "Ragamuffin", "Ragdoll", "Russian Blue", "Russian White, Black and Tabby", "Sam Sawet", "Savannah", "Scottish Fold", "Selkirk Rex", "Serengeti", "Serrade petit", "Siamese", "Siberian", "Singapura", "Snowshoe", "Sokoke", "Somali", "Sphynx", "Suphalak", "Thai", "Tonkinese", "Toyger", "Turkish Angora", "Turkish Van", "Ukrainian Levkoy"]
breeds.each do |name|
  Breed.create(name: name)
end 