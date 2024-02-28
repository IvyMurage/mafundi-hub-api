ServiceCategory.destroy_all
Service.destroy_all
User.destroy_all
Client.destroy_all
Handyman.destroy_all
Task.destroy_all

# Reset primary key sequences
ActiveRecord::Base.connection.reset_pk_sequence!("locations")
ActiveRecord::Base.connection.reset_pk_sequence!("handymen")
ActiveRecord::Base.connection.reset_pk_sequence!("Tasks")
ActiveRecord::Base.connection.reset_pk_sequence!("clients")
ActiveRecord::Base.connection.reset_pk_sequence!("service_categories")
ActiveRecord::Base.connection.reset_pk_sequence!("services")
ActiveRecord::Base.connection.reset_pk_sequence!("users")

puts "Services categories ..."

# Seed 20 Service Categories with Image URLs
service_categories_data = [
  { category_name: "Electrical", services: ["Light Fixture Installation", "Electrical Wiring Repair", "Outlet Installation"] },
  { category_name: "Plumbing", services: ["Leak Repair", "Pipe Installation", "Drain Cleaning"] },
  { category_name: "HVAC", services: ["AC Installation", "Heating System Repair", "Vent Cleaning"] },
  { category_name: "Carpentry", services: ["Custom Furniture", "Door Installation", "Shelving Installation"] },
  { category_name: "Painting", services: ["Interior Painting", "Exterior Painting", "Wallpaper Installation"] },
  { category_name: "Cleaning", services: ["Window Cleaning", "Power Washing", "Gutter Cleaning"] },
  { category_name: "Landscaping", services: ["Lawn Mowing", "Tree Planting", "Garden Design"] },
  { category_name: "Pest Control", services: ["Insect Extermination", "Rodent Control", "Termite Inspection"] },
  { category_name: "Appliance Repair", services: ["Refrigerator Repair", "Washer Repair", "Dishwasher Repair"] },
  { category_name: "Roofing", services: ["Roof Repair", "Shingle Replacement", "Roof Inspection"] },
  { category_name: "Flooring", services: ["Hardwood Installation", "Tile Installation", "Carpet Replacement"] },
  { category_name: "Window Installation", services: ["Window Replacement", "Window Repair", "Skylight Installation"] },
  { category_name: "Door Repairs", services: ["Door Frame Repair", "Lock Replacement", "Screen Door Installation"] },
  { category_name: "Drywall Installation", services: ["Drywall Repair", "New Drywall Installation", "Plastering"] },
  { category_name: "Masonry", services: ["Bricklaying", "Stone Path Installation", "Chimney Repair"] },
  { category_name: "Deck Building", services: ["Deck Construction", "Deck Repair", "Pergola Installation"] },
  { category_name: "Fence Installation", services: ["Wood Fence Installation", "Chain Link Installation", "Fence Repair"] },
  { category_name: "Security Systems", services: ["Alarm System Installation", "CCTV Installation", "Smart Lock Installation"] },
  { category_name: "Smart Home Setup", services: ["Smart Thermostat Installation", "Home Automation", "Smart Lighting Setup"] },
  { category_name: "Gutter Cleaning", services: ["Gutter Maintenance", "Gutter Guard Installation", "Downspout Cleaning"] },
]

service_categories_data.each do |category_data|
  category = ServiceCategory.create(category_name: category_data[:category_name])
  category_data[:services].each do |service_name|
    Service.create(service_name: service_name, service_category: category)
  end
end

puts "Seeds created successfully!"

puts "***********************************************************************************************"

# create users
puts "Creating users...👨‍💼"
emails = [
  "john@example.com",
  "jane@example.com",
  "michael@example.com",
  "emily@example.com",
  "david@example.com",
  "emma@example.com",
  "james@example.com",
  "olivia@example.com",
  "daniel@example.com",
  "sophia@example.com",
]

password = "password" # Common password for all users

emails.each do |email|
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
  )
end

puts "Users created successfully! 🎉"

puts "***********************************************************************************************"

puts "User roles...📋"
# Add roles to users
User.all.each do |user|
  role = [:client, :handyman].sample # Randomly assign either :client or :handyman role
  user.add_role(role)
end
puts "User roles added successfully! 🎉"

puts "***********************************************************************************************"

puts "Creating clients...👩‍💼"

# Create 10 clients
# require "faker"
# require "faker/phone_number"

# Retrieve the first 5 users
users = User.limit(5)

# Define sample Kenyan locations
kenyan_locations = [
  { county: "Nairobi", city: "Nairobi", country: "Kenya" },
  { county: "Mombasa", city: "Mombasa", country: "Kenya" },
  { county: "Kisumu", city: "Kisumu", country: "Kenya" },
  { county: "Nakuru", city: "Nakuru", country: "Kenya" },
  { county: "Eldoret", city: "Eldoret", country: "Kenya" },
]

kenyan_location = [
  { city: "Nairobi", county: "Nairobi", country: "Kenya" },
  { city: "Mombasa", county: "Mombasa", country: "Kenya" },
  { city: "Kisumu", county: "Kisumu", country: "Kenya" },
  { city: "Nakuru", county: "Nakuru", country: "Kenya" },
  { city: "Eldoret", county: "Uasin Gishu", country: "Kenya" },
  { city: "Kakamega", county: "Kakamega", country: "Kenya" },
  { city: "Meru", county: "Meru", country: "Kenya" },
  { city: "Nyeri", county: "Nyeri", country: "Kenya" },
  { city: "Kisii", county: "Kisii", country: "Kenya" },
  { city: "Thika", county: "Kiambu", country: "Kenya" },
# Add more locations as needed
]

# Iterate over users and create clients with real phone numbers and Kenyan locations
users.each do |user|
  Client.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    user: user,
    location_attributes: kenyan_location.sample,
  )
end

puts "Clients created successfully! 🎉"

puts "***********************************************************************************************"

puts "Creating handymen...👨‍🔧"
# :first_name,
#                   :last_name,
#                   :title,
#                   :description,
#                   :phone_number,
#                   :user_id,
#                   :service_id,
#                   :media_url,
#                   :year_of_experience,
#                   :availability,
#                   handyman_skills: [],
#                   location_attributes: [:city, :county, :country]

# Create 5 handymen
# Retrieve the last 5 users

availability = [true, false]
handyman_skills = [
  "Plumbing",
  "Electrical Wiring",
  "Carpentry",
  "Painting",
  "HVAC Repair",
  "Tiling",
  "Roofing",
  "Landscaping",
  "Appliance Repair",
  "General Maintenance",
  "Drywall Installation",
  "Window Installation",
  "Flooring Installation",
  "Deck Building",
  "Fence Repair",
  "Gutter Cleaning",
  "Concrete Work",
  "Masonry",
  "Siding Installation",
  "Kitchen Remodeling",
  "Bathroom Remodeling",
  "Furniture Assembly",
  "Door Installation",
  "Locksmithing",
  "Window Cleaning",
  "Pressure Washing",
  "Drain Cleaning",
  "Pest Control",
  "Home Security Installation",
  "Solar Panel Installation",
  "Interior Design",
  "Home Theater Installation",
  "Cabinet Installation",
  "Staircase Repair",
  "Shelving Installation",
  "Ceiling Fan Installation",
  "Garage Door Repair",
  "Carpet Cleaning",
  "Fireplace Installation",
  "Waterproofing",
  "Tree Trimming",
  "Deck Staining",
  "Wallpaper Installation",
  "Furniture Refinishing",
  "Skylight Installation",
  "Basement Waterproofing",
  "Bathtub Refinishing",
  "Storm Damage Repair",
  "Swimming Pool Maintenance",
  "Welding",
  "Epoxy Flooring Installation",
]

users = User.last(5)
users.each do |user|
  Handyman.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: Faker::Job.title,
    description: Faker::Lorem.sentence(word_count: rand(10..20)),
    phone_number: Faker::PhoneNumber.cell_phone,
    user: user,
    service: Service.all.sample,
    handyman_skills: handyman_skills.sample(rand(1..5)),
    year_of_experience: rand(1..20),
    availability: availability.sample,
    location_attributes: kenyan_location.sample,
  )
end

puts "Handymen created successfully! 🎉"

puts "***********************************************************************************************"

puts "Creating tasks...📝"
# Create 20 tasks
# Retrieve the first 10 clients
clients = Client.limit(5)

# Define sample task descriptions
# Define real task responsibilities
task_responsibilities = [
  "Fix leaky faucet in the kitchen and bathroom",
  "Install new electrical outlets in the living room",
  "Build custom bookshelves for the home office",
  "Paint the exterior walls of the house",
  "Repair air conditioning unit and ensure proper cooling",
  "Tile the floor and walls of the bathroom",
  "Replace damaged roof shingles",
  "Design and plant a garden in the backyard",
  "Repair malfunctioning refrigerator and restore cooling",
  "Perform routine maintenance checks on home appliances",
]

# Generate seed data for tasks
5.times do
  client_id = rand(1..5) # Assuming you have 5 clients seeded
  10.times do
    Task.create!(
      job_title: Faker::Job.title,
      task_description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
      client: Client.find(client_id),
      job_price: rand(10..100),
      service_id: rand(1..10), # Assuming you have 10 services seeded
      available: [true, false].sample,
      instant_booking: [true, false].sample,
      duration_label: ["1 hour", "2 hours", "3 hours", "Half-day", "Full-day"].sample,
      task_responsibilities: task_responsibilities.sample(rand(1..3)),
      location_attributes: kenyan_location.sample,
    )
  end
end

puts "Tasks created successfully! 🎉"

puts "***********************************************************************************************"

puts "Seeds created successfully! 🎉"
