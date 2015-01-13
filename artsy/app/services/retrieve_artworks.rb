class RetrieveArtworks
  attr_accessor :link, :artwork_collection
  attr_reader :artist

  def initialize(url, artist)
    @artist = artist
    artwork_link_attributes(url)
  end

  private

  def build_artworks
    artwork_collection.each do |artwork|
      create_new_artwork(artwork)
    end
    next_set_of_artworks if next_link_exist?
  end

  def next_set_of_artworks
    next_url = link["_links"]["next"]["href"]
    artwork_link_attributes(next_url)
  end

  def create_new_artwork(artwork)
    artist_params = params(artwork)
    artist.artworks.create(artist_params)
  end

  def params(artwork)
    {
      title: artwork["title"],
      date: artwork["date"],
      thumbnail: artwork["_links"]["thumbnail"]["href"]
    }
  end

  def next_link_exist?
    link["_links"]["next"]["href"]
  end

  def artwork_link_attributes(url)
    @link = ArtsyApiWrapper.get_artworks_from_artist(url)
    @artwork_collection = link["_embedded"]["artworks"]
    build_artworks unless artwork_collection.empty?
  end
end