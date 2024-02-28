ServiceCategory.destroy_all
Service.destroy_all
User.destroy_all

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
  first_name = email.split("@").first.capitalize # Extracting first name from email
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    first_name: first_name,
  )
end

puts "Users created successfully! 🎉"

puts "User roles...📋"
# Add roles to users
User.all.each do |user|
  role = [:client, :handyman].sample # Randomly assign either :client or :handyman role
  user.add_role(role)
end
puts "User roles added successfully! 🎉"
