###################################################################################################
# Copyright (c) 2024, XTools by Patrick Studer, Switzerland (https://github.com/patrick-studer)
###################################################################################################

###################################################################################################
# Run test (package test_ipi)
###################################################################################################

# Uninstall the app (in case it already exists)
::tclapp::support::appinit::unload_app  "xtools::ip_packager" "ip_packager"

# Start the unit tests
set test_dir [file normalize [file dirname [info script]]]

puts "== Test directory: ${test_dir}"

puts "   == External Packaging Demo:"
source [file join $test_dir "test_ipi" "package" "package_externally.tcl"]

puts "   == Internal Packaging Demo:"
source [file join $test_dir "test_ipi" "package" "package_internally.tcl"]

# Uninstall the app
::tclapp::support::appinit::unload_app  "xtools::ip_packager" "ip_packager"

return 0

###################################################################################################
# EOF
###################################################################################################
