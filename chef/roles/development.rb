name "development"

# list of recipes to run
run_list(
	"recipe[apt]",
	"recipe[apache2]",
	"recipe[apache2::mod_php5]",
	"recipe[apache2::mod_rewrite]",
	"recipe[mysql::server]",
	"recipe[mysql::client]",
	"recipe[php]",
	"recipe[php::module_mysql]",
	"recipe[php::module_curl]",
	"recipe[php::module_gd]",
	"recipe[php::module_sqlite3]",
	"recipe[virtual-hosts]",
	"recipe[git]",
	"recipe[composer]",
)

# attributes setup
override_attributes(
	# empty mysql password
	"mysql" => {
		"server_root_password" => ""
	},
	"apache" => {
		"version" => "2.4"
	},
	# attributes for php5's php.ini file. Sets some directives to suit development enviroment
	"php" => {
		"conf_dir" => "/etc/php5/apache2",
		"directives" => {
			:display_errors => "On",
			:display_startup_errors => "On",
			:html_errors => "On",
			:short_open_tag => "Off",
			:upload_max_filesize => "50M",
			:post_max_size => "50M",
			:memory_limit => "512M"
		}
	}
)
