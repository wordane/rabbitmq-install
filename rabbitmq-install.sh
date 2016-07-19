######################################### 
# The following script installs RabbitMQ on Ubuntu 14
# To run the script, give it run permissions, like so
# chmod +x rabbitmq-install-script.sh
#########################################
#########################################
# Updating system default application toolset
#########################################
sudo apt-get -y update
sudo ldconfig -v
echo '<---- Updated available repo ---->'
########################################
# Now adding RabbitMQ application repo to existing available repo
#########################################
echo '<---- Adding RabbitMQ repo to list of repo ---->'
sudo echo "deb https://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
echo '<---- Repo added : Done ---->'
#########################################
# Adding the verification key to the package                                                                        
#########################################
echo '<---- Adding verification key for the package --->'
sudo curl http://www.rabbitmq-signin-key-public.asc | sudo apt-key add -
echo '<---- Verification Key added : Done ---->'
#########################################
# Updating sources with new RabbitMQ repo
#########################################
echo '<----Updating resources---->'
sudo apt-get -y udpate
sudo ldconfig -v
echo '<---- Available Repo update: Done ---->'
#########################################
# Download and install RabbitMQ
#########################################
echo '<----Download and install RabbitMQ ---->'
sudo apt-get -y install rabbitmq-server
sudo ldconfig -v
echo '<---- RabbitMQ install: Done ---->'
#########################################
# Enable RabbitMQ Management Console
#########################################
echo '<---- Enabling RabbitMQ management console ---->'
sudo rabbitmq-plugins enable rabbitmq_management
sudo ldconfig -v
echo '<---- RabbitMQ management console : Done ---->'
#########################################
# Some commands to know
#########################################
echo '<---- Few commands to know ---->'
echo '<---- To start RabbitMQ as a daemon by default ---->'
sudo chkconfig rabbitmq-server on
echo '<---- RabbitMQ Daemon added : Done ---->' 
#########################################
# Start, Stop, Restart and Status of the service 
#########################################
echo $'<---- To check the status ---->\n\t sudo service rabbitmq-server status'
sudo service rabbitmq-server status
echo $'<---- To start the service---->\n\tsudo service rabbitmq-server start'
sudo service rabbitmq-server start
echo $'<----- To stop the service---->\n\tsudo service rabbitmq-server stop'
sudo service rabbitmq-server stop
echo $'<----- To restart the service---->\n\tsudo service rabbitmq-server restart'
sudo service rabbitmq-server restart
#########################################
# Creating username and password 
#########################################
echo '<---- Creating username and password. New feature since v 3.3.1 ---->'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo rabbitmqctl set_permissions -p / test ".*" ".*" ".*"
echo '<---- Credentials created:Done ---->' 
#########################################
# Getting Reachable Location
#########################################
echo '<---- Your RabbitMQ management console is reachable at https://YOUR_IP/YOUR_DOMAIN:15672'
echo $'\n\tDefault Username:\ttest\n\tDefault Password:\ttest' 
#########################################
# End of Script 
#########################################
echo '<---- End of Script ----->'