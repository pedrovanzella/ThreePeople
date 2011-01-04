class Word < ActiveRecord::Base
	attr_accessible :name
	validates_length_of :name, :in => 1..42, :allow_nil => false
	validates_length_of :personone, :in => 1..42, :allow_nil => false
	validates_length_of :persontwo, :in => 1..42, :allow_nil => false
	validates_length_of :personthree, :in => 1..42, :allow_nil => false
	before_save :sanitize!

	def sanitize!
		if !personone.scan('@').empty?
			personone = personone.sub("@", "")
		end
		
		if !persontwo.scan('@').empty?
			persontwo = persontwo.sub("@", "")
		end
		
		if !personthree.scan('@').empty?
			personthree = personthree.sub("@", "")
		end
	end
end
