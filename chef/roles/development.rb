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
	"mysql" => {
		"server_root_password" => ""
	}
)
