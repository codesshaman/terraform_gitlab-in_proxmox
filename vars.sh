#!/bin/bash
file=vars.tf

OK="\033[32;01m"
NO_COLOR="\033[0m"

create_vars(){

    if [ -f "$file" ]; then
        rm "$file"
    fi
    touch "$file"
    echo "variable "ssh_key" {" > "$file"
    echo -e "$OK Enter your public ssh key for access to vm: $NO_COLOR"
    read ssh
    printf '    default = "%s"\n' "$ssh" >> "$file"
    echo "}" >> "$file"
    echo "variable "proxmox_host" {" >> "$file"
    echo -e "$OK Enter the hostname for vm: $NO_COLOR"
    read host
    printf '    default = "%s"\n' "$host" >> "$file"
    echo "}" >> "$file"
    echo "variable "template_name" {" >> "$file"
    echo -e "$OK Enter the name of existing vm template: $NO_COLOR"
    read template
    printf '    default = "%s"\n' "$template" >> "$file"
    echo "}" >> "$file"

}

if [ -f "$file" ]; then
    echo "File is exists. Continue? (y/n)"
    read desition
    if [ "$desition" = "y" ] || [ "$desition" = "Y" ] || [ "$desition" = "Yes" ] || [ "$desition" = "YES" ] || [ "$desition" = "yes" ]; then
        create_vars
    else
        echo "Break"
    fi
else
    create_vars
fi

