class LoginAttemp
	def initialize(line)
		tab1 = line.split(": ")
		tab_date = tab1[0].split(" ")
		@result = tab1[1]
		@dayN = tab_date[0]
		@dayL = tab_date[1]
		@hour = tab_date[2]
		@serverN = tab_date[3]
		@proc = tab_date[5]
	end
	def puts()
		return "Login attempt on " + @dayN + @dayL + " at " + @hour + " on " + @serverN + " with process " + @proc + " resulted in : " + @result;
	end
	
end