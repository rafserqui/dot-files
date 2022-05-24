return {
	settings = {

    r_language_server = {
      cmd = {
         "R", "--slave", "-e", "languageserver::run()"
      }
    }
	},
}
