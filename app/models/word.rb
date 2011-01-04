class Word < ActiveRecord::Base
	attr_accessible :name, :personone, :persontwo, :personthree
	validates_length_of :name, :minimum => 3, :allow_nil => false
	validates_length_of :personone, :minimum => 1, :allow_nil => false
	validates_length_of :persontwo, :minimum => 1, :allow_nil => false
	validates_length_of :personthree, :minimum => 1, :allow_nil => false
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
