name "development"

# list of recipes to run
run_list(
	"recipe[apt]",
	"recipe[apache2]",
	"recipe[apache2::mod_php5]",
	"recipe[apache2::mod_rewrite]",
	"recipe[mysql::server]",
	"recipe[mysql::client]",
	"recipe[repositories::php54]",
	"recipe[php]",
	"recipe[php::module_mysql]",
	"recipe[php::module_curl]",
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
	# attributes for php5's php.ini file. Sets some directives to suit development enviroment
	"php" => {
		"conf_dir" => "/etc/php5/apache2",
		"directives" => {
			:display_errors => "On",
			:display_startup_errors => "On",
			:error_reporting => "E_ALL",
			:html_errors => "On",
			:log_errors => "On",
			:max_input_time => "60",
			:output_buffering => "4096",
			:register_argc_argv => "Off",
			:request_order => "GP",
			:short_open_tag => "Off",
			:track_errors => "On",
			:variables_order => "GPCS",
		}
	}
)
