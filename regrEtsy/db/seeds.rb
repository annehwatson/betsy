Category.create!([
  {name: "Time Machines"},
  {name: "Pharmaceuticals"},
  {name: "Personal Care"},
  {name: "Lifestyle"}
])
Product.create!([
  {name: "Kat Von D Tattoo Concealer ", description: "A highly-pigmented, full-coverage, transfer- and water-resistant concealer. ", price: 25.0, stock: 3, url: "../app/assets/images/kat_von_d_tattoo_cover_up.jpg", user_id: nil, retired: false},
  {name: "Aspirin", description: "Essential medicine for your hangover", price: 14.99, stock: 5, url: "../app/assets/images/aspirin.jpg", user_id: nil, retired: false},
  {name: "Plan B", description: "Whoops! Now you can press reset on that one-night stand!", price: 27.49, stock: 5, url: "../app/assets/images/plan_b.jpeg", user_id: nil, retired: false},
  {name: "White Out", description: "", price: 3.99, stock: 6, url: "../app/assets/images/white_out.jpeg", user_id: nil, retired: false},
  {name: "Tardis Dr. Who Time Machine", description: "Time machine capable of traveling any direction through space and time — so it can visit any planet at any point in history", price: 2300000000.0, stock: 1, url: "../app/assets/images/tardis_time_machine.jpg", user_id: nil, retired: false},
  {name: "Attorney Services for an Unfortunate Injury", description: "Financial peril after your terrible decisions? Call our fine attorney-at-law to sue those guilty parties", price: 2399.0, stock: 1, url: "../app/assets/images/attorney_service_injury.jpeg", user_id: nil, retired: false},
  {name: "Bad Credit Repair Service", description: "Fix your bad credit with our credit recovery service", price: 199.0, stock: 2, url: "../app/assets/images/credit_repair_service.jpg", user_id: nil, retired: false},
  {name: "Magic Erasers", description: "When your kid decided to go crazy with the crayons on the wall, this will get it off", price: 6.99, stock: 10, url: "../app/assets/images/magic_eraser_sponges.jpeg", user_id: nil, retired: false},
  {name: "Mattress Pad", description: "Don't ruin co-sleeping", price: 23.99, stock: 4, url: "../app/assets/images/mattress_pad.jpeg", user_id: nil, retired: false},
  {name: "After Burn Sunburn Cream", description: "Trying to forget your troubles and fell asleep in the sun? Try this to calm your blistering skin", price: 13.49, stock: 20, url: "../app/assets/images/sunburn_cream.jpg", user_id: nil, retired: false}
])
