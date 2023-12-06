ServiceCategory.destroy_all
Service.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("service_categories")
ActiveRecord::Base.connection.reset_pk_sequence!("services")

puts "Services categories ..."
service_categories = [
  { category_name: "Plumbing" },
  { category_name: "Electrical" },
  { category_name: "Carpentry" },
  { category_name: "Painting" },
  { category_name: "Cleaning" },
]

service_categories.each do |service_category|
  ServiceCategory.create!(service_category)
end
puts "Servcice category seeding done"

puts "Services ..."
services = [
  { service_name: "Furniture Assembly", service_category_id: 3 },
  { service_name: "Interior Painting", service_category_id: 4 },
  { service_name: "Exterior Painting", service_category_id: 4 },
  { service_name: "Pipe Repair'", service_category_id: 1 },
  { service_name: "Pipe Installation", service_category_id: 1 },
  { service_name: "Pipe Cleaning", service_category_id: 1 },
  { service_name: "Pipe Replacement", service_category_id: 1 },
  { service_name: "Wiring Repair", service_category_id: 2 },
  { service_name: "Wiring Installation", service_category_id: 2 },
  { service_name: "Home Cleaning", service_category_id: 5 },
]

services.each do |service|
  Service.create!(service)
end

puts "Services seeding done"
