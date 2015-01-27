require 'net/smtp'

class SendMail
		def initialize(emailD,emailE,domain,port,host,user,pass,method)
			@emailD = emailD
			@emailE = emailE
			@domain = domain
			@port = port
			@host = host
			@user = user
			@pass = pass
			@method = method
		end
		def send(tabCo)
			message = "From: LoginAttempsInfo" + @emailE + "\r\n"
			message << "To: You " + emailD + "\r\n"
			message << "Subject: Login Attemps of" + Time.now "\r\n"
			message << "\r\n"
				tabCo.each do |LogAtt|
					message << LogAtt.puts() + "\r\n"
				end
			case @method
				when "plain"
					stmp = Net::SMTP.start(@domain, @port, @host, @user, @pass :plain)
				when "login"
					stmp = Net::SMTP.start(@domain, @port, @host, @user, @pass :login)
				when "cram_md5"
					stmp = Net::SMTP.start(@domain, @port, @host, @user, @pass :cram_md5)
				else 
					puts("Connection method incorrect.")
					return
			end
			smtp.send_message message, @emailE, emailD
			stmp.finish
		end
end