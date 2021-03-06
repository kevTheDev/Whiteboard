module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
	when /own whiteboard (\d+)/
	  '/boards/'+ $1 + '?token=' + Board.find($1).token
	
	when /view whiteboard (\d+)/
	  '/boards/'+ $1
	  
	when /view gallery (\d+)/
	  '/galleries/'+ $1
	  
	when /view gallery page/
		'/galleries'
	
	when /view next gallery page/
		'/galleries?offset=6&sort=byDate'
	
	when /collaborate on whiteboard (\d+)/
	  '/boards/'+ $1 + '?token=' + Board.find($1).layers[1].token
	
	when /restore whiteboard (\d+)/
		'/boards/'+ $1 + '?token=' + Board.find($1).token
	  	
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
