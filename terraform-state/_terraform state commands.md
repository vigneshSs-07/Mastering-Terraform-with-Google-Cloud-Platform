https://developer.hashicorp.com/terraform/cli/commands/state
https://developer.hashicorp.com/terraform/cli/state/inspect

The terraform state commands enable advanced state management.


Refer to the following subcommands for additional information:

terraform state list
terraform state mv
terraform state pull
terraform state replace-provider
terraform state rm
terraform state show


Remote State
The Terraform state subcommands all work with remote state just as if it was local state. Reads and writes may take longer than normal as each read and each write do a full network roundtrip. Otherwise, backups are still written to disk and the CLI usage is the same as if it were local state.

Backups
All terraform state subcommands that modify the state write backup files. The path of these backup file can be controlled with -backup.

Subcommands that are read-only (such as list) do not write any backup files since they aren't modifying the state.

Note that backups for state modification can not be disabled. Due to the sensitivity of the state file, Terraform forces every state modification command to write a backup file. You'll have to remove these files manually if you don't want to keep them around.

Command-Line Friendly
The output and command-line structure of the state subcommands is designed to be usable with Unix command-line tools such as grep, awk, and similar PowerShell commands.

For advanced filtering and modification, we recommend piping Terraform state subcommands together with other command line tools.



### Inspect Terraform State Overview
Terraform includes some commands for reading and updating state without taking any other actions.

The terraform state list command shows the resource addresses for every resource Terraform knows about in a configuration, optionally filtered by partial resource address.

The terraform state show command displays detailed state data about one resource.

The terraform refresh command updates state data to match the real-world condition of the managed resources. This is done automatically during plans and applies, but not when interacting with state directly.

###### terraform state list command
The terraform state list command lists resources within a Terraform state.

https://developer.hashicorp.com/terraform/cli/commands/state/list


### terraform state show command
The terraform state show command shows the attributes of a single resource in the Terraform state.

https://developer.hashicorp.com/terraform/cli/commands/state/show


### terraform state list command
The terraform state list command lists resources within a Terraform state.
https://developer.hashicorp.com/terraform/cli/commands/state/list


### terraform refresh command
The terraform refresh command reads the current settings from all managed remote objects and updates the Terraform state to match. This command is deprecated. Instead, add the -refresh-only flag to terraform apply and terraform plan commands.
https://developer.hashicorp.com/terraform/cli/commands/refresh


### Recreate resources overview
This topic provides an overview of how to recreate resources in Terraform.
https://developer.hashicorp.com/terraform/cli/state/taint

By default, Terraform retrieves the latest state of each existing object and compares it with the current configuration when you run the terraform apply command. Terraform only takes action on objects that do not match the configuration.

When remote objects become damaged or degraded, such as when software running inside a virtual machine crashes but the virtual machine is still running, Terraform does not have no way to detect and respond to the problem. This is because Terraform only directly manages the machine as a whole.


### terraform taint command
The terraform taint command marks specified objects in the Terraform state as tainted. Use the terraform taint command when objects become degraded or damaged. Terraform prompts you to replace the tainted objects in the next plan you create.

https://developer.hashicorp.com/terraform/cli/commands/taint

### terraform untaint command
This topic provides reference information about the terraform untaint command.

https://developer.hashicorp.com/terraform/cli/commands/untaint


## Move Resources
Terraform's state associates each real-world object with a configured resource at a specific resource address. This is seamless when changing a resource's attributes, but Terraform will lose track of a resource if you change its name, move it to a different module, or change its provider.

There are some other situations which require explicit state modifications, though. For those, consider the following Terraform commands:

The **terraform state mv command** changes which resource address in your configuration is associated with a particular real-world object. Use this to preserve an object when renaming a resource, or when moving a resource into or out of a child module.

The terraform state mv command changes bindings in Terraform state so that existing remote objects bind to new resource instances.
https://developer.hashicorp.com/terraform/cli/commands/state/mv


The **terraform state rm command** tells Terraform to stop managing a resource as part of the current working directory and workspace, without destroying the corresponding real-world object. (You can later use terraform import to start managing that resource in a different workspace or a different Terraform configuration.)

The terraform state rm command removes the binding to an existing remote object without first destroying it. The remote object continues to exist but is no longer managed by Terraform.

https://developer.hashicorp.com/terraform/cli/commands/state/rm


The **terraform state replace-provider command** transfers existing resources to a new provider without requiring them to be re-created.
The terraform state replace-provider command replaces the provider for resources in a Terraform state.


## Recover state from backup overview
This topic provides overview information about recovering Terraform state from a backup after a disaster, such as an accident when performing other state manipulation actions.
https://developer.hashicorp.com/terraform/cli/state/recover

Workflow
Unlock Terraform: You may need to unlock Terraform when a terraform apply or other process unexpectedly terminates before Terraform can release its lock on the state backend. Unlocking Terraform overrides protectionsthat prevent two processes from modifying state at the same time. We do not recommend unlocking until you determine what caused the lock to get stuck.
This topic provides reference information about the **terraform force-unlock command**. This command manually unlocks the state for the defined configuration.
https://developer.hashicorp.com/terraform/cli/commands/force-unlock
Refer to the terraform force-unlock command documentation for additional information.

Read state data: Run the **terraform state pull command** to read the state files from the configured backend.
The terraform state pull downloads and outputs state information from a remote state or local state.
https://developer.hashicorp.com/terraform/cli/state/recover

Write state data: Run the **terraform state push command** to write state files to the configured backend.
The terraform state push command uploads a local state file to remote state or a local state. We only recommend using this command when you must manually modify the remote state.
https://developer.hashicorp.com/terraform/cli/commands/state/push
