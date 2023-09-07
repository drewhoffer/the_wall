module UsersHelper

  # Returns the Gravatar for the given user.
  def robohash_for(user, options = { size: 80 })
    robohash_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    robohash_url = "https://robohash.org/#{robohash_id}.png"
    image_tag(robohash_url, alt: user.email, class: "h-8 w-8 rounded-full")
  end
end
