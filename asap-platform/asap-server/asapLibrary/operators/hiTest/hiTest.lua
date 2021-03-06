operator = yarn {
  name = "hiTest",
  timeout = 10000,
  memory = 1024,
  cores = 1,
  container = {
    instances = 1,
    --env = base_env,
    resources = {
    ["HelloWorld.sh"] = {
       file = "asapLibrary/operators/hiTest/HelloWorld.sh",
                type = "file",               -- other value: 'archive'
                visibility = "application"  -- other values: 'private', 'public'
        },
	  ["description"] = {
       file = "asapLibrary/operators/hiTest/description",
                type = "file",               -- other value: 'archive'
                visibility = "application"  -- other values: 'private', 'public'
        }
    },
    command = {
        base = "./HelloWorld.sh"
    }
  }
}