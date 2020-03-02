class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song
    self.songs.first
  end

  def get_genre_of_first_song
    get_first_song.genre
  end

  def song_count
    self.songs.count
  end

  def genre_count
    genre_array = []
    self.songs.map do |song|
      if !genre_array.include?(song.genre)
        genre_array << song.genre
      end
    end
    genre_array.count
  end
end
