
puts 'Seeding Development database...'


john = User.first_or_create email: "john@example.com",
                            full_name: "John Doe",
                            password: "password123",
                            password_confirmation: "password123"

drew = User.first_or_create email: "drew@example.com",
                            full_name: "drew h",
                            password: "password123",
                            password_confirmation: "password123"

elapsed = Benchmark.measure do
  drewsBricks = []
  johnsBricks = []
  10.times do |x|
    drewBrick = Brick.new(title: "Title #{x}",
                    content: "Body #{x} Words go here Idk",
                    user: drew)

    johnBrick = Brick.new(title: "Title #{x}",
                    content: "Body #{x} Words go here Idk",
                    user: john)
    drewsBricks.push(drewBrick)
    johnsBricks.push(johnBrick)
  end
  Brick.import(drewsBricks, recursive: true)
  Brick.import(johnsBricks, recursive: true)
end




puts "Seeded development db in #{elapsed.real} seconds"
