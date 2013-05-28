Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['660251130654892'], ENV['d512db398c7d3740ec2d66f32bee8baa'],
           :scope => 'email,read_friendlists,read_stream', :display => 'popup'
end
