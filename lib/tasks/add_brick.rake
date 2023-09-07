desc "Determine highest voted brick and delete others"
task add_brick: [:environment] do
  # Connect to your database
  # ActiveRecord::Base.establish_connection "the_wall_#{Rails.env}".to_sym
  puts "Running cron now #{Time.now}"

  # Retrieve records
  bricks = Brick.all

  # Determine the most upvoted brick
  most_upvoted_brick = bricks.max_by { |brick| brick.get_upvotes.size }
  puts "Most upvoted Brick is #{most_upvoted_brick}"

  # Delete non-upvoted bricks
  bricks.each do |brick|
    unless brick == most_upvoted_brick
      brick.destroy
    end
  end
end
