module Extensible
	def enhance module_name
		puts "Enhancing #{self} with class #{module_name}"
		self.send(:include, module_name)
	end
end