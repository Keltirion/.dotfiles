function _tide_item_hostname

  _tide_print_item hostname $tide_example_icon' ' (cat /etc/hostname)
end

funcsave _tide_item_hostname

set --append tide_right_prompt_items hostname
