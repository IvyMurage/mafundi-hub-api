ServiceCategory.destroy_all
Service.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!("service_categories")
ActiveRecord::Base.connection.reset_pk_sequence!("services")

puts "Services categories ..."
service_categories = [
  { category_name: "Plumbing", image_url: "https://res.cloudinary.com/dhpmstfkj/image/upload/v1706873925/mafundi_service_category/plumbering_vzjzyd.jpg" },
  { category_name: "Electrical", image_url: "https://res.cloudinary.com/dhpmstfkj/image/upload/v1706873926/mafundi_service_category/electrician_envogz.jpg" },
  { category_name: "Carpentry", image_url: "https://res.cloudinary.com/dhpmstfkj/image/upload/v1706873925/mafundi_service_category/carpentry_w3xcfa.jpg" },
  { category_name: "Painting", image_url: "https://res.cloudinary.com/dhpmstfkj/image/upload/v1706874319/mafundi_service_category/painter_d6u3tn.jpg" },
  { category_name: "Cleaning", image_url: "https://res.cloudinary.com/dhpmstfkj/image/upload/v1706873925/mafundi_service_category/cleaning_ivz85h.jpg" },
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
