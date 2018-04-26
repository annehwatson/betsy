User.create!([
  {
    name: "Rick Astley",
    username: "Rickrolls",
    email: "rick@astley.com",
    password: "neverGiveUP1",
    uid: "12345",
    provider: "github"
  },
  {
    name: "Nickel Back",
    username: "We Want our Nickelback",
    email: "nickel@back.com",
    password: "photograPH1",
    uid: "23456",
    provider: "github"
  },
  {
    name: "Smash Mouth",
    username: "You're an Allstar",
    email: "smash@mouthy.com",
    password: "getyourGameOn1",
    uid: "34567",
    provider: "github"
  },
  {
    name: "Nic Cage",
    username: "A National Treasure",
    email: "nic@cage.com",
    password: "imnicCage1",
    uid: "45678",
    provider: "github"
  },
  {
    name: "Ada Lovelace",
    username: "Ada Develops It",
    email: "ada@lovelace.com",
    password: "dalove1",
    uid: "56789",
    provider: "github"
  }
])

Category.create!([
  {name: "Time Machines"},
  {name: "Pharmaceuticals"},
  {name: "Personal Care"},
  {name: "Lifestyle"}
])
Product.create!([
  {name: "Kat Von D Tattoo Concealer ", description: "A highly-pigmented, full-coverage, transfer- and water-resistant concealer. ", price: 25.0, stock: 3, url: "kat_von_d_tattoo_cover_up.jpg", user_id: 1, retired: false, categories: Category.where(name: "Personal Care")},
  {name: "Aspirin", description: "Essential medicine for your hangover", price: 14.99, stock: 5, url: "aspirin.jpg", user_id: 3, retired: false, categories: Category.where(name: "Pharmaceuticals")},
  {name: "Plan B", description: "Whoops! Now you can press reset on that one-night stand!", price: 27.49, stock: 5, url: "plan_b.jpeg", user_id: 2, retired: false, categories: Category.where(name: "Pharmaceuticals")},
  {name: "White Out", description: "", price: 3.99, stock: 6, url: "white_out.jpeg", user_id: 5, retired: false},
  {name: "Tardis Dr. Who Time Machine", description: "Time machine capable of traveling any direction through space and time — so it can visit any planet at any point in history", price: 2300000000.0, stock: 1, url: "tardis_time_machine.jpg", user_id: 5, retired: false, categories: Category.where(name: "Time Machines")},
  {name: "Attorney Services for an Unfortunate Injury", description: "Financial peril after your terrible decisions? Call our fine attorney-at-law to sue those guilty parties", price: 2399.0, stock: 1, url: "attorney_service_injury.jpeg", user_id: 1, retired: false, categories: Category.where(name: "Lifestyle")},
  {name: "Bad Credit Repair Service", description: "Fix your bad credit with our credit recovery service", price: 199.0, stock: 2, url: "credit_repair_service.jpg", user_id: 4, retired: false, categories: Category.where(name: "Lifestyle")},
  {name: "Magic Erasers", description: "When your kid decided to go crazy with the crayons on the wall, this will get it off", price: 6.99, stock: 10, url: "magic_eraser_sponges.jpeg", user_id: 3, retired: false, categories: Category.where(name: "Lifestyle")},
  {name: "Mattress Pad", description: "Don't ruin co-sleeping", price: 23.99, stock: 4, url: "mattress_pad.jpeg", user_id: 2, retired: false, categories: Category.where(name: "Personal Care")},
  {name: "After Burn Sunburn Cream", description: "Trying to forget your troubles and fell asleep in the sun? Try this to calm your blistering skin", price: 13.49, stock: 20, url: "sunburn_cream.jpg", user_id: 1, retired: false, categories: Category.where(name: "Personal Care")},
  {name: "Unbranded Tissue", description: "Do you need to dry your stress tears from dealing with Betsy git issues (did you know that you can't spell 'guilt' without 'git'?!). Did you git init but now you want to git tfo? Did you type git curse instead of git clone? Use these 1 ply, generic tissues to wipe the git blame away", price: 0.75, stock: 1000, url: "tissue.jpg", user_id: 1, retired: false, categories: Category.where(name: "Personal Care")}
])
