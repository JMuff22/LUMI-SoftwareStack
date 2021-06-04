if os.getenv( '_LUMI_LMOD_DEBUG' ) ~= nil then
    LmodMessage( 'DEBUG: ' .. myModuleFullName() .. ', mode ' .. mode() )
end

-- -----------------------------------------------------------------------------
--
-- Initialisations
--

family( 'LUMI_SoftwareStack' )
add_property("lmod","sticky")

-- Detect the module root from the position of this module in the module tree
local module_root = myFileName():match( '(.*/modules)/SoftwareStack/.*' )

-- Detect the software stack from the name and version of the module
local stack_name    = myModuleName()
local stack_version = myModuleVersion()

-- Detect the partition that we are on using the function defined in SitePackage.lua
local partition     = detect_LUMI_partition()
if partition == nil then
    LmodError( 'Failed to detect the LUMI partition, something must be messed up pretty badly.' )
end

-- Mark the stack as either a development version of a long-term supported stack depending on its name.
if stack_version:find( '%.dev$' ) then
    add_property( 'state', 'development_stack' )
else
    add_property( 'state', 'LTS_stack' )
end

-- -----------------------------------------------------------------------------
--
-- Help information
--

whatis( 'Enables the LUMI-' .. stack_version .. ' software stack for the current partition.' )

help( [[

Description
===========
This module enables the LUMI/]] .. stack_version .. [[ software stack for the current partition.

By swapping the partition module it is possible to load software compiled for
a different partition instead, but be careful as that software may not run as
expected.
]] )

-- -----------------------------------------------------------------------------
--
-- Main module logic
--

local stack = 'LUMI-' .. stack_version
prepend_path( 'MODULEPATH', pathJoin( module_root, 'SystemPartition', stack_name, stack_version ) )

-- The following variables may be used by various modules and LUA configuration files.
-- However, take care as those variables may not be defined anymore when your module
-- gets unloaded.
setenv( 'LUMI_MODULEPATH_ROOT',    module_root )
setenv( 'LUMI_STACK_NAME',         stack_name )
setenv( 'LUMI_STACK_VERSION',      stack_version )
setenv( 'LUMI_STACK_NAME_VERSION', stack_name .. '/' .. stack_version )

-- We can even consider to use a specific modulerc file which is only read if one of the LUMI modules is
-- loaded.
-- prepend_path( 'LMOD_MODULERCFILE', pathJoin( module_root, '..', 'SystemRepo/LMOD', 'LUMIstack_modulerc.lua' ) )

load( 'partition/' .. partition )

if os.getenv( '_LUMI_LMOD_DEBUG' ) ~= nil then
    local modulepath = os.getenv( 'MODULEPATH' ):gsub( ':', '\n' )
    LmodMessage( 'DEBUG: The MODULEPATH before exiting ' .. myModuleFullName() .. ' (mode ' .. mode() .. ') is:\n' .. modulepath .. '\n' )
end