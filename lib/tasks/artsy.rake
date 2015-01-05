namespace :artsy do
  desc "Add an artist from Artsy API"
  task :add_artist, :name do |t, args|
    artist_name = String(args[:name])
    new_artist = RetrieveArtist.new(artist_name)
    new_artist.update_record
    puts "Artist added!"
  end
end
