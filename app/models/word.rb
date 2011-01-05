class Word < ActiveRecord::Base
	attr_accessible :name, :personone, :persontwo, :personthree
	validates_length_of :name, :within => 3..35, :allow_nil => false
	validates_length_of :personone, :within => 1..15, :allow_nil => false
	validates_length_of :persontwo, :within => 1..15, :allow_nil => false
	validates_length_of :personthree, :within => 1..15, :allow_nil => false
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
