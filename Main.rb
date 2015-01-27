require('LoginAttemp')
require('SendMail')

time = Time.now
time = time.split(" ")
timeAct = time[1].split(":")
if(!File.exist?("config.cfg"))
do
	puts "This is the first time you run this application, we'll need some informations."
	puts "What is your mail domain (Emitor domain ex : email.your-domain.com)"
	domain = STDIN.gets
	puts "What port uses your stmp email host ? default : 25"
	port = STDIN.gets
	puts "What is your STMP hostname ? ex: stmp.your-domain.com"
	host = STDIN.gets
	puts "What is your email username ?"
	user = STDIN.gets
	puts "What is your email password ?"
	pass = STDIN.gets
	puts "With wich method would you like to connect ? ( plain / login / cram_md5 )"
	method = STDIN.gets
	puts "Wich email address should send mails ?")
	emailE = STDIN.gets
	puts "Wich email address should receive mails ?")
	emailD = STDIN.gets
	puts "At what time would you like to receive mails ?(UTC / 24h / ex 18:24 or 18:00)")
	emailT = STDIN.gets
end
else
do
#TODO : read config file & initialize variables
end
envMail = new SendMail(emailD,emailE,domain,port,host,user,pass,method)
emailT = emailT.split(":")
firstTtoWait = (timeAct[0] - emailT[0], timeAct[1] - emailT[1], timeAct[2])
if(firstTtoWait[0] < 0)
do
	firstTtoWait[0] -= emailT[0] 
end
if(firstTtoWait[1] < 0)
do
	firstTtoWait[1] -= emailT[1] 
end
sleep(firstTtoWait[0] * 3600 + firstTtoWait[1] * 60 - firstTtoWait[2])

#Tout se fait ici, envoi dun mail tout les 24 h
while()
do
	if(!File.exist?("/var/log/auth.log","r"))
	do
		file = File.open("/var/log/auth.log","r")
		fileold = File.open("/var/log/auth.olg" + Time.now.split(" ")[1] + ".log" + Time.now,"w+")
		tabLogAtt = Array.new
		file.each_line do |line|
			fileold.write(line)
			tabLogAtt.push(LoginAttemp.new(line))
		end
		envMail.send(tabLogAtt)
		file.close
		fileold.close
		File.unlink("/var/log/auth.log")
	end
	sleep(60 * 60 * 24)
end
