name = Terraform-Centos

VAR :=				# Cmd arg var
NO_COLOR=\033[0m	# Color Reset
OK=\033[32;01m		# Green Ok
ERROR=\033[31;01m	# Error red
WARN=\033[33;01m	# Warning yellow

help:
	@echo -e "$(OK)==== Все команды для конфигурации ${name} ===="
	@echo -e "$(WARN)- make init			: Terraform init command"
	@echo -e "$(WARN)- make plan			: Terraform plan command"
	@echo -e "$(WARN)- make apply			: Terraform apply command"
	@echo -e "$(WARN)- make help			: Show all commands"
	@echo -e "$(WARN)- make push			: Push changes to the github$(NO_COLOR)"

init:
	@printf "terraform init \n"
	@terraform init

plan:
	@printf "Stopping the configuration ${name}...\n"
	@terraform plan

apply:
	@printf "Create .env from source...\n"
	@terraform apply --auto-approve

push:
	@bash push.sh

.PHONY	: init plan apply push