###################################################################################################
# Copyright (c) 2024, XTools by Patrick Studer, Switzerland (https://github.com/patrick-studer)
###################################################################################################

###################################################################################################
# IP Packager Configuraton
###################################################################################################

set root_dir [file normalize [file join [file dirname [info script]] ".."]];    # IPI root directory.

###################################################################################################
# Import IP Packager Package (including Xilinx Help infrastructure)
###################################################################################################

# pkg_path must point to the app directory (folder which contains the "xtools" directory).
set pkg_path                            [file normalize [file join $root_dir "../../../.."]];
lappend auto_path                       [file join $pkg_path "xtools"]
::tclapp::support::appinit::load_app    $pkg_path "::xtools::ip_packager" "ip_packager"
::rdi::set_help_config                  -expose_namespace "ip_packager"

###################################################################################################
# Create Package Project
###################################################################################################

ip_packager::create_package_project     -prj_name       "packager_prj" \
                                        -root_dir       $root_dir \
                                        -top_file       "<TOP-FILE>"

###################################################################################################
# Identification
###################################################################################################

ip_packager::set_identification         -vendor         "<VENDOR>" \
                                        -name           "<NAME>" \
                                        -library        "<LIBRARY>" \
                                        -version        <VERSION>

###################################################################################################
# Compatibility
###################################################################################################


###################################################################################################
# File Groups
###################################################################################################

# IP Core Design Files ----------------------------------------------------------------------------
ip_packager::add_design_sources         -files          <LIST-OF-DESIGN-SOURCES>

ip_packager::add_design_constraints     -files          <LIST-OF-DESIGN-CONSTRAINTS>

# Example Design Files ----------------------------------------------------------------------------


# Documentation Files -----------------------------------------------------------------------------


# Software Driver Files ---------------------------------------------------------------------------


# Advanced Scripting Files ------------------------------------------------------------------------


###################################################################################################
# Customization Paramenters
###################################################################################################

# User Parameters ---------------------------------------------------------------------------------
ip_packager::create_user_param          -param_name             "<PARAM-NAME_p>" \
                                        -format                 "<PARAM-FORMAT" \
                                        -value                  <PARAM-VALUE>

# HDL Parameters ----------------------------------------------------------------------------------
ip_packager::set_param_config           -param_name             "<GENERIC-NAME_g>"

###################################################################################################
# Ports and Interfaces
###################################################################################################

# Create/Import User Interfaces -------------------------------------------------------------------


# Auto-Infer Interfaces ---------------------------------------------------------------------------
ip_packager::auto_infer_interface       -interface_name         "<INTERFACE-NAME>" \
                                        -vlnv                   "<INTERFACE-VLNV>"

ip_packager::add_axi_interface          -interface_name         "<INTERFACE-NAME>"

ip_packager::add_axis_interface         -interface_name         "<INTERFACE-NAME>"

ip_packager::add_interrupt_interface    -interface_name         "<INTERFACE-NAME>"

ip_packager::add_clock_interface        -interface_name         "<INTERFACE-NAME>"

ip_packager::add_reset_interface        -interface_name         "<INTERFACE-NAME>"

# Manually-Mapped Interfaces ----------------------------------------------------------------------
ip_packager::add_bus_interface          -interface_name         "<INTERFACE-NAME>" \
                                        -vlnv                   "<INTERFACE-VLNV>" \
                                        -interface_mode         "<INTERFACE-MODE>" \
                                        -port_map               <INTERFACE-MAP>

# Associate Clock/Reset ---------------------------------------------------------------------------
ip_packager::associate_interface_clock  -interface_name         "<INTERFACE-NAME>" \
                                        -clock                  "<CLOCK-NAME>"

ip_packager::associate_clock_reset      -clock                  "<CLOCK-NAME>" \
                                        -reset                  "<RESET-NAME>"

# Enablement Control ------------------------------------------------------------------------------
ip_packager::set_interface_enablement   -interface_name         "<INTERFACE-NAME>" \
                                        -dependency             "<ENABLEMENT-DEPENDENCY>"

ip_packager::set_port_enablement        -port_name              "<PORT-NAME>" \
                                        -dependency             "PORT-DEPENDENCY" \
                                        -driver_value           <PORT-DEFAULT-VALUE> \

###################################################################################################
# Adressing and Memory
###################################################################################################

# Not implemented yet

###################################################################################################
# Customization GUI
###################################################################################################

# ROOT --------------------------------------------------------------------------------------------
ip_packager::gui_set_parent     "root"

ip_packager::gui_add_page       -page_name      "<PAGE-NAME>" \
                                -display_name   "<PAGE-DISPLAY-NAME>"

    # PAGE ----------------------------------------------------------------------------------------
    ip_packager::gui_add_group      -group_name     "<GROUP-NAME>" \
                                    -display_name   "<GROUP-DISPLAY-NAME>"

        # GROUP Horizontal Example ----------------------------------------------------------------
        ip_packager::gui_add_param      -param_name     "<PARAM-NAME>" \
                                        -display_name   "<PARAM-DISPLAY-NAME>"

# -------------------------------------------------------------------------------------------------

###################################################################################################
# Review and Package
###################################################################################################

ip_packager::simulate_package_project

ip_packager::synth_package_project

ip_packager::impl_package_project

ip_packager::save_package_project

ip_packager::close_package_project      -delete         "true"

###################################################################################################
# EOF
###################################################################################################
